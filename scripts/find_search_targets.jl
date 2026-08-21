# Identify the packages that warrant a finely-scoped upstream advisory search — and thus
# their own pull request. There are two modes:
#   * `updated-packages` considers every package with a version registered after `since`
#   * `updated-advisories` considers every package affected by an upstream advisory that
#     changed after `since`
# Each candidate is then searched (exactly as `search_upstream_advisories.jl` would) and
# each finding becomes a search target scoped to match its blast radius: direct advisories
# are scoped by the package name, while upstream advisories — which name every affected
# package — are scoped by their `upstream:<project>` component. The unique targets are
# emitted as the `targets` JSON list in the GitHub Actions output, and the workflow
# re-runs the full search for each one in its own job to open one pull request apiece.
using SecurityAdvisories: SecurityAdvisories
using JSON3: JSON3
using Dates: Dates

function find_candidates(mode, since)
    mode == "updated-packages" && return SecurityAdvisories.packages_updated_since(since)
    mode == "updated-advisories" && return SecurityAdvisories.packages_with_updated_advisories(since)
    error("unknown mode: $mode (expected updated-packages or updated-advisories)")
end

function main(mode = get(ARGS, 1, ""), since_str = get(ARGS, 2, ""))
    since = Dates.DateTime(chopsuffix(since_str, "Z"))
    candidates = sort!(find_candidates(mode, since))
    @info "found $(length(candidates)) candidate packages for $mode since $since" candidates
    # We remove any pending PRs that jlsec-bot has already opened
    pending = SecurityAdvisories.pending_search_branches()
    filter!(!in(pending), candidates)
    targets = Set{String}()
    for pkg in candidates
        @info "searching for $pkg"
        for advisory in SecurityAdvisories.try_search_package(pkg, true)
            projects = SecurityAdvisories.advisory_projects(advisory)
            if SecurityAdvisories.is_direct(advisory) || isempty(projects)
                push!(targets, pkg)
            else
                union!(targets, "upstream:" .* SecurityAdvisories.short_project_name.(projects))
            end
        end
    end
    # A target's search branch is its package or project name; skip those already pending
    targets = sort!([t for t in targets if chopprefix(t, "upstream:") ∉ pending])
    @info "found $(length(targets)) search targets" targets
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    println(io, "targets=", JSON3.write(targets))
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
