# Search the upstream databases (GHSA, NVD, and EUVD) for advisories and commit each target's
# findings to its own branch for a pull request apiece. There are two kinds of search: a
# package search finds the advisories against a Julia package itself, and a component search
# finds those against an upstream project (like `repology.org/project/curl`) — naming every
# package that bundles it. Given a `since`, the targets are whatever the changes after it
# warrant (see `SecurityAdvisories.updated_search_targets`); otherwise the haystack names
# them: an advisory id (fetched directly), an upstream project id, or a package name or list
# — with `components`, each package is searched along with every upstream project it bundles.
# The committed branches are described in the JSON list written to the `results` path.
using SecurityAdvisories: SecurityAdvisories
using DataStructures: OrderedDict
using Dates: Dates

isspace_or_comma(c) = isspace(c) || c == ','
is_advisory_id(s) = startswith(s, "JLSEC") || startswith(s, "CVE") || startswith(s, "EUVD") || endswith(s, r"GHSA-\w{4}-\w{4}-\w{4}")

"""
    search(haystack, filter_results, components, since) -> OrderedDict{String,Vector{Advisory}}

The advisories found per search target (which names its branch), per the module docs.
"""
function search(haystack, filter_results, components, since)
    if !isempty(since)
        (; packages, projects) = SecurityAdvisories.updated_search_targets(Dates.DateTime(chopsuffix(since, "Z")))
        @info "searching the targets warranted by the changes since $since" packages projects
        # Skip the targets with pending PRs that jlsec-bot has already opened
        pending = SecurityAdvisories.pending_search_branches()
        return SecurityAdvisories.search_targets(packages, projects, filter_results; pending)
    elseif isempty(haystack)
        error("nothing to search for: give a since datetime, an advisory id, an upstream project id, or a package name or list")
    elseif is_advisory_id(haystack)
        @info "fetching $haystack"
        advisories = SecurityAdvisories.fetch_combinations([SecurityAdvisories.fetch_advisory(haystack)])
        return OrderedDict(haystack => SecurityAdvisories.combine_found!(advisories))
    elseif haskey(SecurityAdvisories.upstream_projects(), haystack)
        return SecurityAdvisories.search_targets(String[], [haystack], filter_results)
    else
        packages = split(haystack, isspace_or_comma, keepempty=false)
        projects = components ? union(Set{String}(), SecurityAdvisories.upstream_projects_for_package.(packages)...) : String[]
        return SecurityAdvisories.search_targets(packages, projects, filter_results)
    end
end

function main(haystack = get(ARGS, 1, ""), filter_results = lowercase(get(ARGS, 2, "true")) == "true",
              components = lowercase(get(ARGS, 3, "true")) == "true", since = get(ARGS, 4, ""),
              results_path = get(ARGS, 5, "search-results.json"))
    results = search(haystack, filter_results, components, since)
    branches = SecurityAdvisories.commit_search_branches(results; filter_results)
    SecurityAdvisories.write_search_results(results_path, branches)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
