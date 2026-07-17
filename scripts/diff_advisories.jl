#!/usr/bin/env julia
# Summarize which Advisory fields changed across the advisory files in a commit or range,
# including the TOML frontmatter as well as the summary/details from the markdown body.
#
# Scalar fields are reported as added/removed/changed. Array fields are diffed at the
# element level (without recursing into element subfields): element counts, plus how many
# elements were added, dropped, changed (heuristically paired), or merely reordered.
# The report is GitHub-flavored markdown, suitable for a PR body.
#
# Usage:
#   julia scripts/diff_advisories.jl [<commit>]        # defaults to HEAD, diffs against <commit>^
#   julia scripts/diff_advisories.jl <base> <target>
#   julia scripts/diff_advisories.jl <base>..<target>
#   julia scripts/diff_advisories.jl .                 # working tree vs HEAD
#
# A target of `.` means the working tree. Also usable as a library via
# `include`; see `print_advisory_diff`.

using TOML

# `nothing` as a target means the working tree
function parse_args(args)
    worktree(t) = t == "." ? nothing : String(t)
    if isempty(args)
        return "HEAD^", "HEAD"
    elseif length(args) == 1
        args[1] == "." && return "HEAD", nothing
        if occursin("..", args[1])
            base, target = split(args[1], r"\.\.+", limit=2)
            return String(base), worktree(target)
        end
        return args[1] * "^", args[1]
    elseif length(args) == 2
        return args[1], worktree(args[2])
    end
    error("expected at most two revisions, got $(length(args))")
end

# Pull the contents of the first ```toml fence, and everything after it (the markdown body)
function split_frontmatter(content::AbstractString)
    m = match(r"^(`{3,})toml\r?\n(.*?)^\1`*\r?\n?(.*)"ms, content)
    m === nothing && return nothing, content
    return m[2], m[3]
end

# Mirror Base.tryparse(Advisory, ...): the body is an optional leading `#` heading
# (the summary, whitespace-normalized) followed by the details.
function parse_body(body::AbstractString)
    body = strip(body)
    summary = nothing
    m = match(r"^#+[ \t]+(.+?)[ \t#]*(\r?\n|$)", body)
    if m !== nothing
        summary = replace(m[1], r"\s+" => " ")
        body = strip(body[ncodeunits(m.match)+1:end])
    end
    details = isempty(body) ? nothing : String(body)
    return summary, details
end

function changed_files(base, target)
    cmd = target === nothing ? `git diff --name-status $base` : `git diff --name-status $base $target`
    files = Tuple{Char,String}[]  # (status, path)
    for line in eachline(cmd)
        status, path = split(line, '\t', limit=2)
        push!(files, (status[1], String(path)))
    end
    return files
end

# Fetch many blobs through one `git cat-file --batch` process.
function fetch_blobs(specs::Vector{String})
    blobs = Dict{String,Union{String,Nothing}}()
    proc = open(`git cat-file --batch`, "r+")
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

# A markdown code span, safe for use in table cells
mdcode(s) = "`" * replace(s, "`" => "'", "|" => "\\|") * "`"

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

asvector(x) = x isa AbstractVector ? x : Any[x]

"""
    print_advisory_diff(io, base, target=nothing)

Print a summary of the Advisory field changes between the git revisions `base` and
`target` to `io`; a `target` of `nothing` compares against the working tree.
"""
function print_advisory_diff(io::IO, base, target=nothing)
    tname = target === nothing ? "working tree" : target
    files = changed_files(base, target)
    isempty(files) && (println(io, "No files changed between $base and $tname."); return)

    mdfiles = [(st, f) for (st, f) in files if endswith(f, ".md") && startswith(f, "advisories/")]
    other = length(files) - length(mdfiles)
    added_files   = [f for (st, f) in mdfiles if st == 'A']
    deleted_files = [f for (st, f) in mdfiles if st == 'D']
    modified = [f for (st, f) in mdfiles if st == 'M']

    specs = String[]
    for f in modified
        push!(specs, "$base:$f")
        target === nothing || push!(specs, "$target:$f")
    end
    blobs = fetch_blobs(specs)
    root = target === nothing ? readchomp(`git rev-parse --show-toplevel`) : ""
    fetch_new(f) = target === nothing ?
        (p = joinpath(root, f); isfile(p) ? read(p, String) : nothing) :
        blobs["$target:$f"]

    scalar_counts = Dict{Tuple{Char,String},Int}()
    array_stats = Dict{String,ArrayAgg}()
    signatures = Dict{Vector{String},Vector{String}}()  # change signature => files
    parse_failures = String[]

    for f in modified
        oldc, newc = blobs["$base:$f"], fetch_new(f)
        (oldc === nothing || newc === nothing) && (push!(parse_failures, f); continue)
        old_toml_src, old_body = split_frontmatter(oldc)
        new_toml_src, new_body = split_frontmatter(newc)
        old = old_toml_src === nothing ? nothing : TOML.tryparse(old_toml_src)
        new = new_toml_src === nothing ? nothing : TOML.tryparse(new_toml_src)
        if !(old isa Dict) || !(new isa Dict)
            push!(parse_failures, f)
            continue
        end
        # summary and details are Advisory fields too; they just live in the markdown body
        for (toml, body) in ((old, old_body), (new, new_body))
            summary, details = parse_body(body)
            summary === nothing || (toml["summary"] = summary)
            details === nothing || (toml["details"] = details)
        end

        sig = String[]
        for key in union(keys(old), keys(new))
            o_has, n_has = haskey(old, key), haskey(new, key)
            o, n = get(old, key, nothing), get(new, key, nothing)
            o_has && n_has && isequal(o, n) && continue
            op = o_has ? (n_has ? '~' : '-') : '+'

            if o isa AbstractVector || n isa AbstractVector
                ov = o_has ? asvector(o) : Any[]
                nv = n_has ? asvector(n) : Any[]
                add, drop, chg, reord = op == '~' ? array_diff(ov, nv) : (nv, ov, Tuple{Any,Any}[], false)
                op == '+' && (drop = Any[])
                op == '-' && (add = Any[])
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
    println(io, "**Diff ", mdcode(base), " → ", target === nothing ? "working tree" : mdcode(tname), ":** ",
            length(mdfiles), " advisory file", length(mdfiles) == 1 ? "" : "s", " touched (", length(modified), " modified, ",
            length(added_files), " added, ", length(deleted_files), " deleted)",
            other > 0 ? ", plus $other non-advisory file$(other == 1 ? "" : "s")" : "", ".")
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

    if !isempty(signatures)
        println(io, "\n### Change signatures\n")
        println(io, "_Groups of files with identical field-change sets._\n")
        for (sig, fs) in sort!(collect(signatures), by=x->-length(x[2]))
            ids = sort!([splitext(basename(f))[1] for f in fs])
            names = join(mdcode.(first(ids, 4)), ", ")
            length(ids) > 4 && (names *= ", and $(length(ids) - 4) more")
            println(io, "- **$(length(fs)) file$(length(fs) == 1 ? "" : "s")** ($names):")
            for s in sig
                println(io, "  - `$s`")
            end
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    print_advisory_diff(stdout, parse_args(ARGS)...)
end
