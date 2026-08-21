#!/usr/bin/env julia
# Generate a summary pull request message based upon the advisory files that
# changed on this branch, writing the `n_changed=`, `title=`, `recipe_updates=`, and
# `body` GitHub Actions outputs. See `SecurityAdvisories.print_search_pr_outputs`.
#
# Usage:
#   julia --project=. scripts/update_pr_message.jl [<spec>]
#
# The spec is any `git diff`-style revision spec. The default, "origin/main...HEAD",
# compares against the merge base so an advanced `base` branch doesn't count its own
# changes against this one; pass a lone revision to compare against the working tree.
using SecurityAdvisories: print_search_pr_outputs

if abspath(PROGRAM_FILE) == @__FILE__
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    print_search_pr_outputs(io, get(ARGS, 1, "origin/main...HEAD"))
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end
