using TOML: TOML
using Pkg: Pkg
using Tar: Tar
using CodecZlib: GzipDecompressorStream

function main()
    output_file = abspath(joinpath(@__DIR__, "..", "search_history.toml"))
    isfile(output_file) || touch(output_file)
    toml = TOML.parsefile(output_file)
    registry = Pkg.Registry.reachable_registries()[1]
    for (_, pkg_info) in Iterators.take(registry.pkgs, 10)
        pkg_dict = get!(toml, pkg_info.name, Dict{String,Any}())
        if !haskey(pkg_dict, "artifacts")
            # It's expensive to check for artifacts. Ideally this would also re-check
            # all the false values (to see if any newer versions have artifacts), but
            # for now we only populate missing values. Being smarter requires more state
            pkg_dict["artifacts"] = any_version_has_artifacts(pkg_info)
        end
    end
    open(output_file, "w") do io
        TOML.print(io, toml, sorted=true)
    end
end

function any_version_has_artifacts(pkg_info)
    Pkg.Registry.init_package_info!(pkg_info)
    tmp = mktempdir()
    try
        repo_url = pkg_info.info.repo
        subdir = pkg_info.info.subdir
        run(pipeline(`git clone --bare $repo_url $tmp`, stdout=Base.devnull, stderr=Base.devnull))
        for (_, verinfo) in pkg_info.info.version_info
            cmd = `git -C $tmp ls-tree -r --name-only $(verinfo.git_tree_sha1)`
            if !isnothing(subdir)
                cmd = `$cmd $subdir`
            end
            if success(pipeline(cmd, `grep -qE '(?:^|/)(?:Julia)?Artifacts\.toml$'`))
                return true
            end
        end
    catch ex1
        # use the Pkg server instead
        @info "falling back to Pkg server to check artifacts for package $(pkg_info.name)" ex1
        try
            server = Pkg.Registry.pkg_server_registry_info()[1]
            for (_, verinfo) in pkg_info.info.version_info
                url = "$server/package/$(pkg_info.uuid)/$(verinfo.git_tree_sha1)"
                tarball = joinpath(tmp, string(verinfo.git_tree_sha1, ".tar.gz"))
                download(url, tarball)
                files = Tar.list(GzipDecompressorStream(open(tarball)))
                if any(x->occursin(r"(?:^|/)(?:Julia)?Artifacts\.toml$",x.path), files)
                    return true
                end
            end
        catch ex2
            @warn "Failed to check artifacts for package $(pkg_info.name)" ex1 ex2
        end
    finally
        rm(tmp; force=true, recursive=true)
    end
    return false
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
