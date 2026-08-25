# Search for advisories against the packages that changed after `since` — those with a newly
# registered version and those affected by an upstream advisory that changed — committing
# each finding to its own branch for a pull request apiece. Each candidate package is
# searched for advisories directly against it, and each of the upstream projects the
# candidates bundle (like `repology.org/project/curl`) is searched once, exhaustively, for
# advisories against its components — a search whose findings name every affected package,
# not just the candidates. The branches are named by the package or the project id and
# described in the JSON list written to the `results` path.
using SecurityAdvisories: SecurityAdvisories
using Dates: Dates

function main(since_str = get(ARGS, 1, ""), results_path = get(ARGS, 2, "search-results.json"))
    since = Dates.DateTime(chopsuffix(since_str, "Z"))
    candidates = sort!(union(SecurityAdvisories.packages_updated_since(since),
                             SecurityAdvisories.packages_with_updated_advisories(since)))
    @info "found $(length(candidates)) candidate packages updated since $since" candidates
    # We skip the packages and projects with pending PRs that jlsec-bot has already opened
    pending = SecurityAdvisories.pending_search_branches()
    filter!(pkg -> !SecurityAdvisories.is_pending(pkg, pending), candidates)
    results = SecurityAdvisories.search_targets(candidates, pending)
    branches = SecurityAdvisories.commit_search_branches(results)
    SecurityAdvisories.write_search_results(results_path, branches)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
