using TOML: TOML

const REJECTED_PATH = joinpath(@__DIR__, "..", "advisories", "rejected.toml")
const REJECTED_ADVISORIES = Ref{Dict{String, Any}}()

"""
    rejected_advisories(path=REJECTED_PATH)

Return the table of upstream advisories that were reviewed and rejected, preventing the
automation from re-proposing them. Each entry is keyed by the advisory's preferred upstream
id and has optional fields:
* `aliases` — other upstream ids for the same advisory
* `packages` — reject it only for these packages; when omitted, the advisory is rejected
  outright for all packages until the entry is removed
* `reason` — why it doesn't apply
"""
function rejected_advisories(path=REJECTED_PATH)
    path === REJECTED_PATH || return TOML.parsefile(path)
    isassigned(REJECTED_ADVISORIES) && return REJECTED_ADVISORIES[]
    return REJECTED_ADVISORIES[] = TOML.parsefile(path)
end

"""
    find_rejected(advisory::Advisory; path=REJECTED_PATH)
    find_rejected(ids; path=REJECTED_PATH)

Return the `id => entry` pair from [`rejected_advisories`](@ref) whose id or `aliases`
intersect the given advisory's ids (or the given collection of ids), or `nothing`.
"""
function find_rejected(ids; path=REJECTED_PATH)
    uids = Set(unscoped_id.(ids))
    for (id, entry) in rejected_advisories(path)
        if unscoped_id(id) in uids || any(a -> unscoped_id(a) in uids, get(entry, "aliases", String[]))
            return id => entry
        end
    end
    return nothing
end
function find_rejected(a::Advisory; path=REJECTED_PATH)
    return find_rejected(Iterators.flatten((a.upstream, a.aliases, (src.id for src in a.jlsec_sources))); path)
end

"""
    strip_rejected!(advisory::Advisory; path=REJECTED_PATH)

Remove reviewed-and-rejected package assessments from the advisory's `affected` list, as
recorded in [`rejected_advisories`](@ref). A rejection with a `packages` field only rejects
those packages: the advisory may remain published for other packages, and if it newly matches
a package that isn't listed, that assessment is kept and proposed for human review. An entry
without `packages` rejects the advisory's entire `affected` list.
"""
function strip_rejected!(a::Advisory; path=REJECTED_PATH)
    rejection = find_rejected(a; path)
    isnothing(rejection) && return a
    entry = last(rejection)
    if haskey(entry, "packages")
        filter!(v -> v.pkg ∉ entry["packages"], a.affected)
    else
        empty!(a.affected)
    end
    return a
end
