# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using SecurityAdvisories: SecurityAdvisories, Advisory, NVD, EUVD, GitHub, VersionRange, package_components
using GeneralMetadata
using TOML: TOML
using Dates: Dates
using Random: shuffle

function main()
    input = get(ARGS, 1, "")
    advisories = Advisory[]
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = 0
    if startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        push!(advisories, SecurityAdvisories.fetch_advisory(input))
        info["haystack_total"] = 1
    elseif !isempty(input)
        # Search for advisories matching a particular package name, both directly and through upstream matches.
        # The direct package matches are more likely to be relevant, even if we're missing affected entries.
        aliases = SecurityAdvisories.fetch_package_matches(input)
        # But upstream matches are only relevant if they actually apply to the package:
        upstreams = SecurityAdvisories.fetch_package_upstreams(input)
        info["haystack_total"] = length(aliases) + length(upstreams)
        append!(advisories, aliases) # We don't filter aliases (for now, at least) because they're expected to always be relevant
        append!(advisories, filter(SecurityAdvisories.is_vulnerable, upstreams))
    else
        pkgs = shuffle(SecurityAdvisories.all_pkgs())
        while isempty(advisories)
            (input, _) = pop!(pkgs)
            aliases = SecurityAdvisories.fetch_package_matches(input)
            upstreams = SecurityAdvisories.fetch_package_upstreams(input)
            info["haystack_total"] += length(aliases) + length(upstreams)
            append!(advisories, aliases) # We don't filter aliases (for now, at least) because they're expected to always be relevant
            append!(advisories, filter(SecurityAdvisories.is_vulnerable, upstreams))
        end
    end
    # Now create or update the found advisories:
    n_modified = 0
    for advisory in advisories
        existing = SecurityAdvisories.find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = SecurityAdvisories.update(existing, advisory)
        end
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
    unique_pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(advisories)))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "branch=", input)
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)

    divide(f, x) = return (filter(f, x), filter(!f, x))

    aliases, upstreams = divide(x->!isempty(x.aliases), advisories)

    if !isempty(aliases)
        println(io, "## $(length(aliases)) advisories directly affect Julia package(s)\n")
        for adv in sort(aliases, by=x->minimum(y->something(y.published, y.modified), x.jlsec_sources))
            print(io, "* ")
            for src in adv.jlsec_sources
                print(io, "[", src.id, "](", src.html_url, ") ")
            end
            print(io, "for packages: \n")
            for pkg in SecurityAdvisories.vulnerable_packages(adv)
                versions = Iterators.flatten(x.ranges for x in filter(a->a.pkg==pkg, adv.affected))
                print(io, "    * **", pkg, "** at versions: ", join("`" .* string.(versions) .* "`", ", ", ", and "), "\n")
            end
            println(io)
        end
        println(io)
    end

    if !isempty(upstreams)
        meta = GeneralMetadata.metadata()
        println(io, "## $(length(upstreams)) advisories affect Julia package(s) because they contain vulnerable upstream projects\n")
        for adv in sort(upstreams, by=x->minimum(y->something(y.published, y.modified), x.jlsec_sources))
            print(io, "* ")
            for src in adv.jlsec_sources
                print(io, "[", src.id, "](", src.html_url, ") ")
            end
            print(io, "for upstream project(s): \n")
            projects = unique(Iterators.flatten(keys(something(a.source_mapping, Dict())) for a in adv.affected))
            for cpe in projects
                possible_projects = SecurityAdvisories.upstream_projects_by_cpe(cpe)
                versions = unique(Iterators.flatten(keys(get(something(a.source_mapping, Dict()), cpe, Dict())) for a in adv.affected))
                affecteds = filter(x->haskey(something(x.source_mapping, Dict()), cpe) && SecurityAdvisories.is_vulnerable(x), adv.affected)
                isempty(affecteds) && continue
                print(io, "    * **", cpe, "** at versions: ", join("`" .* versions .* "`", ", ", ", and "), ", mapping to:\n")
                pkgs = unique(x.pkg for x in affecteds)
                for pkg in pkgs
                    print(io, "        * **", pkg, "** at versions: ")
                    pkg_versions = unique(Iterators.flatten(x.ranges for x in affecteds if x.pkg == pkg))
                    print(io, "`", join(pkg_versions, ", "), "` because\n")
                    pkginfo = meta[pkg]
                    available_versions = sort([VersionNumber(k) for k in keys(pkginfo)])
                    interesting_versions = Set{VersionNumber}()
                    for range in pkg_versions
                        if SecurityAdvisories.has_lower_bound(range)
                            idx = findfirst(>=(range.lb), available_versions)
                            push!(interesting_versions, available_versions[idx])
                            push!(interesting_versions, available_versions[range.lbinclusive ? idx + 1 : idx - 1])
                        end
                        if SecurityAdvisories.has_upper_bound(range)
                            idx = findfirst(>=(range.ub), available_versions)
                            push!(interesting_versions, available_versions[idx])
                            push!(interesting_versions, available_versions[range.ubinclusive ? idx + 1 : idx - 1])
                        else
                            push!(interesting_versions, available_versions[end])
                        end
                    end
                    for v in sort(collect(interesting_versions))
                        proj_info = [info for info in (get(src, "upstream", Dict()) for src in
                            Iterators.flatten(get(am, "sources", []) for am in get(pkginfo[string(v)], "artifact_metadata", []))) if get(info, "project", "")  in possible_projects]
                        proj_versions = get.(proj_info, "version", "*")
                        vstr = v == available_versions[end] ? string(v, " (latest)") : string(v)
                        if length(proj_versions) == 0
                            println(io, "            * ", vstr, " does not contain the project")
                        elseif length(proj_versions) == 1 && proj_versions[1] == "*"
                            println(io, "            * ", vstr, " contains ", proj_info[1]["project"], " at an **unknown version**")
                        elseif length(proj_versions) == 1
                            println(io, "            * ", vstr, " contains ", proj_info[1]["project"], " at version: `", proj_versions[1], "`")
                        else
                            proj_names = unique(getindex.(proj_info, "project"))
                            proj_name = length(proj_names) == 1 ? proj_names[1] : string(proj_names) # TODO: this is rare, but could be better
                            println(io, "            * ", vstr, " contains ", proj_name, " at versions: `", proj_versions, "`")
                        end
                    end
                end
            end
            println(io)
        end
        println(io)
    end
    println(io, "BODY_EOF")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
