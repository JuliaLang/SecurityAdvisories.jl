# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using SecurityAdvisories: SecurityAdvisories, Advisory, NVD, EUVD, GitHub, VersionRange, package_components, PREFIX
using GeneralMetadata
using TOML: TOML
using Dates: Dates
using DataStructures: DefaultDict, OrderedDict
using SHA: sha256

link_proj(proj) = string("[",rsplit(proj, "/", limit=2)[end], "](https://", proj, ")")
link_pkg(pkg) = string("[", pkg, "](https://juliaregistries.github.io/General/packages/redirect_to_repo/", pkg, ")")
meta_url(pkg) = string("https://github.com/JuliaRegistries/GeneralMetadata.jl/blob/main/metadata/", uppercase(pkg[1]), "/", pkg, ".toml")

function main()
    input = get(ARGS, 1, "")
    advisories = Advisory[]
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = 0
    if startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        push!(advisories, SecurityAdvisories.fetch_advisory(input))
        info["haystack_total"] = 1
        # No filtering is done, no aggregating with aliases is done
    elseif !isempty(input)
        # Search for advisories matching a particular package name, both directly and through upstream matches.
        aliases = SecurityAdvisories.fetch_package_matches(input)
        upstreams = SecurityAdvisories.fetch_package_upstreams(input)
        info["haystack_total"] = length(aliases) + length(upstreams)
        append!(advisories, aliases)
        append!(advisories, upstreams)
        filter!(advisories) do advisory
            input in SecurityAdvisories.vulnerable_packages(advisory)
        end
    else
        # We take a (not totally) random walk through the ecosystem, prioritizing
        # JLLs and registrations in the last three days, avoiding packages for which we have active PRs
        pkgdate = sort([(pkg, maximum(v->get(v, "registered", typemin(Dates.DateTime)), values(info))) for (pkg, info) in GeneralMetadata.metadata()],
            by=x->(endswith(x[1], "jll"), (Dates.now() - x[2] < Dates.Day(3)), rand()), rev=true)
        whole_pkg_list = first.(pkgdate) # shuffle!(collect(keys(GeneralMetadata.metadata())))
        # We remove any pending PRs that jlsec-bot has already opened
        # TODO: it'd be even better to include these and check for changes _against_ these branches because the metadata may have improved
        filter!(!in(Set(GitHub.fetch_branches("jlsec-bot", "SecurityAdvisories.jl"))), whole_pkg_list)
        pkg_search_count = 0
        while isempty(advisories)
            input = popfirst!(whole_pkg_list)
            pkg_search_count += 1
            @info "searching for $input"
            try
                aliases = SecurityAdvisories.fetch_package_matches(input)
                upstreams = SecurityAdvisories.fetch_package_upstreams(input)
                info["haystack"] = "$pkg_search_count random packages"
                info["haystack_total"] += length(aliases) + length(upstreams)
                append!(advisories, aliases)
                append!(advisories, upstreams)
                # We're more aggressive in filtering found advisories when doing the ecosystem walk;
                # This will only suggest advisories that are valid and vulnerable — and if there's already JLSECs for the same issue,
                # will only suggest updates if the new advisory changes something highly impactful
                vuln_with_upper_bound(x) = SecurityAdvisories.has_upper_bound(x) && SecurityAdvisories.is_vulnerable(x)
                filter!(advisories) do advisory
                    existing = SecurityAdvisories.find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
                    (!isnothing(existing) && (
                        # An update to an existing advisory; only suggest it if the new one:
                        !isempty(setdiff(SecurityAdvisories.vulnerable_packages(advisory), SecurityAdvisories.vulnerable_packages(existing))) || # contains new packages
                        count(vuln_with_upper_bound, advisory.affected) > count(vuln_with_upper_bound, existing.affected) || # sets additional upper bounds
                        (!SecurityAdvisories.is_valid(advisory) && SecurityAdvisories.is_valid(existing)) # or is no longer valid
                    )) || (isnothing(existing) && (
                        # A new advisory; suggest it if it's both valid and contains some vulnerable range
                        (SecurityAdvisories.is_valid(advisory) && SecurityAdvisories.is_vulnerable(advisory))
                    ))
                end
                # And also remove advisories that don't affect the searched package
                filter!(advisories) do advisory
                    input in SecurityAdvisories.vulnerable_packages(advisory)
                end
            catch ex
                @error "Error searching for $input" ex
                empty!(advisories)
            end
        end
    end

    # We may have gathered advisories that are aliases of eachother (but hopefully not!)
    n_pre = length(advisories)
    pre_srcs = [[src.id for src in a.jlsec_sources] for a in advisories]
    SecurityAdvisories.combine_aliases!(advisories)
    if length(advisories) < n_pre
        @info "combined $(n_pre - length(advisories)) advisories through alias information!"
        @show pre_srcs
        @show [[src.id for src in a.jlsec_sources] for a in advisories]
    end

    # Now create or update the found advisories:
    n_modified = 0
    results = Advisory[]
    for advisory in advisories
        existing = SecurityAdvisories.find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = SecurityAdvisories.update(existing, advisory)
        elseif !SecurityAdvisories.is_valid(advisory) || !SecurityAdvisories.is_vulnerable(advisory)
            @warn "Advisory $(vcat(advisory.upstream, advisory.aliases)) is not valid or not vulnerable and does not have an existing JLSEC advisory, skipping publication"
            continue
        end
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(SecurityAdvisories.year(advisory))))
        file = joinpath(dir, advisory.id * ".md")
        n_modified += isfile(file)
        open(file, "w") do io
            SecurityAdvisories.print(io, advisory)
        end
        push!(results, advisory)
    end
    n_total = length(advisories)
    n_created = n_total - n_modified

    # Nice logging information for the possible pull request
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    verb = n_modified > 0 && n_created == 0 ? "Update" :
           n_modified == 0 && n_created > 0 ? "Publish" : "Publish and update"
    unique_pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(results)))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "branch=", input)
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)

    divide(f, x) = return (filter(f, x), filter(!f, x))

    unbounded = count(any(!SecurityAdvisories.has_upper_bound, a.affected) for a in results)
    if unbounded > 0
        println(io, "### ⚠ There are $unbounded advisories with unbounded vulnerabilities")
        println(io, "The publication of unbounded advisories is significantly more impactful and, if at all possible, should be addressed in the packages directly")
    end

    aliases, upstreams = divide(x->!isempty(x.aliases), results)

    if !isempty(aliases)
        pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(aliases)))
        println(io, "## $(length(aliases)) advisories directly affect packages ", join(pkgs, ", ", " and "), "\n")
        for adv in sort(aliases, by=x->minimum(y->something(y.published, y.modified), x.jlsec_sources))
            print(io, "* ")
            print(io, "`", adv.id, "` (from:")
            for src in adv.jlsec_sources
                print(io, " [", src.id, "](", src.html_url, ")")
            end
            print(io, ") for packages: \n")
            for pkg in SecurityAdvisories.vulnerable_packages(adv)
                versions = Iterators.flatten(x.ranges for x in filter(a->a.pkg==pkg, adv.affected))
                print(io, "    * **", pkg, "** at versions: ", join("`" .* string.(versions) .* "`", ", ", ", and "), "\n")
            end
            println(io)
        end
        println(io)
    end

    if !isempty(upstreams)
        vulnerable_pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(upstreams)))
        vulnerable_cpes = unique(Iterators.flatten(Iterators.flatten(keys(something(a.source_mapping, Dict())) for a in adv.affected) for adv in upstreams))
        vulnerable_projs = unique(Iterators.flatten(SecurityAdvisories.upstream_projects_by_cpe.(vulnerable_cpes)))
        meta = GeneralMetadata.metadata()
        # Build an ad-hoc data structure to easily look up versions of packages and their projects:
        # TODO: this should live somewhere better...
        pkg_version_upstream = Dict{String, Any}()
        for pkg in vulnerable_pkgs
            pkgmeta = meta[pkg]
            pkg_version_upstream[pkg] = OrderedDict{String, Any}()
            for (v, vmeta) in sort(OrderedDict(pkgmeta), by=VersionNumber)
                if !haskey(vmeta, "artifact_urls")
                    pkg_version_upstream[pkg][v] = DefaultDict(missing)
                elseif isempty(vmeta["artifact_urls"])
                    pkg_version_upstream[pkg][v] = DefaultDict(nothing)
                elseif !haskey(vmeta, "artifact_metadata") || isempty(vmeta["artifact_metadata"])
                    pkg_version_upstream[pkg][v] = DefaultDict(missing)
                else
                    unknowns = if Set(vmeta["artifact_urls"]) == Set(Iterators.flatten(get.(vmeta["artifact_metadata"], "artifact_urls", [[]]))) &&
                        all(x->haskey(x, "sources"), vmeta["artifact_metadata"]) && all(x->haskey(x, "upstream"), Iterators.flatten(get.(vmeta["artifact_metadata"], "sources", [[]])))
                        nothing
                    else
                        missing
                    end
                    upstream_proj_info = filter(!isempty, [get(src, "upstream", Dict()) for src in
                        Iterators.flatten(get(am, "sources", []) for am in get(vmeta, "artifact_metadata", []))])
                    d = DefaultDict(unknowns)
                    for proj_name in unique(v["project"] for v in upstream_proj_info)
                        d[proj_name] = unique(get(pi, "version", "*") for pi in upstream_proj_info if get(pi, "project", "") == proj_name)
                    end
                    pkg_version_upstream[pkg][v] = d
                end
            end
        end
        println(io, "## $(length(upstreams)) advisories affect artifacts provided by ", join(vulnerable_pkgs, ", ", " and "), "\n")
        print(io, "These identifications depend upon accurately tracked artifact metadata in GeneralMetadata.jl. ")
        print(io, "Packages are only listed as affected if they have such tracking, and the vulnerable status ")
        print(io, "(and version numbers themselves) are highly dependent on the accuracy of this metadata. ")
        println(io, "Improvements can be made directly to GeneralMetadata.jl; it is automatically populated on a best-effort basis and manual edits are preserved.")
        println(io)

        println(io, "\n### Package and upstream project information\n")
        for pkg in vulnerable_pkgs
            pkg_projects = unique(Iterators.flatten(keys(v) for v in values(pkg_version_upstream[pkg])))
            println(io, "* ", link_pkg(pkg), "'s [artifact metadata](", meta_url(pkg), ") has upstream", length(pkg_projects) > 1 ? "s: " : ": ", join(link_proj.(pkg_projects), ", ", " and "))
            println(io, "    <details><summary><strong>$pkg</strong> <a href=\"", meta_url(pkg), "\">metadata for each version</a>:</summary>\n\n")

            println(io, "    | ", link_pkg(pkg), " version | ", join(link_proj.(vulnerable_projs) .* " version", " | "), " |")
            println(io, "    |-|", join(fill("-", length(vulnerable_projs)), "|"), "|")
            for (v, ups) in pkg_version_upstream[pkg]
                println(io, "    | $v | ", join((ups[p] for p in vulnerable_projs), " | "), " | ")
            end
            println(io)
            println(io, "    </details>\n")

            last_version, last_version_info = last(pkg_version_upstream[pkg])
            if any(x->ismissing(x) || x=="*", values(last_version_info))
                println(io, "    * **⚠ The latest version (v$last_version) has incomplete or missing metadata**")
            end
            has_early_missings = false
            has_intervening_missings = false
            for proj in pkg_projects
                found_first_known_version = false
                for (v, vinfo) in pkg_version_upstream[pkg]
                    if !haskey(vinfo, proj) || ismissing(vinfo[proj]) || isnothing(vinfo[proj])
                        if !found_first_known_version
                            has_early_missings = true
                        else
                            has_intervening_missings = true
                        end
                    elseif vinfo[proj] == "*"
                        if !found_first_known_version
                            println(io, "    * **⚠ The earliest version (v$v) with ", link_proj(proj), " is missing its version, so this will suggest _every single advisory_ every published**")
                            found_first_known_version = true
                            has_early_missings = true
                        else
                            has_intervening_missings = true
                        end
                    else
                        found_first_known_version = true
                    end
                end
            end
            if has_early_missings
                println(io, "    * The oldest versions with no metadata are not considered when searching for advisories")
            end
            if has_intervening_missings
                println(io, "    * Missing version metadata between two known versions are assumed to have some value between the two known values")
            end
        end

        println(io, "\n### Advisory summaries\n")
        for adv in sort(upstreams, by=x->minimum(y->something(y.published, y.modified), x.jlsec_sources))
            print(io, "* ")
            print(io, "`", adv.id, "` (from:")
            for src in adv.jlsec_sources
                print(io, " [", src.id, "](", src.html_url, ")")
            end
            print(io, ")")
            if any(SecurityAdvisories.is_populated(a.source_mapping) for a in adv.affected)
                print(io, " for upstream project(s): \n")
                projects = unique(Iterators.flatten(keys(something(a.source_mapping, Dict())) for a in adv.affected))
                for cpe in projects
                    versions = unique(Iterators.flatten(keys(get(something(a.source_mapping, Dict()), cpe, Dict())) for a in adv.affected))
                    affecteds = filter(x->haskey(something(x.source_mapping, Dict()), cpe) && SecurityAdvisories.is_vulnerable(x), adv.affected)
                    isempty(affecteds) && continue
                    println(io, "    * **", cpe, "** at versions: ", join("`" .* versions .* "`", ", ", ", and "), ", mapping to ")
                    pkgs = unique(x.pkg for x in affecteds)
                    for pkg in pkgs
                        print(io, "        * **", pkg, "** at versions: ")
                        pkg_versions = unique(Iterators.flatten(x.ranges for x in affecteds if x.pkg == pkg))
                        println(io, join(string.("`", pkg_versions, "`"), ", ", ", and "))
                    end
                end
            else
                print(io, " for package(s): \n")
                for pkg in SecurityAdvisories.vulnerable_packages(adv)
                    versions = Iterators.flatten(x.ranges for x in filter(a->a.pkg==pkg, adv.affected))
                    print(io, "    * **", pkg, "** at versions: ", join("`" .* string.(versions) .* "`", ", ", ", and "), "\n")
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
