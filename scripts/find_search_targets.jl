# Identify the packages that warrant a finely-scoped upstream advisory search — and thus
# their own pull request. There are two modes:
#   * `updated-packages` considers every package with a version registered after `since`
#   * `updated-advisories` considers every package affected by an upstream advisory that
#     changed after `since`
# Each candidate is then searched (exactly as `search_upstream_advisories.jl` would) and
# only the packages whose search finds something are emitted, as the `packages` JSON list
# in the GitHub Actions output. The workflow re-runs the full search for each such package
# in its own job to open one pull request per package.
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
    filter!(!in(SecurityAdvisories.pending_search_branches()), candidates)
    packages = filter(candidates) do pkg
        @info "searching for $pkg"
        !isempty(SecurityAdvisories.try_search_package(pkg, true))
    end
    @info "found $(length(packages)) packages with search results" packages
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    println(io, "packages=", JSON3.write(packages))
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
