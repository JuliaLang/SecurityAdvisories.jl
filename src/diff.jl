# Summarize the advisory files that changed between two git revisions of the repository,
# in two forms:
#   * `print_advisory_diff` reports which Advisory fields changed. See
#     scripts/diff_advisories.jl for the command-line interface.
#   * `print_search_pr_outputs` composes the search workflow's pull request title, body,
#     and recipe updates from the changed advisories. See scripts/update_pr_message.jl.
#
# The field comparisons deliberately work on each file's raw TOML frontmatter rather than
# parsed `Advisory`s because these reports describe what changed in the files themselves.

# The concrete endpoints of a `git diff`-style revision `spec`, as `(base, target)`:
# a lone revision compares against the working tree (a `nothing` target), "A..B"
# compares the two revisions, and "A...B" compares B against its merge base with A.
# As with git, an omitted range endpoint means HEAD.
function diff_endpoints(spec; dir)
    m = match(r"^(.*?)(\.{2,3})(.*)$", spec)
    m === nothing && return String(spec), nothing
    a = isempty(m[1]) ? "HEAD" : m[1]
    b = isempty(m[3]) ? "HEAD" : m[3]
    base = m[2] == "..." ? readchomp(Cmd(`git merge-base $a $b`; dir)) : String(a)
    return base, String(b)
end

# Return (status, path, old_path) triples for the files changed in the repository at `dir`;
# `old_path` is `nothing` except for renames and copies, whose `path` is the new location.
# A `target` of `nothing` compares against the working tree, including not-yet-tracked files.
function changed_files(base, target; dir)
    cmd = target === nothing ? `git diff --name-status $base` : `git diff --name-status $base $target`
    files = Tuple{Char,String,Union{Nothing,String}}[]
    for line in eachline(Cmd(cmd; dir))
        parts = split(line, '\t')
        status = parts[1][1]
        if status in ('R', 'C')  # "R093\told\tnew"
            push!(files, (status, String(parts[3]), String(parts[2])))
        else
            push!(files, (status, String(parts[2]), nothing))
        end
    end
    if target === nothing
        # `git diff` doesn't see brand-new files that haven't been added yet
        for f in eachline(Cmd(`git ls-files --others --exclude-standard`; dir))
            push!(files, ('A', f, nothing))
        end
    end
    return files
end

# The advisory id from its file path
advisory_id(path) = splitext(basename(path))[1]

# Every advisory file changed across the revision `spec` with its contents — as
# `(status, path, old content, new content)`, where the missing side of an added or
# deleted file (or any unreadable content) is `nothing` — plus the number of
# non-advisory files that also changed.
function changed_advisory_contents(spec; dir)
    base, target = diff_endpoints(spec; dir)
    files = changed_files(base, target; dir)
    mdfiles = [(st, f, old) for (st, f, old) in files if endswith(f, ".md") && startswith(f, "advisories/")]
    specs = String[]
    for (st, f, oldf) in mdfiles
        st in ('M', 'R') && push!(specs, "$base:$(something(oldf, f))")
        st == 'D' || target === nothing || push!(specs, "$target:$f")
    end
    blobs = fetch_blobs(specs; dir)
    # New content comes from the fetched blobs, or the working tree when there's no target
    root = target === nothing && !isempty(mdfiles) ? readchomp(Cmd(`git rev-parse --show-toplevel`; dir)) : ""
    newcontent(f) = target === nothing ?
        (p = joinpath(root, f); isfile(p) ? read(p, String) : nothing) :
        blobs["$target:$f"]
    contents = [(st, f,
                 st in ('M', 'R') ? blobs["$base:$(something(oldf, f))"] : nothing,
                 st == 'D' ? nothing : newcontent(f))
                for (st, f, oldf) in mdfiles]
    return contents, length(files) - length(mdfiles)
end

# Fetch many blobs through one `git cat-file --batch` process.
function fetch_blobs(specs::Vector{String}; dir)
    blobs = Dict{String,Union{String,Nothing}}()
    isempty(specs) && return blobs
    proc = open(Cmd(`git cat-file --batch`; dir), "r+")
    # Write from a separate task: writing everything up front deadlocks once
    # git's output fills the pipe buffer while we aren't reading yet.
    writer = @async begin
        for spec in specs
            println(proc, spec)
        end
        close(proc.in)
    end
    for spec in specs
        header = readline(proc)
        if endswith(header, "missing") || endswith(header, "ambiguous")
            blobs[spec] = nothing
        else
            size = parse(Int, last(split(header)))
            blobs[spec] = String(read(proc, size))
            read(proc, 1)  # trailing newline
        end
    end
    wait(writer)
    wait(proc)
    return blobs
end

# ---- element pairing heuristic for array diffs ----
# Score how plausible it is that `b` is an edited version of `a`; -Inf means don't pair.
function pair_score(a::AbstractDict, b::AbstractDict)
    n = count(kv -> isequal(get(b, kv.first, nothing), kv.second), collect(a))
    return n == 0 ? -Inf : 100.0 + n
end
function pair_score(a::AbstractString, b::AbstractString)
    lcp = 0
    for (ca, cb) in zip(a, b)
        ca == cb || break
        lcp += 1
    end
    r = 2lcp / max(length(a) + length(b), 1)
    return r >= 0.5 ? r : -Inf
end
pair_score(a, b) = typeof(a) == typeof(b) ? 0.0 : -Inf

# Multiset diff of two arrays: returns (added, dropped, changed pairs, purely reordered)
function array_diff(old::AbstractVector, new::AbstractVector)
    remaining = Dict{Any,Int}()
    for x in new; remaining[x] = get(remaining, x, 0) + 1; end
    dropped = Any[]
    for x in old
        get(remaining, x, 0) > 0 ? (remaining[x] -= 1) : push!(dropped, x)
    end
    remaining = Dict{Any,Int}()
    for x in old; remaining[x] = get(remaining, x, 0) + 1; end
    added = Any[]
    for x in new
        get(remaining, x, 0) > 0 ? (remaining[x] -= 1) : push!(added, x)
    end
    reordered = isempty(added) && isempty(dropped) && old != new

    # Greedily pair each dropped element with its most-similar added element as a "change"
    changed = Tuple{Any,Any}[]
    if !isempty(dropped) && !isempty(added)
        scores = [(pair_score(o, n), i, j) for (i, o) in enumerate(dropped) for (j, n) in enumerate(added)]
        sort!(filter!(s -> s[1] > -Inf, scores), by=first, rev=true)
        usedo, usedn = falses(length(dropped)), falses(length(added))
        for (_, i, j) in scores
            (usedo[i] || usedn[j]) && continue
            push!(changed, (dropped[i], added[j]))
            usedo[i] = usedn[j] = true
        end
        dropped, added = dropped[.!usedo], added[.!usedn]
    end
    return added, dropped, changed, reordered
end

mutable struct ArrayAgg
    files_plus::Int; files_minus::Int; files_tilde::Int
    old_elems::Int; new_elems::Int
    added::Int; dropped::Int; changed::Int
    reordered::Int
end
ArrayAgg() = ArrayAgg(0, 0, 0, 0, 0, 0, 0, 0, 0)

# Cap the per-advisory version range listing to keep huge PR bodies under GitHub's size limit
const MAX_RANGE_DETAILS = 20

# Render up to `MAX_RANGE_DETAILS` items with `f`, noting how many were elided
function print_capped(f, io, xs)
    foreach(f, first(xs, MAX_RANGE_DETAILS))
    extra = length(xs) - MAX_RANGE_DETAILS
    extra > 0 && println(io, "- …and $extra more advisories")
end

####### Markdown presentation of an advisory's version ranges

# A markdown code span, safe for use in table cells
mdcode(s) = "`" * replace(s, "`" => "'", "|" => "\\|") * "`"

ranges_str(rs) = isempty(rs) ? "(none)" : join(mdcode.(string.(rs)), ", ")

# The `(source id, "vendor:product", ranges)` triples held within an advisory's
# jlsec_sources' affected tables, sorted so equal contents compare equal
source_affected(t) = t === nothing ? Tuple{String,String,Any}[] :
    sort!([(string(get(s, "id", "?")), string(vp), ranges)
           for s in get(t, "jlsec_sources", Any[]) if s isa AbstractDict && get(s, "affected", nothing) isa AbstractDict
           for (vp, ranges) in get(s, "affected", Dict())],
          by=x->(x[1], x[2]))

"""
    used_source(frontmatter)

Determine which source's affected components were used for the advisory's affected package
ranges: the first source whose components convert to exactly the recorded ranges. Returns
its id, or `nothing` when no source's conversion matches (for example, after the component
metadata improves, or when the ranges came from more than one source).
"""
function used_source(frontmatter)
    target = Dict(string(e["pkg"]) => Set(string.(e["ranges"]))
                  for e in get(frontmatter, "affected", Any[]) if e isa AbstractDict)
    isempty(target) && return nothing
    for src in get(frontmatter, "jlsec_sources", Any[])
        src isa AbstractDict && get(src, "affected", nothing) isa AbstractDict || continue
        vpvs = [(String.(split(string(vp), ":", limit=2))..., String(r))
                for (vp, ranges) in src["affected"] if contains(string(vp), ":")
                for r in ranges]
        isempty(vpvs) && continue
        converted = affected_julia_packages("", vpvs).affected
        conv = Dict(e.pkg => Set(string.(e.ranges)) for e in converted if is_vulnerable(e))
        conv == target && return string(get(src, "id", "?"))
    end
    return nothing
end

"""
    print_version_ranges(io, id, old, new; from="")

Render one advisory's affected packages — and the upstream components they derive from —
from its TOML frontmatter `new` as a Markdown list item, annotating range changes against
the prior frontmatter `old` (`nothing` for a newly-added advisory). Extra header text (like
the source links of [`print_advisory_versions`](@ref)) may be passed via `from`, and upstream
components that map to none of the listed affected packages (per
[`packages_with_upstream_component`](@ref)) are not shown. When several sources list components,
only the source whose data was used (per `pick_used`, [`used_source`](@ref) by default)
is shown, and component ranges that fail to parse are called out — they are what the
pessimistic all-versions `*` ranges come from. Operating on the raw frontmatter allows
rendering both freshly-imported advisories (via [`to_toml_frontmatter`](@ref)) and old
revisions pulled from git (via `print_advisory_diff`).
"""
function print_version_ranges(io, id, old, new; from="", pick_used = used_source)
    aff(t) = t === nothing ? Any[] : [e for e in get(t, "affected", Any[]) if e isa AbstractDict]
    old_pkgs = Dict{String,Any}(string(get(e, "pkg", "?")) => get(e, "ranges", Any[]) for e in aff(old))
    new_affected = aff(new)
    pkgs = [string(get(e, "pkg", "")) for e in new_affected]
    components = [(src_id, vp, ranges) for (src_id, vp, ranges) in source_affected(new)
                  if any(in(packages_with_upstream_component(vp)), pkgs)]
    if !allequal(first.(components))
        # Several sources list components, but only one's data was used for the ranges
        used = pick_used(new)
        used === nothing || filter!(((src_id, _, _),) -> src_id == used, components)
    end

    function pkgline(e, indent)
        pkg = string(get(e, "pkg", "?"))
        newr = get(e, "ranges", Any[])
        oldr = get(old_pkgs, pkg, nothing)
        was = oldr === nothing ? (old === nothing ? "" : " (newly listed)") :
              isequal(oldr, newr) ? "" : string(" (was: ", ranges_str(oldr), ")")
        println(io, indent, "- **", pkg, "** at versions: ", ranges_str(newr), was)
    end

    println(io, "- ", mdcode(id), from, isempty(components) ? " for packages:" : " for upstream project(s):")
    if isempty(components)
        foreach(e -> pkgline(e, "    "), new_affected)
    else
        old_components = Dict{Any,Any}((src_id, cpe) => ranges
                                       for (src_id, cpe, ranges) in source_affected(old))
        for (src_id, cpe, newr) in components
            oldr = get(old_components, (src_id, cpe), nothing)
            was = oldr === nothing || isequal(oldr, newr) ? "" : string(" (was: ", ranges_str(oldr), ")")
            unparsed = [r for r in newr if tryparse(VersionRange, string(r)) === nothing]
            note = isempty(unparsed) ? "" : string(" — ⚠ could not parse ", ranges_str(unparsed),
                                                   "; unparseable ranges count as all versions")
            println(io, "    - **", cpe, "** (per ", src_id, ") at versions: ", ranges_str(newr), was, note)
        end
        println(io, "    - mapping to packages:")
        foreach(e -> pkgline(e, "        "), new_affected)
    end
    # Packages that were affected before but are no longer listed
    for (pkg, oldr) in sort!(collect(old_pkgs), by=first)
        any(e -> string(get(e, "pkg", "")) == pkg, new_affected) && continue
        println(io, "    - **", pkg, "**: no longer affected (was: ", ranges_str(oldr), ")")
    end
end

"""
    print_advisory_versions(io, advisory::Advisory, old=nothing)

Render one advisory's affected version ranges (with links to its sources) via
[`print_version_ranges`](@ref), annotating changes against the previously-published TOML
frontmatter `old` (`nothing` for newly-imported advisories).
"""
function print_advisory_versions(io, adv::Advisory, old=nothing; kw...)
    from = isempty(adv.jlsec_sources) ? "" :
        string(" (from:", join(" [$(src.id)]($(src.html_url))" for src in adv.jlsec_sources), ")")
    print_version_ranges(io, adv.id, old, to_toml_frontmatter(adv); from, kw...)
    println(io)
end

"""
    print_advisory_diff(io, spec; dir=pwd())

Print a summary of the Advisory field changes across the `git diff`-style revision
`spec` to `io` — a lone revision compares against the working tree, `"A..B"` compares
the two revisions, and `"A...B"` compares `B` against its merge base with `A`. Scalar
fields are reported as added/removed/changed and array fields are diffed at the element
level, with the affected version ranges of changed advisories rendered in full (via
[`print_version_ranges`](@ref)). Renamed advisories are diffed across the rename. The
report is GitHub-flavored markdown, suitable for a PR body, and the `git` commands run
against the repository at `dir`.
"""
function print_advisory_diff(io::IO, spec; dir=pwd())
    tname = contains(spec, "..") ? mdcode(spec) : string(mdcode(spec), " → working tree")
    changed, n_other = changed_advisory_contents(spec; dir)
    isempty(changed) && n_other == 0 && (println(io, "No files changed in $tname."); return)

    statuses = first.(changed)
    n_added, n_deleted = count(in(('A', 'C')), statuses), count(==('D'), statuses)
    n_modified, n_renamed = count(==('M'), statuses), count(==('R'), statuses)

    scalar_counts = Dict{Tuple{Char,String},Int}()
    array_stats = Dict{String,ArrayAgg}()
    signatures = Dict{Vector{String},Vector{String}}()  # change signature => files
    version_changes = Tuple{String,Union{Nothing,Dict},Dict}[]  # (id, old toml, new toml)
    parse_failures = String[]

    for (st, f, _, newc) in changed
        st in ('A', 'C') && newc !== nothing || continue
        toml, _ = parse_frontmatter(newc)
        toml === nothing && continue
        haskey(toml, "affected") || !isempty(source_affected(toml)) || continue
        push!(version_changes, (advisory_id(f), nothing, toml))
    end

    # Renamed files are diffed just like modifications, old content against new
    for (st, f, oldc, newc) in changed
        st in ('M', 'R') || continue
        (oldc === nothing || newc === nothing) && (push!(parse_failures, f); continue)
        old, old_body = parse_frontmatter(oldc)
        new, new_body = parse_frontmatter(newc)
        if old === nothing || new === nothing
            push!(parse_failures, f)
            continue
        end
        # summary and details are Advisory fields too; they just live in the markdown body
        for (toml, body) in ((old, old_body), (new, new_body))
            summary, details = parse_body(body)
            summary === nothing || (toml["summary"] = summary)
            details === nothing || (toml["details"] = details)
        end

        if !isequal(get(old, "affected", nothing), get(new, "affected", nothing)) ||
           !isequal(source_affected(old), source_affected(new))
            push!(version_changes, (advisory_id(f), old, new))
        end

        sig = String[]
        for key in union(keys(old), keys(new))
            o_has, n_has = haskey(old, key), haskey(new, key)
            o, n = get(old, key, nothing), get(new, key, nothing)
            o_has && n_has && isequal(o, n) && continue
            op = o_has ? (n_has ? '~' : '-') : '+'

            if o isa AbstractVector || n isa AbstractVector
                ov = o isa AbstractVector ? o : Any[]
                nv = n isa AbstractVector ? n : Any[]
                add, drop, chg, reord = op == '~' ? array_diff(ov, nv) : (nv, ov, Tuple{Any,Any}[], false)
                agg = get!(ArrayAgg, array_stats, key)
                op == '+' ? (agg.files_plus += 1) : op == '-' ? (agg.files_minus += 1) : (agg.files_tilde += 1)
                agg.old_elems += length(ov); agg.new_elems += length(nv)
                agg.added += length(add); agg.dropped += length(drop); agg.changed += length(chg)
                agg.reordered += reord
                if op == '~'
                    flags = string(isempty(add) ? "" : "+", isempty(drop) ? "" : "-", isempty(chg) ? "" : "~")
                    push!(sig, "~ $key ($(reord ? "reordered" : flags))")
                else
                    push!(sig, "$op $key")
                end
            else
                scalar_counts[(op, key)] = get(scalar_counts, (op, key), 0) + 1
                push!(sig, "$op $key")
            end
        end
        push!(get!(signatures, sort!(sig), String[]), f)
    end

    # ------- report (GitHub-flavored markdown) -------
    println(io, "**Diff ", tname, ":** ",
            length(changed), " advisory file", length(changed) == 1 ? "" : "s", " touched (",
            n_modified, " modified, ",
            n_added, " added, ", n_deleted, " deleted, ", n_renamed, " renamed)",
            n_other > 0 ? ", plus $n_other non-advisory file$(n_other == 1 ? "" : "s")" : "", ".")
    isempty(parse_failures) || println(io, "\n> ⚠️ $(length(parse_failures)) files skipped (missing/unparseable TOML fence), e.g. $(mdcode(first(parse_failures)))")

    if !isempty(scalar_counts)
        println(io, "\n### Scalar fields\n")
        println(io, "| | Field | Files |")
        println(io, "|:-:|:--|--:|")
        for ((op, path), count) in sort!(collect(scalar_counts), by=x->(-x[2], x[1][2]))
            println(io, "| $op | $(mdcode(path)) | $count |")
        end
    end

    if !isempty(array_stats)
        println(io, "\n### Array fields\n")
        println(io, "_Element-level changes; a ~changed element is a dropped element paired with its closest added one._\n")
        println(io, "| Field | Files | Elements | Changes |")
        println(io, "|:--|:--|:--|:--|")
        for (key, a) in sort!(collect(array_stats), by=x->-(x[2].files_plus + x[2].files_minus + x[2].files_tilde))
            fparts = String[]
            a.files_plus  > 0 && push!(fparts, "+$(a.files_plus)")
            a.files_minus > 0 && push!(fparts, "-$(a.files_minus)")
            a.files_tilde > 0 && push!(fparts, "~$(a.files_tilde)")
            eparts = String[]
            a.added   > 0 && push!(eparts, "$(a.added) added")
            a.dropped > 0 && push!(eparts, "$(a.dropped) dropped")
            a.changed > 0 && push!(eparts, "$(a.changed) changed")
            a.reordered > 0 && push!(eparts, "reordered in $(a.reordered) files")
            println(io, "| $(mdcode(key)) | $(join(fparts, " ")) | $(a.old_elems) → $(a.new_elems) | $(join(eparts, ", ")) |")
        end
    end

    if !isempty(version_changes)
        sort!(version_changes, by=first)
        println(io, "\n### Affected version ranges\n")
        println(io, "_Advisories whose affected packages or upstream component ranges changed._\n")
        print_capped(((id, o, n),) -> print_version_ranges(io, id, o, n), io, version_changes)
    end

    if !isempty(signatures)
        println(io, "\n### Change signatures\n")
        println(io, "_Groups of files with identical field-change sets._\n")
        for (sig, fs) in sort!(collect(signatures), by=x->-length(x[2]))
            ids = sort!(advisory_id.(fs))
            names = join(mdcode.(first(ids, 4)), ", ")
            length(ids) > 4 && (names *= ", and $(length(ids) - 4) more")
            println(io, "- **$(length(fs)) file$(length(fs) == 1 ? "" : "s")** ($names):")
            for s in sig
                println(io, "  - `$s`")
            end
        end
    end
end

#### The search workflow's pull request message ####

link_proj(proj) = string("[",rsplit(proj, "/", limit=2)[end], "](https://", proj, ")")
link_pkg(pkg) = string("[", pkg, "](https://juliaregistries.github.io/General/packages/redirect_to_repo/", pkg, ")")
meta_url(pkg) = string("https://github.com/JuliaRegistries/GeneralMetadata.jl/blob/main/metadata/", uppercase(pkg[1]), "/", pkg, ".toml")

"""
    changed_advisories(spec; dir=pwd())

Parse the advisory files that changed across the `git diff`-style revision `spec`,
returning `(; advisory, old, status)` entries with the parsed new `Advisory`, the prior
revision's TOML frontmatter (or `nothing` for new advisories), and the git status letter.
"""
function changed_advisories(spec; dir=pwd())
    contents, _ = changed_advisory_contents(spec; dir)
    changed = []
    for (st, f, oldc, newc) in contents
        st == 'D' && continue
        newc === nothing && continue
        advisory = tryparse(Advisory, newc)
        if advisory === nothing
            @warn "could not parse $f; leaving it out of the PR message"
            continue
        end
        old = oldc === nothing ? nothing : first(parse_frontmatter(oldc))
        push!(changed, (; advisory, old, status=st))
    end
    return changed
end

# The advisory's earliest source publication (or modification) date, or its own
earliest_source_time(adv) = minimum(y -> something(y.published, y.modified), adv.jlsec_sources; init=adv.modified)

# Write the multiline `body` GitHub Actions output, picking a heredoc delimiter that
# no line of the (upstream-authored) body collides with
function print_body_output(io, body)
    delim = "BODY_EOF"
    while any(==(delim), eachline(IOBuffer(body)))
        delim *= "_"
    end
    println(io, "body<<", delim)
    print(io, body)
    endswith(body, "\n") || println(io)
    println(io, delim)
end

"""
    print_search_pr_outputs(io, spec; dir=pwd(), haystack=nothing)

Write the pull request `n_changed=`, `title=`, `recipe_updates=`, and multiline `body`
outputs, composed entirely from the advisory files that changed across the `git diff`-style
revision `spec`. The optional `haystack` describes what was searched to produce the
changes; without it the body simply describes the changes themselves.
"""
function print_search_pr_outputs(io, spec; dir=pwd(), haystack=nothing)
    changed = changed_advisories(spec; dir)
    results = [c.advisory for c in changed]
    olds = Dict(c.advisory.id => c.old for c in changed)
    n_created = count(c.status in ('A', 'C') for c in changed)
    n_modified = length(changed) - n_created
    n_total = length(changed)

    # Identify unbounded JLLs whose upstream fix is known but not yet built; these
    # are actionable via an Yggdrasil recipe update (requested in a workflow step)
    recipe_updates = Dict{String, VersionString}()
    for adv in results, (name, version) in recipe_update_candidates(adv)
        recipe_updates[name] = max(get(recipe_updates, name, version), version)
    end

    verb = n_modified > 0 && n_created == 0 ? "Update" :
           n_modified == 0 && n_created > 0 ? "Publish" : "Publish and update"
    unique_pkgs = unique(Iterators.flatten(vulnerable_packages.(results)))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "n_changed=", n_total)
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "recipe_updates=", JSON3.write([Dict("name"=>name, "version"=>string(version)) for (name, version) in sort!(collect(recipe_updates))]))
    body = sprint() do io
        pkgs_str = join("**" .* unique_pkgs .* "**", ", ", ", and ")
        if haystack !== nothing
            println(io, "This action searched `", haystack, "` for advisories that pertain here. ",
                "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", pkgs_str, ".")
        else
            println(io, "This pull request changes ", n_total, " ", advisory_str, " related to the Julia package(s): ", pkgs_str, ".")
        end
        println(io)

        unbounded = count(any(!has_upper_bound, a.affected) for a in results)
        if unbounded > 0
            println(io, "### ⚠ There are $unbounded advisories with unbounded vulnerabilities")
            println(io, "The publication of unbounded advisories is significantly more impactful and, if at all possible, should be addressed in the packages directly")
        end

        direct    = filter(is_direct, results)
        upstreams = filter(!is_direct, results)

        if !isempty(direct)
            pkgs = unique(Iterators.flatten(vulnerable_packages.(direct)))
            println(io, "## $(length(direct)) advisories directly affect packages ", join(pkgs, ", ", " and "), "\n")
            print_capped(adv -> print_advisory_versions(io, adv, olds[adv.id]), io, sort(direct, by=earliest_source_time))
            println(io)
        end

        if !isempty(upstreams)
            vulnerable_pkgs = unique(Iterators.flatten(vulnerable_packages.(upstreams)))
            # Only report components that still map to a vulnerable package; this skips components
            # whose packages were reviewed and rejected (and thus stripped from `affected`)
            vulnerable_cpes = String[]
            for adv in upstreams
                pkgs = Set(vulnerable_packages(adv))
                for src in adv.jlsec_sources, (vp, _) in src.affected
                    any(in(pkgs), packages_with_upstream_component(vp)) && push!(vulnerable_cpes, vp)
                end
            end
            unique!(vulnerable_cpes)
            vulnerable_projs = unique(Iterators.flatten(upstream_projects_by_cpe.(vulnerable_cpes)))
            # Only packages with component tracking have per-version metadata to show
            tracked_pkgs = filter(pkg -> haskey(package_components(), pkg), vulnerable_pkgs)
            pkg_version_upstream = Dict{String, Any}(k => package_components()[k] for k in tracked_pkgs)
            println(io, "## $(length(upstreams)) advisories affect artifacts provided by ", join(vulnerable_pkgs, ", ", " and "), "\n")
            print(io, "These identifications depend upon accurately tracked artifact metadata in GeneralMetadata.jl. ")
            print(io, "Packages are only listed as affected if they have such tracking, and the vulnerable status ")
            print(io, "(and version numbers themselves) are highly dependent on the accuracy of this metadata. ")
            println(io, "Improvements can be made directly to GeneralMetadata.jl; it is automatically populated on a best-effort basis and manual edits are preserved.")
            println(io)

            println(io, "\n### Package and upstream project information\n")
            for pkg in tracked_pkgs
                pkg_projects = unique(Iterators.flatten(keys(v) for v in values(pkg_version_upstream[pkg])))
                println(io, "* ", link_pkg(pkg), "'s [artifact metadata](", meta_url(pkg), ") has upstream", length(pkg_projects) > 1 ? "s: " : ": ", join(link_proj.(pkg_projects), ", ", " and "))
                println(io, "    <details><summary><strong>$pkg</strong> <a href=\"", meta_url(pkg), "\">metadata for each version</a>:</summary>\n\n")

                println(io, "    | ", link_pkg(pkg), " version | ", join(link_proj.(vulnerable_projs) .* " version", " | "), " |")
                println(io, "    |-|", join(fill("-", length(vulnerable_projs)), "|"), "|")
                for (v, ups) in pkg_version_upstream[pkg]
                    println(io, "    | $v | ", join((ups[p] for p in vulnerable_projs), " | "), " | ")
                end
                println(io)
                println(io, "    </details>\n")

                last_version, last_version_info = last(pkg_version_upstream[pkg])
                if any(x->ismissing(x) || x=="*", values(last_version_info))
                    println(io, "    * **⚠ The latest version (v$last_version) has incomplete or missing metadata**")
                end
                has_early_missings = false
                has_intervening_missings = false
                for proj in pkg_projects
                    found_first_known_version = false
                    for (v, vinfo) in pkg_version_upstream[pkg]
                        if !haskey(vinfo, proj) || ismissing(vinfo[proj]) || isnothing(vinfo[proj])
                            if !found_first_known_version
                                has_early_missings = true
                            else
                                has_intervening_missings = true
                            end
                        elseif vinfo[proj] == "*"
                            if !found_first_known_version
                                println(io, "    * **⚠ The earliest version (v$v) with ", link_proj(proj), " is missing its version, so this will suggest _every single advisory_ every published**")
                                found_first_known_version = true
                                has_early_missings = true
                            else
                                has_intervening_missings = true
                            end
                        else
                            found_first_known_version = true
                        end
                    end
                end
                if has_early_missings
                    println(io, "    * The oldest versions with no metadata are not considered when searching for advisories")
                end
                if has_intervening_missings
                    println(io, "    * Missing version metadata between two known versions are assumed to have some value between the two known values")
                end
            end

            println(io, "\n### Advisory summaries\n")
            print_capped(adv -> print_advisory_versions(io, adv, olds[adv.id]), io, sort(upstreams, by=earliest_source_time))
            println(io)
        end
    end
    print_body_output(io, body)
end
