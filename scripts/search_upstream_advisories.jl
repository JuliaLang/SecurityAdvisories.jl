# Search the upstream databases (GHSA, NVD, and EUVD) for advisories and commit each search's
# findings to its own branch for a pull request apiece. A package search finds the advisories
# against a Julia package itself, and a component search finds those against an upstream
# project (like `repology.org/project/curl`) — naming every package that bundles it. Given a
# `since`, the searches are those warranted by the changes after it: the recently changed
# upstream advisories, grouped by the search that fleshes each out into a complete pull
# request, and the recently registered packages (with the projects they bundle). Otherwise
# the haystack names the search: an advisory id (fetched directly), an upstream project id,
# or a package name or list — with `components`, each package along with every upstream
# project it bundles. The committed branches are described in the JSON list written to the
# `results` path.
using SecurityAdvisories: SecurityAdvisories, Advisory
using DataStructures: OrderedDict
using Dates: Dates

isspace_or_comma(c) = isspace(c) || c == ','
is_advisory_id(s) = startswith(s, "JLSEC") || startswith(s, "CVE") || startswith(s, "EUVD") || endswith(s, r"GHSA-\w{4}-\w{4}-\w{4}")

"""
    targets(haystack; since, components) -> (; advisories, packages, projects)

The advisory ids to fetch and the packages and upstream projects to search, per the module docs.
"""
function targets(haystack; since, components)
    advisories, packages, projects = String[], String[], String[]
    if !isempty(since)
        since = Dates.DateTime(chopsuffix(since, "Z"))
        (; packages, projects) = SecurityAdvisories.search_targets(SecurityAdvisories.fetch_recent_advisories(; since))
        registered = SecurityAdvisories.packages_updated_since(since)
        packages = union(packages, registered)
        projects = union(projects, SecurityAdvisories.upstream_projects_for_package.(registered)...)
        # Skip the searches with pending PRs that jlsec-bot has already opened
        pending = SecurityAdvisories.pending_search_branches()
        packages, projects = setdiff(packages, pending), setdiff(projects, pending)
        @info "searching per the changes since $since" packages projects
    elseif isempty(haystack)
        error("nothing to search for: give a since datetime, an advisory id, an upstream project id, or a package name or list")
    elseif is_advisory_id(haystack)
        advisories = [haystack]
    elseif haskey(SecurityAdvisories.upstream_projects(), haystack)
        projects = [haystack]
    else
        packages = split(haystack, isspace_or_comma, keepempty=false)
        components && (projects = union(SecurityAdvisories.upstream_projects_for_package.(packages)...))
    end
    return (; advisories, packages, projects)
end

# `search(target)`, but log errors and return no advisories so the other searches continue
function try_search(search, target)
    try
        return search(target)
    catch ex
        @error "Error searching for $target" ex
        return Advisory[]
    end
end

"""
    search(targets; filter_results) -> OrderedDict{String,Vector{Advisory}}

The advisories found per search, keyed by its branch name. Component searches come before
package searches so their findings take precedence over the same advisories found by package.
Without `filter_results`, every match is returned rather than only the relevant ones.
"""
function search((; advisories, packages, projects); filter_results)
    fetch_advisory(id) = SecurityAdvisories.fetch_combinations([SecurityAdvisories.fetch_advisory(id)])
    search_component = filter_results ? SecurityAdvisories.search_component : SecurityAdvisories.fetch_component_matches
    search_package = filter_results ? SecurityAdvisories.search_package : SecurityAdvisories.fetch_package_matches
    results = OrderedDict{String,Vector{Advisory}}()
    for (searcher, names) in ((fetch_advisory, advisories), (search_component, projects), (search_package, packages))
        for name in sort!(collect(names))
            @info "searching for $name"
            results[name] = try_search(searcher, name)
        end
    end
    return results
end

# Boolean arguments default to true; only "false" turns them off
function main(haystack = get(ARGS, 1, ""), filter_results = get(ARGS, 2, "") != "false",
              components = get(ARGS, 3, "") != "false", since = get(ARGS, 4, ""),
              results_path = get(ARGS, 5, "search-results.json"))
    results = search(targets(haystack; since, components); filter_results)
    branches = SecurityAdvisories.commit_search_branches(results)
    SecurityAdvisories.write_search_results(results_path, branches)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
