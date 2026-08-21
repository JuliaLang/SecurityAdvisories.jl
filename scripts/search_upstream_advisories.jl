using SecurityAdvisories: SecurityAdvisories, Advisory, print_search_pr_outputs
using GeneralMetadata
using Dates: Dates

isspace_or_comma(c) = isspace(c) || c == ','

"""
    search_advisories(input, filter_results) -> (; advisories, branch, haystack)

Search the upstream databases per `input`: an advisory identifier, an `upstream:<project>`
component search, a package name, a space/comma-separated package list, or — when empty —
a walk through the ecosystem until something turns up. Returns the found advisories (with
aliases combined), the branch name for the results (the upstream project name when every
finding is against one component, the package the walk landed on, or otherwise `input`),
and a description of what was searched.
"""
function search_advisories(input, filter_results)
    advisories = Advisory[]
    branch = haystack = input
    if startswith(input, "JLSEC") || startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        append!(advisories, SecurityAdvisories.fetch_combinations([SecurityAdvisories.fetch_advisory(input)]))
    elseif startswith(input, "upstream:")
        branch = String(chopprefix(input, "upstream:"))
        @info "searching for advisories against upstream project $branch"
        append!(advisories, SecurityAdvisories.search_component(branch, filter_results))
    elseif !isempty(input) && !any(isspace_or_comma, input)
        @info "searching for $input"
        append!(advisories, SecurityAdvisories.search_package(input, filter_results))
    else
        whole_pkg_list = if any(isspace_or_comma, input)
            split(input, isspace_or_comma, keepempty=false)
        else
            # We take a (not totally) random walk through the ecosystem, prioritizing
            # JLLs and registrations in the last three days, avoiding packages for which we have active PRs
            pkgdate = sort([(pkg, SecurityAdvisories.last_registered(info)) for (pkg, info) in GeneralMetadata.metadata()],
                by=x->(endswith(x[1], "jll"), (Dates.now() - x[2] < Dates.Day(3)), rand()), rev=true)
            first.(pkgdate) # shuffle!(collect(keys(GeneralMetadata.metadata())))
        end
        # We remove any pending PRs that jlsec-bot has already opened, whether branched by
        # the package name or by one of the package's upstream components
        # TODO: it'd be even better to include these and check for changes _against_ these branches because the metadata may have improved
        pending = SecurityAdvisories.pending_search_branches()
        filter!(whole_pkg_list) do pkg
            pkg ∉ pending && isdisjoint(SecurityAdvisories.short_project_name.(SecurityAdvisories.upstream_projects_for_package(pkg)), pending)
        end
        pkg_search_count = 0
        while isempty(advisories) && !isempty(whole_pkg_list)
            branch = popfirst!(whole_pkg_list)
            pkg_search_count += 1
            @info "searching for $branch"
            append!(advisories, SecurityAdvisories.try_search_package(branch, filter_results))
        end
        haystack = "$pkg_search_count packages"
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
# branch by its project so repeated searches (and the scoped `upstream:<project>` targets)
# share one pull request
function component_branch(advisories)
    (isempty(advisories) || any(SecurityAdvisories.is_direct, advisories)) && return nothing
    projects = unique!(reduce(vcat, SecurityAdvisories.advisory_projects.(advisories); init=String[]))
    length(projects) == 1 || return nothing
    return SecurityAdvisories.short_project_name(only(projects))
end

"""
    write_advisory_files(advisories, filter_results)

Create or update the advisory file for each of the `advisories`, merging each into its
existing JLSEC advisory when there is one. When `filter_results`, reviewed-and-rejected
packages are stripped and results that are invalid or not vulnerable are skipped.
"""
function write_advisory_files(advisories, filter_results)
    for advisory in advisories
        filter_results && SecurityAdvisories.strip_rejected!(advisory)
        existing = SecurityAdvisories.find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = SecurityAdvisories.update(existing, advisory)
        elseif filter_results && (!SecurityAdvisories.is_valid(advisory) || !SecurityAdvisories.is_vulnerable(advisory))
            if !SecurityAdvisories.is_vulnerable(advisory) && !isnothing(SecurityAdvisories.find_rejected(advisory))
                @warn "Advisory $(vcat(advisory.upstream, advisory.aliases)) was previously reviewed and rejected (see advisories/rejected.toml), skipping publication. Re-run with the filter disabled to import it anyway."
            else
                @warn "Advisory $(vcat(advisory.upstream, advisory.aliases)) is not valid or not vulnerable and does not have an existing JLSEC advisory, skipping publication"
            end
            continue
        end
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(SecurityAdvisories.year(advisory))))
        open(joinpath(dir, advisory.id * ".md"), "w") do io
            SecurityAdvisories.print(io, advisory)
        end
    end
end

function main(input = get(ARGS, 1, ""), filter_results = lowercase(get(ARGS, 2, "true")) == "true")
    (; advisories, branch, haystack) = search_advisories(input, filter_results)
    write_advisory_files(advisories, filter_results)
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    println(io, "branch=", branch)
    print_search_pr_outputs(io, "HEAD"; haystack)
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
