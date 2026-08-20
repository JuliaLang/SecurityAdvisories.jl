#!/usr/bin/env julia
# Recompute the search workflow's pull request message from the advisory files that
# changed on this branch, writing the `title=`, `recipe_updates=`, and `body` GitHub
# Actions outputs. See `SecurityAdvisories.print_search_pr_outputs`.
#
# Usage:
#   julia --project=. scripts/update_pr_message.jl <base> [<target>]
#
# The default target is HEAD; pass no target explicitly with an empty string to compare
# against the working tree instead.
using SecurityAdvisories: print_search_pr_outputs

if abspath(PROGRAM_FILE) == @__FILE__
    base = get(ARGS, 1, "origin/main")
    target = get(ARGS, 2, "HEAD")
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    print_search_pr_outputs(io, base, isempty(target) ? nothing : target)
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end
