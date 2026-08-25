using SecurityAdvisories: SecurityAdvisories, Advisory

isspace_or_comma(c) = isspace(c) || c == ','

"""
    search_advisories(input, filter_results) -> (; advisories, branch, haystack)

Search the upstream databases per `input`: an advisory identifier, an upstream project id
(like `repology.org/project/curl`), a package name, or a space/comma-separated package
list. Returns the found advisories (with aliases combined), the branch name for the
results (the upstream project id when every finding is against one component, otherwise
`input` with any separators dashed), and a description of what was searched.
"""
function search_advisories(input, filter_results)
    advisories = Advisory[]
    branch = haystack = input
    if isempty(input)
        error("nothing to search for: give an advisory id, upstream project id, package name, or list of packages")
    elseif startswith(input, "JLSEC") || startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        append!(advisories, SecurityAdvisories.fetch_combinations([SecurityAdvisories.fetch_advisory(input)]))
    elseif haskey(SecurityAdvisories.upstream_projects(), input)
        @info "searching for advisories against upstream project $input"
        append!(advisories, SecurityAdvisories.search_component(input, filter_results))
    elseif !isempty(input) && !any(isspace_or_comma, input)
        @info "searching for $input"
        append!(advisories, SecurityAdvisories.search_package(input, filter_results))
    else
        pkgs = split(input, isspace_or_comma, keepempty=false)
        branch = join(pkgs, "-")
        for pkg in pkgs
            @info "searching for $pkg"
            append!(advisories, SecurityAdvisories.try_search(SecurityAdvisories.search_package, pkg, filter_results))
        end
    end
    branch = something(component_branch(advisories), branch)

    @info "found $(length(advisories)) advisories in $branch"
    # We may have gathered advisories that are aliases of eachother (but hopefully not!)
    n_pre = length(advisories)
    pre_srcs = [[src.id for src in a.jlsec_sources] for a in advisories]
    SecurityAdvisories.combine_aliases!(advisories)
    if length(advisories) < n_pre
        @warn "combined $(n_pre - length(advisories)) advisories through alias information!"
        @show pre_srcs
        @show [[src.id for src in a.jlsec_sources] for a in advisories]
    end
    return (; advisories, branch, haystack)
end

# An all-upstream find against a single component is really about that component: name the
# branch by its project id so repeated searches (and the scoped project targets) share one
# pull request
function component_branch(advisories)
    (isempty(advisories) || any(SecurityAdvisories.is_direct, advisories)) && return nothing
    projects = unique(Iterators.flatten(SecurityAdvisories.advisory_projects.(advisories)))
    return length(projects) == 1 ? only(projects) : nothing
end

function main(input = get(ARGS, 1, ""), filter_results = lowercase(get(ARGS, 2, "true")) == "true", results_path = get(ARGS, 3, "search-results.json"))
    (; advisories, branch, haystack) = search_advisories(input, filter_results)
    branches = SecurityAdvisories.commit_search_branches([branch => advisories]; filter_results, haystack)
    SecurityAdvisories.write_search_results(results_path, branches)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
