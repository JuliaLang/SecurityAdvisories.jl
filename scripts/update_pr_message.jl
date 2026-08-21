#!/usr/bin/env julia
# Recompute the search workflow's pull request message from the advisory files that
# changed on this branch, writing the `n_changed=`, `title=`, `recipe_updates=`, and
# `body` GitHub Actions outputs. See `SecurityAdvisories.print_search_pr_outputs`.
#
# Usage:
#   julia --project=. scripts/update_pr_message.jl <base> [<target>]
#
# The comparison runs from the merge base of the two revisions, so an advanced `base`
# branch doesn't count its own changes against this one. The default target is HEAD;
# pass an empty string as the target to compare against the working tree instead.
using SecurityAdvisories: print_search_pr_outputs

if abspath(PROGRAM_FILE) == @__FILE__
    base = get(ARGS, 1, "origin/main")
    target = get(ARGS, 2, "HEAD")
    target = isempty(target) ? nothing : target
    base = readchomp(`git merge-base $base $(something(target, "HEAD"))`)
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    print_search_pr_outputs(io, base, target)
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end
