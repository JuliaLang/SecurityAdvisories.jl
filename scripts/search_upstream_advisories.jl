# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using SecurityAdvisories: SecurityAdvisories, NVD, EUVD, GitHub, VersionRange, package_components
using TOML: TOML
using Dates: Dates

function main()
    input = get(ARGS, 1, "")
    advisories = Advisory[]
    info = Dict{String,Any}()
    info["haystack"] = input
    if startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        push!(advisories, SecurityAdvisories.fetch_advisory(input))
    elseif !isempty(input)
        # Search for advisories matching a particular package name
        append!(advisories, SecurityAdvisories.fetch_package_matches(input))
        append!(advisories, SecurityAdvisories.fetch_package_upstreams(input))
    else
        # TODO: walk through all packages until we find something new
        error("not implemented")
    end
    # Now create or update the found advisories:
    n_modified = 0
    for (id, advisory) in advisories
        existing = SecurityAdvisories.find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = SecurityAdvisories.update(existing, advisory)
        end
        @info "JLSEC for $id: $(advisory.id)"
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(SecurityAdvisories.year(advisory))))
        file = joinpath(dir, advisory.id * ".md")
        n_modified += isfile(file)
        open(file, "w") do io
            SecurityAdvisories.print(io, advisory)
        end
    end
    n_total = length(advisories)
    n_created = n_total - n_modified

    # Nice logging information for the possible pull request
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    verb = n_modified > 0 && n_created == 0 ? "Update" :
           n_modified == 0 && n_created > 0 ? "Publish" : "Publish and update"
    unique_pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(values(advisories))))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)

    divide(f, x) = return (filter(f, x), filter(!f, x))


    function print_advisory_package_version_details(io, id, adv)
        pkgs = SecurityAdvisories.vulnerable_packages(adv)
        cpes = unique(Iterators.flatten(keys(entry.source_mapping) for entry in adv.affected if !isnothing(entry.source_mapping)))
        ambiguous_cpes = filter(>(1)∘length∘SecurityAdvisories.upstream_projects_by_cpe, cpes)

        affectedsrcidx = something(findlast(x->"affected" in x.fields, adv.jlsec_sources), 1)
        html_url = get(adv.jlsec_sources, affectedsrcidx, (;html_url="")).html_url
        println(io, "* [$id]($html_url) for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for entry in adv.affected
            if isempty(entry.ranges)
                print(io, "    * **", entry.pkg, "** has no vulnerable versions")
                if !isempty(keys(entry.source_mapping))
                    print(io, "; some versions contain vulnerable ", join("`".*keys(entry.source_mapping).*"`", ", ", ", and "), ".")
                end
            else
                print(io, "    * **", entry.pkg, "** computed `[", join(repr.(string.(entry.ranges)), ", "), "]`.")
            end
            if haskey(package_components(), entry.pkg)
                pkg_components = package_components()[entry.pkg]
                maxv = argmax(VersionNumber, keys(pkg_components))
                maxv_components = pkg_components[maxv]
                print(io, " Its latest version (", maxv, ") has components: ")
                print(io, "{", join((string(c["project"], "@", c["version"]) for c in maxv_components), ", "), "}")
            end
            println(io)
            for (source, version_map) in entry.source_mapping
                for (v, r) in version_map
                    if isnothing(tryparse(SecurityAdvisories.VersionRange, v))
                        println(io, "        * `", source, "` at `", v, "` failed to parse")
                    elseif r == [VersionRange{VersionNumber}("*")]
                        println(io, "        * `", source, "` at `", v, "` includes all versions")
                    elseif !all(SecurityAdvisories.has_upper_bound, r)
                        println(io, "        * `", source, "` at `", v, "` mapped to `[", join(string.(r), ", "), "]`, includes the latest version`")
                    end
                end
            end
            ambiguous_sources = filter(in(ambiguous_cpes), keys(entry.source_mapping))
            for ambig in ambiguous_sources
                println(io, "        * ⚠ `", ambig, "` might mean a different project; it could be one of ", join("`" .* SecurityAdvisories.upstream_projects_by_cpe(ambig) .* "`", ", ", " or "))
            end
        end
    end

    # Now break the identified advisories into three sections.  First, advisories which failed to parse the upstream version:
    failed_advisories, advisories = divide(((_,v),)->any(isnothing, (tryparse(SecurityAdvisories.VersionRange, r) for entry in v.affected for (_,source_map) in entry.source_mapping for (r, _) in source_map)), advisories)
    !isempty(failed_advisories) && println(io, "### $(length(failed_advisories)) advisories failed to parse the source version range\n\nThese advisories seem to apply to a Julia package but had trouble identifying exactly how and at which versions.")
    for (id, adv) in sort(failed_advisories)
        print_advisory_package_version_details(io, id, adv)
    end
    !isempty(failed_advisories) && println(io)

    # Next advisories for which all versions apply
    star_advisories, advisories = divide(((_,x),)->any(entry->entry.ranges==[VersionRange{VersionNumber}("*")], x.affected), advisories)
    !isempty(star_advisories) && println(io, "### $(length(star_advisories)) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    for (id, adv) in sort(star_advisories)
        print_advisory_package_version_details(io, id, adv)
    end
    !isempty(star_advisories) && println(io)

    # Next advisories for which there's an unbounded upper range
    unbounded_advisories, advisories = divide(((_,x),)->any(entry->any(!SecurityAdvisories.has_upper_bound, entry.ranges), x.affected), advisories)
    !isempty(unbounded_advisories) && println(io, "### $(length(unbounded_advisories)) advisories apply to the latest version of a package and do not have a patch")
    for (id, adv) in sort(unbounded_advisories)
        print_advisory_package_version_details(io, id, adv)
    end
    !isempty(unbounded_advisories) && println(io)

    # And finally all remaining advisories.
    !isempty(advisories) && println(io, "### $(length(advisories)) advisories found concrete vulnerable ranges\n\n")
    for (id, adv) in sort(advisories)
        print_advisory_package_version_details(io, id, adv)
    end
    !isempty(advisories) && println(io)

    println(io, "BODY_EOF")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
