# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
#
# This runs in two fully-separate phases:
#   1. `update_advisory_files` searches the upstream databases and writes the advisory files
#   2. `SecurityAdvisories.print_search_pr_outputs` composes the pull request title and body
#      from the state of the branch alone (the changed advisory files); it can be re-run at
#      any time via scripts/update_pr_message.jl — for example after edits land on the branch
using SecurityAdvisories: SecurityAdvisories, Advisory, GitHub, print_search_pr_outputs
using GeneralMetadata
using Dates: Dates

isspace_or_comma(c) = isspace(c) || c == ','

"""
    update_advisory_files(input, filter_results) -> (; branch, haystack)

Search the upstream databases per `input` and write the new or updated advisory files.
Returns the branch name and a description of what was searched; everything else about
this run is left to be read back from the changed files themselves.
"""
function update_advisory_files(input, filter_results)
    advisories = Advisory[]
    haystack = input
    if startswith(input, "JLSEC") || startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        append!(advisories, SecurityAdvisories.fetch_combinations([SecurityAdvisories.fetch_advisory(input)]))
    elseif !isempty(input) && !any(isspace_or_comma, input)
        @info "searching for $input"
        append!(advisories, SecurityAdvisories.search_package(input, filter_results))
    else
        whole_pkg_list = if any(isspace_or_comma, input)
            split(input, isspace_or_comma, keepempty=false)
        else
            # We take a (not totally) random walk through the ecosystem, prioritizing
            # JLLs and registrations in the last three days, avoiding packages for which we have active PRs
            pkgdate = sort([(pkg, maximum(v->get(v, "registered", typemin(Dates.DateTime)), values(info))) for (pkg, info) in GeneralMetadata.metadata()],
                by=x->(endswith(x[1], "jll"), (Dates.now() - x[2] < Dates.Day(3)), rand()), rev=true)
            first.(pkgdate) # shuffle!(collect(keys(GeneralMetadata.metadata())))
        end
        # We remove any pending PRs that jlsec-bot has already opened
        # TODO: it'd be even better to include these and check for changes _against_ these branches because the metadata may have improved
        filter!(!in(Set(GitHub.fetch_branches("jlsec-bot", "SecurityAdvisories.jl"))), whole_pkg_list)
        pkg_search_count = 0
        while isempty(advisories) && !isempty(whole_pkg_list)
            input = popfirst!(whole_pkg_list)
            pkg_search_count += 1
            @info "searching for $input"
            try
                append!(advisories, SecurityAdvisories.search_package(input, filter_results))
            catch ex
                @error "Error searching for $input" ex
                empty!(advisories)
            end
        end
        haystack = "$pkg_search_count packages"
    end

    @info "found $(length(advisories)) advisories in $input"
    # We may have gathered advisories that are aliases of eachother (but hopefully not!)
    n_pre = length(advisories)
    pre_srcs = [[src.id for src in a.jlsec_sources] for a in advisories]
    SecurityAdvisories.combine_aliases!(advisories)
    if length(advisories) < n_pre
        @warn "combined $(n_pre - length(advisories)) advisories through alias information!"
        @show pre_srcs
        @show [[src.id for src in a.jlsec_sources] for a in advisories]
    end

    # Now create or update the found advisories:
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
    return (; branch=input, haystack)
end

function main(input = get(ARGS, 1, ""), filter_results = lowercase(get(ARGS, 2, "true")) == "true")
    (; branch, haystack) = update_advisory_files(input, filter_results)
    # The PR message is composed entirely from the changed files, comparing HEAD to the working tree
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    println(io, "branch=", branch)
    print_search_pr_outputs(io, "HEAD"; haystack)
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
