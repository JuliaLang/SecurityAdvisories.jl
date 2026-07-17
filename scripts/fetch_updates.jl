# Re-fetch every published advisory from its upstream sources (as recorded in its
# jlsec_sources) and update it in place if the upstream data meaningfully changed.
using SecurityAdvisories: SecurityAdvisories, Advisory

include(joinpath(@__DIR__, "diff_advisories.jl"))  # for print_advisory_diff

isspace_or_comma(c) = isspace(c) || c == ','

function main(input = get(ARGS, 1, ""))
    reset_fields = Symbol.(split(input, isspace_or_comma, keepempty=false))
    unknown = setdiff(reset_fields, fieldnames(Advisory))
    isempty(unknown) || error("unknown reset_fields: ", join(unknown, ", "), "; valid fields are: ", join(fieldnames(Advisory), ", "))

    n = SecurityAdvisories.fetch_updates_for_all_advisories!(; reset_fields)
    @info "updated $n advisories"
    write_pr_outputs(n, reset_fields)
end

function write_pr_outputs(n, reset_fields)
    # Nice logging information for the possible pull request
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    advisory_str = n == 1 ? "advisory" : "advisories"
    println(io, "branch=fetch-updates")
    println(io, "title=[automatic] Update $n $advisory_str from upstream sources")
    println(io, "body<<BODY_EOF")
    print(io, "This action re-fetched the upstream sources for all published advisories and found ",
        n, " ", advisory_str, " with significant changes.")
    if !isempty(reset_fields)
        print(io, " The existing values in field(s) ", join("`" .* string.(reset_fields) .* "`", ", ", " and "),
            " were discarded and reset to their newly-fetched values, and this only saved the updates if those fields changed.")
    end
    println(io, "\n")
    print_advisory_diff(io, "HEAD")
    println(io, "BODY_EOF")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
