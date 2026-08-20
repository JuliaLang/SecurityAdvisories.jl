#!/usr/bin/env julia
# CLI for `SecurityAdvisories.print_advisory_diff`: summarize which Advisory fields changed
# across the advisory files in a commit or range, as GitHub-flavored markdown.
#
# Usage:
#   julia --project=. scripts/diff_advisories.jl [<commit>]        # defaults to HEAD, diffs against <commit>^
#   julia --project=. scripts/diff_advisories.jl <base> <target>
#   julia --project=. scripts/diff_advisories.jl <base>..<target>
#   julia --project=. scripts/diff_advisories.jl .                 # working tree vs HEAD
#
# A target of `.` means the working tree.

using SecurityAdvisories: print_advisory_diff

# `nothing` as a target means the working tree
function parse_args(args)
    worktree(t) = t == "." ? nothing : String(t)
    if isempty(args)
        return "HEAD^", "HEAD"
    elseif length(args) == 1
        args[1] == "." && return "HEAD", nothing
        if occursin("..", args[1])
            base, target = split(args[1], r"\.\.+", limit=2)
            return String(base), worktree(target)
        end
        return args[1] * "^", args[1]
    elseif length(args) == 2
        return args[1], worktree(args[2])
    end
    error("expected at most two revisions, got $(length(args))")
end

if abspath(PROGRAM_FILE) == @__FILE__
    print_advisory_diff(stdout, parse_args(ARGS)...)
end
