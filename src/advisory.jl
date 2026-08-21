using DataStructures: OrderedDict
using Dates: Dates, DateTime
using CommonMark: CommonMark

"""
    PackageVulnerability(; pkg, ranges)

Represent an item in OSV's `affected` array, but using ranges of `VersionRange` instead of named events.
"""
@kwdef struct PackageVulnerability
    pkg::String
    ranges::Vector{VersionRange{VersionNumber}}
end
function Base.convert(::Type{PackageVulnerability}, d::AbstractDict)
    PackageVulnerability(; Dict(Symbol(k)=>(Symbol(k) == :ranges ? VersionRange{VersionNumber}.(v) : v) for (k,v) in d)...)
end
function Base.:(==)(a::PackageVulnerability, b::PackageVulnerability)
    return a.pkg == b.pkg && a.ranges == b.ranges
end
function Base.hash(a::PackageVulnerability, h::UInt)
    return hash(a.pkg, hash(a.ranges, hash(0x30652ead7d10dc57, h)))
end
is_vulnerable(v::PackageVulnerability) = !isempty(v.ranges)
has_lower_bound(v::PackageVulnerability) = all(has_lower_bound, v.ranges)
has_upper_bound(v::PackageVulnerability) = all(has_upper_bound, v.ranges)
purl(v::PackageVulnerability) = purl(v.pkg)
function purl(pkg::String)
    uuid = get_uuids_in_general_stdlib(pkg)
    if isempty(uuid)
        error("Found no UUID for $pkg")
    end
    return "pkg:julia/$pkg?uuid=$(first(uuid))"
end
"""
    sort_version_ranges!(versions)

Sort a vector of version range strings by their parsed `VersionRange`s, falling back to
lexicographic order if any of them fail to parse.
"""
function sort_version_ranges!(versions)
    parsed = tryparse.(VersionRange, versions)
    if all(!isnothing, parsed)
        permute!(versions, sortperm(parsed))
    else
        sort!(versions)
    end
    return versions
end

"""
    Reference(; url, type="WEB")

Represent a URL in OSV's reference field. Assumes `"WEB"` if the type is not in OSV schema.
"""
@kwdef struct Reference
    type::String = "WEB"
    url::String
    function Reference(type, url)
        TYPE = uppercase(convert(String, type))
        if TYPE ∉ ("ADVISORY", "ARTICLE", "DETECTION", "DISCUSSION", "REPORT",
                   "FIX", "INTRODUCED", "PACKAGE", "EVIDENCE", "WEB")
            @warn "unknown reference type $(repr(type))"
            TYPE = "WEB"
        end
        return new(TYPE, convert(String, url))
    end
end
Base.convert(::Type{Reference}, s::AbstractString) = Reference(; url = s)
Base.convert(::Type{Reference}, d::AbstractDict) = Reference(; Dict(Symbol(k)=>v for (k,v) in d)...)

"""
    Credit(; name, contact=String[], type=nothing)
    Credit(shorthand)

Represent a :credit field item. Supports reading and writing a shorthand `\$name <\$email>` string syntax.
The `type` must be a value in OSV schema or will be omitted.
"""
@kwdef struct Credit
    name::String
    contact::Vector{String} = String[]
    type::Union{String,Nothing} = nothing
    function Credit(name, contact, type)
        if type !== nothing
            type = uppercase(convert(String, type))
            if type ∉ ("FINDER", "REPORTER", "ANALYST", "COORDINATOR", "REMEDIATION_DEVELOPER",
                        "REMEDIATION_REVIEWER", "REMEDIATION_VERIFIER", "TOOL", "SPONSOR", "OTHER")
                @warn "unknown credit type $type"
                type = nothing
            end
        end
        new(convert(String, name), convert(Vector{String}, contact), type)
    end
end
function Credit(shorthand::AbstractString)
    # Support typical "Name <name@example.com>" shorthand
    m = match(r"^\s*(.+?)\s<([^>]+@[^>]+)>\s*$", shorthand)
    if m === nothing
        return Credit(shorthand, String[], nothing)
    else
        return Credit(m.captures[1], [string("mailto:", m.captures[2])], nothing)
    end
end
Base.convert(::Type{Credit}, s::AbstractString) = Credit(s)
Base.convert(::Type{Credit}, d::AbstractDict) = Credit(; Dict(Symbol(k)=>v for (k,v) in d)...)
Base.:(==)(a::Credit, b::Credit) = isequal(a.name, b.name) && isequal(a.contact, b.contact) && isequal(a.type, b.type)
Base.hash(a::Credit, h::UInt) = hash(a.name, hash(a.contact, hash(a.type, hash(0x6a890f8c2b38fe87, h))))

"""
    Severity(; type, score)
    Severity(score)

Represent a CVSS severity. If no type is given, CVSS_V2/3/4 are auto-detected.
"""
@kwdef struct Severity
    type::String
    score::String
    source::Union{Nothing, String} = nothing
end
function Severity(score; source = nothing)
    s = tryparse(Severity, score)
    isnothing(s) && throw(ArgumentError("cannot parse severity score $score"))
    return Severity(s.type, s.score, source)
end
Severity(type, score; source = nothing) = Severity(type, score, source)
Base.convert(::Type{Severity}, s::AbstractString) = Severity(s)
Base.convert(::Type{Severity}, d::AbstractDict) = Severity(; Dict(Symbol(k)=>v for (k,v) in d)...)
function Base.tryparse(::Type{Severity}, score)
    v = CVSS.version(score)
    v === nothing && return nothing
    return Severity("CVSS_V$v", String(score))
end

@kwdef struct AdvisorySource
    id::String
    imported::DateTime
    modified::DateTime
    published::Union{Nothing, DateTime}
    url::String
    html_url::String
    fields::Vector{String} = String[] # An optional subset of fields that were updated by this source (excepting alias/upstream)
    database_specific::Dict{String, Any} = Dict{String, Any}()
    # The affected upstream (non-Julia) components, mapping each CPE-like "vendor:product"
    # identifier to that component's vulnerable version ranges, verbatim in the source's own
    # version numbers. The Julia packages that provide each component are intentionally not
    # recorded; they are computed from GeneralMetadata (see `packages_with_upstream_component`).
    affected::OrderedDict{String, Vector{String}} = OrderedDict{String, Vector{String}}()
    function AdvisorySource(id, imported, modified, published, url, html_url, fields, database_specific, affected)
        # Sort the affected components (and their ranges) so that freshly-imported and
        # file-parsed sources compare equal
        new(id, imported, modified, published, url, html_url, fields, database_specific,
            OrderedDict{String, Vector{String}}(String(k) => sort_version_ranges!(unique!(collect(String, asvector(v))))
                                                for (k, v) in sort(collect(affected), by=String∘first)))
    end
end
Base.:(==)(a::AdvisorySource, b::AdvisorySource) = to_toml_frontmatter(a) == to_toml_frontmatter(b)
Base.hash(a::AdvisorySource, h::UInt) = hash(to_toml_frontmatter(a), hash(0xa3a999db00b21f4d, h))
Base.convert(::Type{AdvisorySource}, d::AbstractDict) = AdvisorySource(; Dict(Symbol(k)=>v for (k,v) in d)...)
function srcid(src::AdvisorySource)
    if startswith(src.id, "GHSA-")
        # GHSAs are terrible and might be a global GHSA or a repo GHSA
        # So we check if the API URL is a repo GHSA and if so, we use the repo GHSA ID instead of the global one
        # TODO: perhaps we should just store our phony repo GHSA ID in the first place
        m = match(r"^https://api\.github\.com/repos/([^/]+/[^/]+)/security-advisories/(GHSA-[^/]+)$", src.url)
        return isnothing(m) ? src.id : string(m.captures[1], "/", m.captures[2])
    else
        return src.id
    end
end

"""
    unscoped_id(id)

Return the plain advisory id, dropping the `owner/repo/` prefix that scopes repository GHSAs
"""
function unscoped_id(id)
    m = match(r"(GHSA-\w{4}-\w{4}-\w{4})$", id)
    return isnothing(m) ? id : String(m.captures[1])
end

"""
    Advisory(; osv_kwargs...)

Represent an advisory using OSV schema's definitions for nearly all its fields.
There is just one place where we differ:
* `affected` is a vector of the differently-structured [`PackageVulnerability`](@ref)
"""
@kwdef mutable struct Advisory
    ## OSV fields
    schema_version::String = "1.8.0"
    # The identifier and dates are re-written by GitHub Actions upon publication and modification
    id::String = string(PREFIX, "-0000-", string(Dates.datetime2epochms(Dates.now()), base=36), "-", string(rand(UInt32), base=36))
    modified::DateTime = Dates.now(Dates.UTC)
    published::Union{DateTime, Nothing} = nothing
    withdrawn::Union{DateTime, Nothing} = nothing
    aliases::Vector{String} = String[]
    upstream::Vector{String} = String[]
    related::Vector{String} = String[]
    summary::Union{String, Nothing} = nothing
    details::Union{String, Nothing} = nothing
    # The more complicated fields:
    severity::Vector{Severity} = Severity[]
    affected::Vector{PackageVulnerability} = PackageVulnerability[]
    references::Vector{Reference} = Reference[]
    credits::Vector{Credit} = Credit[]
    ## JLSEC database_specific fields:
    jlsec_sources::Vector{AdvisorySource} = AdvisorySource[]
end
osv_fieldnames(::Type{Advisory}) = filter(!startswith("jlsec_")∘string, fieldnames(Advisory))
osv_pairs(adv::Advisory) = [string(f)=>getproperty(adv, f) for f in osv_fieldnames(typeof(adv))]
database_specific_fieldnames(::Type{Advisory}) = filter(startswith("jlsec_")∘string, fieldnames(Advisory))
database_specific_pairs(adv::Advisory) =
    [chopprefix(string(f), "jlsec_")=>getproperty(adv, f) for f in database_specific_fieldnames(typeof(adv))]

# Advisory identity is purely determined by the serialization format
function Base.:(==)(a::Advisory, b::Advisory)
    return to_toml_frontmatter(a) == to_toml_frontmatter(b) && a.summary == b.summary && a.details == b.details
end
function Base.hash(a::Advisory, h::UInt)
    return hash(to_toml_frontmatter(a), hash(a.summary, hash(a.details, hash(0x913cfa4716e3f874, h))))
end

# Approximate equality ignores some metadata like exact dates and times and orderings
function Base.:≈(a::Advisory, b::Advisory)
    return a.id == b.id &&
        isnothing(a.published) == isnothing(b.published) &&
        isnothing(a.withdrawn) == isnothing(b.withdrawn) &&
        Set(a.aliases) == Set(b.aliases) &&
        Set(a.upstream) == Set(b.upstream) &&
        Set(a.related) == Set(b.related) &&
        a.summary == b.summary &&
        a.details == b.details &&
        Set(a.severity) == Set(b.severity) &&
        Set((v.pkg, v.ranges) for v in a.affected) == Set((v.pkg, v.ranges) for v in b.affected) &&
        Set(a.references) == Set(b.references) &&
        Set(a.credits) == Set(b.credits) &&
        # A change in a source's affected upstream components matters here; its timestamps do not
        Set((src.id, src.published, src.url, src.affected) for src in a.jlsec_sources) ==
        Set((src.id, src.published, src.url, src.affected) for src in b.jlsec_sources)
end

"""
    vuln_id(advisory)

Return the vulnerability ID; if it's not yet been published, use a `preferred_id` from its aliases or upstreams (in that order)
"""
function vuln_id(a::Advisory)
    return !startswith(a.id, string(PREFIX, "-0000")) ? a.id :
           !isempty(a.aliases)  ? preferred_id(a.aliases)    :
           !isempty(a.upstream) ? preferred_id(a.upstream)   : a.id
end

"""
    srcid(a::Advisory)

Return the source ID of an advisory; either a published JLSEC ID or the only imported source ID
"""
function srcid(a::Advisory)
    if startswith(a.id, string(PREFIX, "-2"))
        return a.id
    elseif length(a.jlsec_sources) == 1
        return srcid(a.jlsec_sources[1])
    else
        error("cannot determine source ID for advisory with multiple sources and no published JLSEC ID")
    end
end

"""
    function preferred_id(collection_of_ids)

Given a collection of vulnerability IDs, return the "best" one
"""
preferred_id(vec) = first(sort(vec, by = preferred_id_sort))
# We prefer non-placeholder JLSECs, then CVEs, then GHSAs, then the rest in lexicographic order (lol a Y3k bug)
preferred_id_sort(id) = (!startswith(id, "JLSEC-2"), !startswith(id, "CVE"), !contains(id, "GHSA"), id)

"""
    is_vulnerable(x)

Return `true` if the `Advisory` or `PackageVulnerability` has a non-empty set of versions
"""
is_vulnerable(a::Advisory) = any(is_vulnerable, a.affected)
vulnerable_packages(a::Advisory) = [entry.pkg for entry in a.affected if is_vulnerable(entry)]

"""
    recipe_update_candidates(advisory)

Return `name => version` pairs describing Yggdrasil recipe updates that could resolve
unbounded JLL vulnerabilities in the given advisory: cases where a vulnerable `_jll`
package has no known fixed version, yet an upstream range has an exclusive upper
bound — meaning the upstream project has published a fixed version that simply hasn't
been built into a JLL release yet. The `name` is the Yggdrasil recipe name (the package
name without its `_jll` suffix) and the version is the largest such upstream fixed
version across all the sources' affected components, as a [`VersionString`](@ref).
Ranges that don't identify a fixed version (unbounded, inclusively-bounded, exact, or
unparseable ones) are simply ignored.

Since the sources' affected components do not record the Julia packages they map to,
the association is computed with `packages_with_component` (a keyword, primarily for testing).
"""
function recipe_update_candidates(a::Advisory; packages_with_component = packages_with_upstream_component)
    candidates = Pair{String, VersionString}[]
    for vuln in a.affected
        endswith(vuln.pkg, "_jll") && is_vulnerable(vuln) && !has_upper_bound(vuln) || continue
        upstream_ranges = [tryparse(VersionRange, v)
            for src in a.jlsec_sources for (vp, ranges) in src.affected if vuln.pkg in packages_with_component(vp) for v in ranges]
        # Only ranges with exclusive upper bounds tell us the upstream's fixed version
        fixed = filter(r -> !isnothing(r) && has_upper_bound(r) && !r.ubinclusive, upstream_ranges)
        isempty(fixed) && continue
        push!(candidates, chopsuffix(vuln.pkg, "_jll") => maximum(r -> r.ub, fixed))
    end
    return unique!(candidates)
end

"""
    is_disputed(advisory)

Return `true` if the advisory has been tagged as disputed (currently the only source giving this information is NVD)
"""
function is_disputed(a::Advisory)
    any(==("disputed")∘lowercase, Iterators.flatten(get(tags, "tags", []) for src in a.jlsec_sources for tags in get(src.database_specific, "tags", [])))
end

"""
    is_rejected(advisory)

Return `true` if the advisory has a status of "rejected" (currently the only source giving this information is NVD)
"""
function is_rejected(a::Advisory)
    any(==("rejected")∘lowercase, (get(src.database_specific, "status", "") for src in a.jlsec_sources))
end

"""
    is_valid(advisory)

Return `true` if the advisory is published by its upstream sources and not disputed/rejected/withdrawn
"""
function is_valid(a::Advisory)
    return all(!isnothing(src.published) for src in a.jlsec_sources) && !is_disputed(a) && !is_rejected(a) && isnothing(a.withdrawn)
end

"""
    update(original::Advisory, updates::Advisory)

Given an `original` advisory and some `updates`, return a new advisory with the original ID
and new data from `updates`, but only if it results in material differences from the original
"""
function update(original::Advisory, updates::Advisory)
    result = combine(original, updates)
    if (!is_valid(updates) && is_valid(original)) || (!is_vulnerable(updates) && is_vulnerable(original))
        # Sometimes the new updates are rejected but haven't set a withdrawn date (typically from NVD)
        # Or if the updates have _no_ vulnerable ranges at all, that should also be considered as a withdraw
        result.withdrawn = Dates.now(Dates.UTC)
    end
    original ≈ result && return original # No need to update if nothing relevant changed
    return result
end

function fetch_updates(original::Advisory; reset_fields = Symbol[])
    src_ids = sort(srcid.(original.jlsec_sources), by=preferred_id_sort)
    isempty(src_ids) && throw(ArgumentError("cannot fetch updates for an advisory with no sources"))
    updates = SecurityAdvisories.fetch_advisory.(src_ids)
    advisory = Advisory(; (f => getfield(original, f) for f in fieldnames(Advisory) if f ∉ reset_fields)...)
    return foldl(combine, updates; init=advisory)
end

"""
    better_affected(a, b)

Choose between two competing versions of a package's affected ranges, preferring `a`
unless `b` is clearly better: having more ranges is generally more specific, and ranges
with upper bounds beat unbounded ones.
"""
function better_affected(a::PackageVulnerability, b::PackageVulnerability)
    a.ranges == b.ranges && return a
    length(a.ranges) > length(b.ranges) && return a
    all(has_upper_bound, a.ranges) && return a
    return b
end

"""
    combine_severities(a, b)

Combine two lists of `Severity`s, keeping only one of each `type`: the first source to claim a
type wins, but later values from that same source are updated assessments and replace it.
"""
function combine_severities(a::Vector{Severity}, b::Vector{Severity})
    result = OrderedDict{String, Severity}(sev.type => sev for sev in a)
    for sev in b
        if get(result, sev.type, sev).source == sev.source
            result[sev.type] = sev
        end
    end
    return collect(values(result))
end

"""
    combine(a::Advisory, b::Advisory)

Take two advisories and combine their information, preferring the first argument when it is unclear which is better
"""
function combine(a::Advisory, b::Advisory)
    known_to_be_upstream = false
    if isempty(intersect(a.aliases, b.aliases)) && isempty(intersect(a.upstream, b.upstream))
        if !isempty(intersect(union(a.aliases, a.upstream), union(b.aliases, b.upstream)))
            # When one advisory finds `upstream`, this is generally because it got better affected
            # details, so we convert the others' aliases to upstream. # TODO: we could verify affected status of both
            known_to_be_upstream = true
        else
            error("cannot combine advisories that are not aliases/upstreams of each other; got aliases $(a.aliases) and $(b.aliases) and upstreams $(a.upstream) and $(b.upstream)")
        end
    end

    sources = copy(a.jlsec_sources)
    for bsrc in b.jlsec_sources
        idx = findfirst(asrc -> asrc.id == bsrc.id, sources)
        if idx === nothing
            push!(sources, bsrc)
        elseif bsrc.imported > sources[idx].imported
            sources[idx] = bsrc
        end
    end

    return Advisory(;
        # use whatever the default `schema_version` is
        id = startswith(a.id, "JLSEC-0000") ? b.id : a.id, # Prefer the non-placeholder ID if one exists
        modified = max(a.modified, b.modified),
        published = if !isnothing(a.published) && !isnothing(b.published)
            min(a.published, b.published) # use the first-published date
        else
            something(a.published, b.published, Some(nothing))
        end,
        withdrawn = if !isnothing(a.withdrawn) && !isnothing(b.withdrawn)
            min(a.withdrawn, b.withdrawn) # use the first-withdrawn date
        else
            something(a.withdrawn, b.withdrawn, Some(nothing))
        end,
        ## For most other fields, we take the union of the two advisories' values
        aliases = known_to_be_upstream ? String[] : union(a.aliases, b.aliases),
        upstream = known_to_be_upstream ? union(a.aliases, b.aliases, a.upstream, b.upstream) : union(a.upstream, b.upstream),
        related = union(a.related, b.related),
        summary = something(a.summary, b.summary, Some(nothing)),
        # Generally the longer details are better, but we could try to find some Markdown?
        details = length(something(a.details, "")) >= length(something(b.details, "")) ? a.details : b.details,
        severity = combine_severities(a.severity, b.severity),
        # Affected is the trickiest one when both exist; we want the "best" information here
        affected = if !isnothing(a.affected) && !isnothing(b.affected)
            pkgs = union((entry.pkg for entry in a.affected), (entry.pkg for entry in b.affected))
            [begin
                a_entry = findfirst(e -> e.pkg == pkg, a.affected)
                b_entry = findfirst(e -> e.pkg == pkg, b.affected)
                if a_entry === nothing
                    b.affected[b_entry]
                elseif b_entry === nothing
                    a.affected[a_entry]
                else
                    better_affected(a.affected[a_entry], b.affected[b_entry])
                end
            end for pkg in pkgs]
        else
            something(a.affected, b.affected, Some(nothing))
        end,
        references = union(a.references, b.references),
        credits = union(a.credits, b.credits),
        # Combining the sources also combines their affected upstream components
        jlsec_sources = sources,
    )
end

function combine_aliases!(advisories)
    sort!(advisories, by=preferred_id_sort∘vuln_id)
    deleted = BitSet()
    for i in eachindex(advisories)
        i in deleted && continue

        for j in (i+1):length(advisories)
            j in deleted && continue

            if !isempty(intersect(advisories[i].aliases, advisories[j].aliases)) ||
               !isempty(intersect(advisories[i].upstream, advisories[j].upstream))
                advisories[i] = combine(advisories[i], advisories[j])
                push!(deleted, j)
            end
        end
    end
    deleteat!(advisories, deleted)
    return advisories
end

function year(advisory::Advisory)
    yyyy = tryparse(Int, split(advisory.id, "-")[2])
    isnothing(yyyy) || yyyy == 0 ? Dates.year(Dates.now(Dates.UTC)) : yyyy
end

#### IO and serialization ####

# TOML creation. The one funny thing we do here is that the JULSEC parser supports a few
# shorthand idioms. But only do this if _all_ values in a collection can be represented
# with such shorthands.
"""
    to_toml_frontmatter(x)

Recursively convert an Advisory and all its fields (except `summary` and `details`) to serializable values for `TOML.print`
"""
to_toml_frontmatter(v::Union{VersionNumber, VersionString, VersionRange}) = string(v)
to_toml_frontmatter(x::Union{AbstractString, Integer, AbstractFloat, Bool, Dates.DateTime, Dates.Time, Dates.Date}) = x
to_toml_frontmatter(d::AbstractDict) = OrderedDict(k=>to_toml_frontmatter_collection(v, values(d)) for (k,v) in d)
to_toml_frontmatter(A::AbstractArray) = [to_toml_frontmatter_collection(x, A) for x in sort_collection(A)]
# The `affected` components and their ranges are already sorted at construction; serialize
# them as-is rather than through the generic paths (which would re-sort the range strings)
to_toml_frontmatter(s::AdvisorySource) = OrderedDict(string(f) =>
        (f === :affected ? OrderedDict{String, Any}(k => copy(v) for (k, v) in s.affected) :
                           to_toml_frontmatter(getproperty(s, f)))
    for f in fieldnames(AdvisorySource) if is_populated(getfield(s, f)))
to_toml_frontmatter_collection(x, _) = to_toml_frontmatter(x)
function to_toml_frontmatter(a::Advisory)
    # Convert all fields to TOML with a few special cases:
    return OrderedDict{String,Any}(
        string(f) => to_toml_frontmatter(
            f == :affected ? filter(is_vulnerable, getproperty(a, f)) : # Skip (empty) non-vulnerabilities
            getproperty(a, f))
        for f in fieldnames(Advisory) if
            is_populated(getproperty(a, f)) && (f ∉ (:summary, :details))) # Summary and details are not frontmatter
end
to_toml_frontmatter(s::Severity) = to_toml_frontmatter_collection(s, [s])
function to_toml_frontmatter_collection(s::Severity, xs)
    if all(x isa Severity && x == tryparse(Severity, x.score) for x in xs)
        return s.score
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(s, f)) for f in fieldnames(Severity) if is_populated(getfield(s, f)))
    end
end
to_toml_frontmatter(c::Credit) = to_toml_frontmatter_collection(c, [c])
function _credit_shorthand(c::Credit)
    contact = chopprefix(get(c.contact, 1, ""), "mailto:")
    return string(c.name, isempty(contact) ? "" : " <$contact>")
end
function to_toml_frontmatter_collection(c::Credit, xs)
    if all(x isa Credit && x == Credit(_credit_shorthand(x)) for x in xs)
        return _credit_shorthand(c)
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(c, f)) for f in fieldnames(Credit) if is_populated(getproperty(c, f)))
    end
end
to_toml_frontmatter(r::Reference) = to_toml_frontmatter_collection(r, [r])
function to_toml_frontmatter_collection(r::Reference, xs)
    if all(x isa Reference && x.type == "WEB" for x in xs)
        return r.url
    else
        return OrderedDict(string(f) => to_toml_frontmatter(getproperty(s, f)) for f in fieldnames(Reference))
    end
end
function to_toml_frontmatter(v::PackageVulnerability)
    return OrderedDict("pkg" => to_toml_frontmatter(v.pkg),
                    "ranges" => to_toml_frontmatter(v.ranges))
end
sort_collection(xs) = xs
sort_collection(xs::Vector{String}) = sort(xs, by=preferred_id_sort)
sort_collection(xs::Vector{Severity}) = sort(xs, by=x->(x.type, x.score))
sort_collection(xs::Vector{PackageVulnerability}) = sort(xs, by=x->x.pkg)
sort_collection(xs::Vector{Reference}) = sort(xs, by=x->x.url)
sort_collection(xs::Vector{Credit}) = sort(xs, by=x->[something(x.type, ""); reverse(split(x.name)); x.contact])
sort_collection(xs::Vector{AdvisorySource}) = sort(xs, by=preferred_id_sort∘(x->x.id))

function Base.print(io::IO, vuln::Advisory)
    frontdata = to_toml_frontmatter(vuln)
    frontmatter = sprint(frontdata) do io, x
        TOML.print(io, x;
            inline_tables=IdSet{Dict{String,Any}}(src["database_specific"] for src in get(x, "jlsec_sources", ()) if SecurityAdvisories.exists(src, "database_specific")))
    end
    # I don't think it's possible for TOML.print to output ``` on a line, but just in case:
    nticks = maximum(x->length(x.captures[1])+1, eachmatch(r"^\s*(`+)\s*$", frontmatter), init=3)
    buf = IOBuffer()
    println(buf, repeat("`", nticks), "toml")
    print(buf, frontmatter)
    println(buf, repeat("`", nticks))
    println(buf)
    is_populated(vuln.summary) && println(buf, "# ", replace(vuln.summary, r"\s+"=>" "), "\n\n")
    is_populated(vuln.details) && println(buf, vuln.details)
    seekstart(buf)
    # Roundtrip through the parser to standardize some syntaxes and avoid churn from subsequent parse/prints
    println(io, CommonMark.markdown(CommonMark.Parser()(buf)))
end

# Use the TOML/Markdown as the display:
Base.show(io::IO, mime::MIME"text/plain", vuln::Advisory) = show(io, mime, CommonMark.Parser()(string(vuln)))
Base.show(io::IO, vuln::Advisory) = print(io, vuln)

####### Read a Markdown/TOML advisory
parsefile(filename) = something(open(io->tryparse(Advisory, io), filename))
function Base.tryparse(::Type{Advisory}, s::Union{AbstractString, IO})
    doc = (CommonMark.Parser())(s)
    toml = doc.first_child
    isdefined(toml, :t) && toml.t isa CommonMark.CodeBlock && toml.t.info == "toml" || return nothing
    frontmatter = TOML.tryparse(toml.literal)
    frontmatter === nothing && return nothing
    doc.first_child = toml.nxt
    summary = if isdefined(doc.first_child, :t) && doc.first_child.t isa CommonMark.Heading
        s = strip(chopprefix(CommonMark.markdown(doc.first_child), r"^#+"))
        doc.first_child = doc.first_child.nxt
        s
    end
    remainder = strip(CommonMark.markdown(doc))
    details = isempty(remainder) ? nothing : remainder

    return try
        Advisory(; Dict(Symbol(k)=>v for (k,v) in frontmatter)..., summary, details)
    catch _
        nothing
    end
end

# Split an advisory file into its raw TOML frontmatter and body — like `tryparse(Advisory, ...)`
# above, but without the normalizing and schema-strict Advisory struct in between, so the
# advisory diff reports can describe the files exactly as written (see diff.jl's header).

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

# The TOML frontmatter of an advisory file's content as a Dict (or `nothing` if it is
# missing or unparseable), along with the markdown body that follows it
function parse_frontmatter(content)
    toml_src, body = split_frontmatter(content)
    toml = toml_src === nothing ? nothing : TOML.tryparse(toml_src)
    return (toml isa Dict ? toml : nothing), body
end

####### Markdown presentation of an advisory's version ranges

# A markdown code span, safe for use in table cells
mdcode(s) = "`" * replace(s, "`" => "'", "|" => "\\|") * "`"

ranges_str(rs) = isempty(rs) ? "(none)" : join(mdcode.(string.(rs)), ", ")

# The `(source id, "vendor:product", ranges)` triples held within an advisory's
# jlsec_sources' affected tables, sorted so equal contents compare equal
source_affected(t) = t === nothing ? Tuple{String,String,Any}[] :
    sort!([(string(get(s, "id", "?")), string(vp), ranges)
           for s in asvector(get(t, "jlsec_sources", Any[])) if s isa AbstractDict && get(s, "affected", nothing) isa AbstractDict
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
                  for e in asvector(get(frontmatter, "affected", Any[])) if e isa AbstractDict)
    isempty(target) && return nothing
    for src in asvector(get(frontmatter, "jlsec_sources", Any[]))
        src isa AbstractDict && get(src, "affected", nothing) isa AbstractDict || continue
        vpvs = [(String.(split(string(vp), ":", limit=2))..., String(r))
                for (vp, ranges) in src["affected"] if contains(string(vp), ":")
                for r in asvector(ranges)]
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
components that map to none of the listed affected packages (as computed by the
`packages_with_component` keyword) are not shown. When several sources list components,
only the source whose data was used (per `pick_used`, [`used_source`](@ref) by default)
is shown, and component ranges that fail to parse are called out — they are what the
pessimistic all-versions `*` ranges come from. Operating on the raw frontmatter allows
rendering both freshly-imported advisories (via [`to_toml_frontmatter`](@ref)) and old
revisions pulled from git (via `print_advisory_diff`).
"""
function print_version_ranges(io, id, old, new; from="", packages_with_component = packages_with_upstream_component,
                              pick_used = used_source)
    aff(t) = t === nothing ? Any[] : [e for e in asvector(get(t, "affected", Any[])) if e isa AbstractDict]
    old_pkgs = Dict{String,Any}(string(get(e, "pkg", "?")) => get(e, "ranges", Any[]) for e in aff(old))
    new_affected = aff(new)
    pkgs = [string(get(e, "pkg", "")) for e in new_affected]
    components = [(src_id, vp, ranges) for (src_id, vp, ranges) in source_affected(new)
                  if any(in(packages_with_component(vp)), pkgs)]
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
    to_osv_dict(x)

Recursively convert an Advisory and all its fields (except `summary` and `details`) to serializable values for `JSON3.write`
such that it will create a valid OSV JSON
"""
to_osv_dict(v::Union{VersionNumber, VersionString, VersionRange, Dates.Time, Dates.Date}) = string(v)
to_osv_dict(x::Dates.DateTime) = chopsuffix(string(x), "Z") * "Z" # All times should be UTC; print them as such
to_osv_dict(x::Union{AbstractString, Integer, AbstractFloat, Bool}) = x
to_osv_dict(d::AbstractDict) = OrderedDict(string(k)=>to_osv_dict(v) for (k,v) in d)
to_osv_dict(A::AbstractArray) = [to_osv_dict(v) for v in A]
function to_osv_dict(a::Severity)
    # OSV-schema v1.8.0 only supports `source` values of "NVD", "CNA" or "SELF" (or missing). We also import advisories from EUVD and GitHub,
    # and if those have severities that NVD doesn't, we record those as sources too. So only include the source if it's one of the three that OSV supports.
    d = OrderedDict("type" => a.type, "score" => a.score)
    if a.source in ("NVD", "CNA", "SELF")
        d["source"] = a.source
    end
    return d
end
function to_osv_dict(a::Union{Reference, Credit, AdvisorySource})
    return OrderedDict(string(f) => to_osv_dict(getproperty(a, f)) for f in fieldnames(typeof(a)) if is_populated(getproperty(a, f)))
end
function to_osv_dict(a::Advisory)
    # The only special thing we need to is `database_specific`
    d = OrderedDict(k => to_osv_dict(v) for (k,v) in osv_pairs(a) if is_populated(v))
    d["database_specific"] = OrderedDict{String,Any}("license" => "CC-BY-4.0")
    for (k,v) in database_specific_pairs(a)
        is_populated(v) || continue
        k == "license" && error("license may not be separately specified")
        d["database_specific"][k] = to_osv_dict(v)
    end
    return d
end
# Package vulnerabilities are the one thing we store quite differently:
function to_osv_dict(vuln::PackageVulnerability)
    return Dict{String, Any}(
        "package" => OrderedDict(
            "ecosystem" => "Julia",
            "name" => vuln.pkg,
            "purl" => purl(vuln)
        ),
        "ranges" => [OrderedDict("type"=>"SEMVER", "events"=>osv_events(vuln.ranges))],
        # TODO: "versions" => registered_versions_within_the_ranges(vuln.pkg, vuln.ranges)
    )
end
