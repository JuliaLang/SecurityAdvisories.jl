# Publish search findings: write them to advisory files and commit them to a branch for a
# pull request apiece. The search scripts run from the repository root and hand the
# committed branches to the workflow as JSON, which pushes them and opens the pull requests.

"""
    write_advisory_files(advisories, filter_results)

Create or update the advisory file for each of the `advisories`, merging each into its
existing JLSEC advisory when there is one. When `filter_results`, reviewed-and-rejected
packages are stripped and results that are invalid or not vulnerable are skipped.
"""
function write_advisory_files(advisories, filter_results)
    for advisory in advisories
        filter_results && strip_rejected!(advisory)
        existing = find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = update(existing, advisory)
        elseif filter_results && (!is_valid(advisory) || !is_vulnerable(advisory))
            if !is_vulnerable(advisory) && !isnothing(find_rejected(advisory))
                @warn "Advisory $(vcat(advisory.upstream, advisory.aliases)) was previously reviewed and rejected (see advisories/rejected.toml), skipping publication. Re-run with the filter disabled to import it anyway."
            else
                @warn "Advisory $(vcat(advisory.upstream, advisory.aliases)) is not valid or not vulnerable and does not have an existing JLSEC advisory, skipping publication"
            end
            continue
        end
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(year(advisory))))
        open(joinpath(dir, advisory.id * ".md"), "w") do io
            print(io, advisory)
        end
    end
end

"""
    commit_search_branch(branch, advisories, base; filter_results=true, haystack=branch)

Write the `advisories` to the branch `branch` (started afresh from `base`) and commit them,
returning the pull request message as `(; branch, title, body, recipe_updates)`, or
`nothing` when they change no advisory files. The `haystack` describes what was searched.
"""
function commit_search_branch(branch, advisories, base; filter_results=true, haystack=branch)
    run(`git checkout -q -B $branch $base`)
    write_advisory_files(advisories, filter_results)
    run(`git add advisories`)
    (; n_changed, title, body, recipe_updates) = search_pr_message("HEAD"; haystack)
    if n_changed == 0
        @info "no changes for $branch"
        return nothing
    end
    run(`git commit -q -m $title`)
    @info "committed $n_changed changed advisories to $branch"
    return (; branch, title, body, recipe_updates)
end

"""
    commit_search_branches(results; filter_results=true)

Commit each `branch => advisories` pair in `results` with [`commit_search_branch`](@ref),
starting each branch from the current commit and returning to it afterwards. Returns the
pull request messages of the branches with changes.
"""
function commit_search_branches(results; filter_results=true)
    base = readchomp(`git rev-parse HEAD`)
    branches = []
    for (branch, advisories) in results
        isempty(advisories) && continue
        try
            result = commit_search_branch(branch, advisories, base; filter_results)
            isnothing(result) || push!(branches, result)
        finally
            # Leave the tree as we found it, detached from the branch so it keeps its commit
            run(`git checkout -qf $base`)
            run(`git clean -qfd -- advisories`)
        end
    end
    @info "committed $(length(branches)) branches" [b.branch for b in branches]
    return branches
end

"""
    write_search_results(path, branches)

Write the committed `branches` as a JSON list for the workflow to push and open pull requests from.
"""
write_search_results(path, branches) = open(io -> JSON3.write(io, branches), path, "w")
