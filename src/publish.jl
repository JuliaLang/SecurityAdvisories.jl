# Publish search findings: write them to advisory files and commit them to a branch for a
# pull request apiece. The search scripts run from the repository root and hand the
# committed branches to the workflow as JSON, which pushes them and opens the pull requests.

"""
    write_advisory_files(advisories)

Create or update the advisory file for each of the `advisories`, merging each into its
existing JLSEC advisory when there is one.
"""
function write_advisory_files(advisories)
    for advisory in advisories
        existing = find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        isnothing(existing) || (advisory = update(existing, advisory))
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(year(advisory))))
        open(joinpath(dir, advisory.id * ".md"), "w") do io
            print(io, advisory)
        end
    end
end

"""
    commit_search_branch(branch, advisories, base)

Write the `advisories` to the branch `branch` (started afresh from `base`) and commit them,
returning the pull request message as `(; branch, title, body, recipe_updates)`, or
`nothing` when they change no advisory files.
"""
function commit_search_branch(branch, advisories, base)
    run(`git checkout -q -B $branch $base`)
    write_advisory_files(advisories)
    run(`git add advisories`)
    (; n_changed, title, body, recipe_updates) = search_pr_message("HEAD"; haystack=branch)
    if n_changed == 0
        @info "no changes for $branch"
        return nothing
    end
    run(`git commit -q -m $title`)
    @info "committed $n_changed changed advisories to $branch"
    return (; branch, title, body, recipe_updates)
end

"""
    commit_search_branches(results)

Commit each `branch => advisories` pair in `results` with [`commit_search_branch`](@ref),
starting each branch from the current commit and returning to it afterwards. An advisory
committed to an earlier branch is left out of the later ones, so one search's findings
take precedence in the order given. Returns the pull request messages of the branches
with changes.
"""
function commit_search_branches(results)
    base = readchomp(`git rev-parse HEAD`)
    branches = []
    committed = Set{String}()
    for (branch, advisories) in results
        advisories = filter(adv -> adv.id ∉ committed, advisories)
        isempty(advisories) && continue
        try
            result = commit_search_branch(branch, advisories, base)
            isnothing(result) || push!(branches, result)
            union!(committed, adv.id for adv in advisories)
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
