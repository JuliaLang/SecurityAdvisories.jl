using DataStructures: OrderedDict
using Dates: DateTime
using CommonMark: CommonMark
using TOML: TOML

"""
    IgnoredAdvisory(; upstream, reviewed, affected=PackageVulnerability[], reason=nothing)

Record an upstream advisory (and its aliases) that was reviewed and intentionally *not* imported,
preventing the automation from repeatedly re-proposing it.

Unlike a simple denylist, this stores the `affected` packages and ranges _as they were assessed_
at review time, and its scope is exactly those packages. An entry may cover all of an advisory's
packages (fully ignoring it) or just some of them (rejecting those packages while the advisory
remains published for the rest). An ignored package is re-proposed for human review if a future
import would materially improve upon its recorded assessment — if it sets an upper bound where
none was recorded — and newly-matched packages are never ignored (see [`strip_ignored!`](@ref)).

These are stored in `advisories/ignored/`, one file per ignored alias set, named by its
preferred upstream identifier. They use the same Markdown-with-TOML-frontmatter format as
published advisories, but with only three data fields (`upstream`, `reviewed`, and `affected`);
the Markdown body documents the human reasoning for the rejection.
"""
@kwdef struct IgnoredAdvisory
    upstream::Vector{String}
    reviewed::DateTime
    affected::Vector{PackageVulnerability} = PackageVulnerability[]
    reason::Union{String, Nothing} = nothing
end

function Base.:(==)(a::IgnoredAdvisory, b::IgnoredAdvisory)
    return to_toml_frontmatter(a) == to_toml_frontmatter(b) && a.reason == b.reason
end
Base.hash(a::IgnoredAdvisory, h::UInt) = hash(to_toml_frontmatter(a), hash(a.reason, hash(0x1a2b90d54c7e6f83, h)))

function to_toml_frontmatter(entry::IgnoredAdvisory)
    d = OrderedDict{String,Any}("upstream" => to_toml_frontmatter(entry.upstream),
                                "reviewed" => entry.reviewed)
    isempty(entry.affected) || (d["affected"] = to_toml_frontmatter(entry.affected))
    return d
end

function Base.print(io::IO, entry::IgnoredAdvisory)
    frontmatter = sprint(TOML.print, to_toml_frontmatter(entry))
    nticks = maximum(x->length(x.captures[1])+1, eachmatch(r"^\s*(`+)\s*$", frontmatter), init=3)
    buf = IOBuffer()
    println(buf, repeat("`", nticks), "toml")
    print(buf, frontmatter)
    println(buf, repeat("`", nticks))
    println(buf)
    is_populated(entry.reason) && println(buf, entry.reason)
    seekstart(buf)
    println(io, CommonMark.markdown(CommonMark.Parser()(buf)))
end
Base.show(io::IO, mime::MIME"text/plain", entry::IgnoredAdvisory) = show(io, mime, CommonMark.Parser()(sprint(print, entry)))

parse_ignored_file(filename) = something(open(io->tryparse(IgnoredAdvisory, io), filename))
function Base.tryparse(::Type{IgnoredAdvisory}, s::Union{AbstractString, IO})
    doc = (CommonMark.Parser())(s)
    toml = doc.first_child
    isdefined(toml, :t) && toml.t isa CommonMark.CodeBlock && toml.t.info == "toml" || return nothing
    frontmatter = TOML.tryparse(toml.literal)
    frontmatter === nothing && return nothing
    doc.first_child = toml.nxt
    remainder = strip(CommonMark.markdown(doc))
    reason = isempty(remainder) ? nothing : String(remainder)
    return try
        IgnoredAdvisory(; Dict(Symbol(k)=>v for (k,v) in frontmatter)..., reason)
    catch _
        nothing
    end
end

const IGNORED_PATH = joinpath(@__DIR__, "..", "advisories", "ignored")

"""
    ignored_advisories(path=IGNORED_PATH)

Parse and return all [`IgnoredAdvisory`](@ref) entries stored in `path`. A file that fails to
parse is an error — it would otherwise silently stop ignoring its advisory.
"""
function ignored_advisories(path=IGNORED_PATH)
    isdir(path) || return IgnoredAdvisory[]
    entries = IgnoredAdvisory[]
    for file in readdir(path; join=true, sort=true)
        endswith(file, ".md") || continue
        entry = open(io->tryparse(IgnoredAdvisory, io), file)
        isnothing(entry) && error("failed to parse ignored advisory file $file")
        push!(entries, entry)
    end
    return entries
end

"""
    find_ignored(advisory::Advisory; path=IGNORED_PATH)
    find_ignored(ids; path=IGNORED_PATH)

Return the [`IgnoredAdvisory`](@ref) whose `upstream` ids intersect the given advisory's
ids (or the given collection of ids), or `nothing` if there is none.
"""
function find_ignored(ids; path=IGNORED_PATH)
    uids = Set(unscoped_id.(ids))
    for entry in ignored_advisories(path)
        any(id -> unscoped_id(id) in uids, entry.upstream) && return entry
    end
    return nothing
end
function find_ignored(a::Advisory; path=IGNORED_PATH)
    return find_ignored(Iterators.flatten((a.upstream, a.aliases, (src.id for src in a.jlsec_sources))); path)
end

"""
    strip_ignored!(advisory::Advisory; path=IGNORED_PATH)

Remove reviewed-and-rejected package assessments from the advisory's `affected` list, as
recorded by a matching [`IgnoredAdvisory`](@ref). A recorded package is kept only if the new
assessment materially improves upon the recorded one — that is, it sets an upper bound where
the recorded assessment had none — so that it is re-proposed for human review. Packages not
recorded in the entry are always kept: an entry may reject an advisory for just one package
while the advisory remains published for others.
"""
function strip_ignored!(a::Advisory; path=IGNORED_PATH)
    entry = find_ignored(a; path)
    isnothing(entry) && return a
    filter!(a.affected) do v
        recorded = findfirst(r -> r.pkg == v.pkg, entry.affected)
        isnothing(recorded) && return true
        return vuln_with_upper_bound(v) && !vuln_with_upper_bound(entry.affected[recorded])
    end
    return a
end
