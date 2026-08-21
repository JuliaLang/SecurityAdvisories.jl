#!/usr/bin/env julia
# CLI for `SecurityAdvisories.print_advisory_diff`: summarize which Advisory fields changed
# across the advisory files in a commit or range, as GitHub-flavored markdown.
#
# Usage:
#   julia --project=. scripts/diff_advisories.jl [<commit>]  # defaults to HEAD, diffs against <commit>^
#   julia --project=. scripts/diff_advisories.jl <spec>      # any `git diff`-style revision spec
#   julia --project=. scripts/diff_advisories.jl .           # working tree vs HEAD
#
# As with `git diff`, a spec like "A..B" (or merge-base "A...B") compares two revisions
# and a lone revision compares against the working tree — except that a lone commit is
# taken as shorthand for "<commit>^..<commit>"; use `.` for the working tree.

using SecurityAdvisories: print_advisory_diff

function parse_spec(args)
    isempty(args) && return "HEAD^..HEAD"
    length(args) > 1 && error("expected a single git diff-style spec (like \"A..B\"), got $(length(args)) arguments")
    spec = only(args)
    spec == "." && return "HEAD"
    contains(spec, "..") && return spec
    return "$spec^..$spec"
end

if abspath(PROGRAM_FILE) == @__FILE__
    print_advisory_diff(stdout, parse_spec(ARGS))
end
