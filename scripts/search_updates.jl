# Search for advisories against recently-changed packages, committing each finding to its
# own branch for a pull request apiece. There are two modes:
#   * `updated-packages` considers every package with a version registered after `since`
#   * `updated-advisories` considers every package affected by an upstream advisory that
#     changed after `since`
# Each candidate package is searched for advisories directly against it, and each of the
# upstream projects the candidates bundle (like `repology.org/project/curl`) is searched
# once, exhaustively, for advisories against its components — a search whose findings name
# every affected package, not just the candidates. The branches are named by the package
# or the project id. The branches with changes are described in a JSON list written to the
# `results` path (their `branch`, `title`, `body`, and `recipe_updates`) for the workflow
# to push and open pull requests from.
using SecurityAdvisories: SecurityAdvisories, Advisory
using JSON3: JSON3
using Dates: Dates
using DataStructures: OrderedDict

include("search_upstream_advisories.jl") # for write_advisory_files

function find_candidates(mode, since)
    mode == "updated-packages" && return SecurityAdvisories.packages_updated_since(since)
    mode == "updated-advisories" && return SecurityAdvisories.packages_with_updated_advisories(since)
    error("unknown mode: $mode (expected updated-packages or updated-advisories)")
end

"""
    search_targets(candidates, pending) -> OrderedDict{String,Vector{Advisory}}

The advisories found for each search target: the upstream projects the `candidates`
bundle (searched once each, skipping those with `pending` branches) followed by the
candidates themselves (for direct advisories only). Advisories found against a project
are left out of the packages' results.
"""
function search_targets(candidates, pending)
    projects = Set(Iterators.flatten(SecurityAdvisories.upstream_projects_for_package.(candidates)))
    projects = sort!(collect(setdiff(projects, pending)))
    results = OrderedDict{String,Vector{Advisory}}()
    for proj in projects
        @info "searching for advisories against upstream project $proj"
        results[proj] = SecurityAdvisories.try_search(SecurityAdvisories.search_component, proj, true)
    end
    found = Set(adv.id for advisories in values(results) for adv in advisories)
    for pkg in candidates
        @info "searching for advisories against $pkg"
        results[pkg] = filter(adv -> adv.id ∉ found, SecurityAdvisories.try_search(SecurityAdvisories.search_direct, pkg, true))
    end
    return results
end

"""
    commit_search_branch(branch, advisories, base) -> (; branch, title, body, recipe_updates) or nothing

Write the `advisories` to the branch `branch` (started afresh from `base`) and commit them,
returning the pull request message; `nothing` when they change no advisory files.
"""
function commit_search_branch(branch, advisories, base)
    run(`git checkout -q -B $branch $base`)
    write_advisory_files(advisories, true)
    run(`git add advisories`)
    (; n_changed, title, body, recipe_updates) = SecurityAdvisories.search_pr_message("HEAD"; haystack=branch)
    if n_changed == 0
        @info "no changes for $branch"
        return nothing
    end
    run(`git commit -q -m $title`)
    @info "committed $n_changed changed advisories to $branch"
    return (; branch, title, body, recipe_updates)
end

function main(mode = get(ARGS, 1, ""), since_str = get(ARGS, 2, ""), results_path = get(ARGS, 3, "search-results.json"))
    since = Dates.DateTime(chopsuffix(since_str, "Z"))
    candidates = sort!(find_candidates(mode, since))
    @info "found $(length(candidates)) candidate packages for $mode since $since" candidates
    # We skip the packages and projects with pending PRs that jlsec-bot has already opened
    pending = SecurityAdvisories.pending_search_branches()
    filter!(pkg -> !SecurityAdvisories.is_pending(pkg, pending), candidates)
    results = search_targets(candidates, pending)
    base = readchomp(`git rev-parse HEAD`)
    branches = []
    for (branch, advisories) in results
        isempty(advisories) && continue
        try
            result = commit_search_branch(branch, advisories, base)
            isnothing(result) || push!(branches, result)
        finally
            # Leave the tree as we found it
            run(`git reset -q --hard $base`)
            run(`git clean -qfd -- advisories`)
        end
    end
    @info "committed $(length(branches)) branches" [b.branch for b in branches]
    open(results_path, "w") do io
        JSON3.write(io, branches)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
