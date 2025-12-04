using TOML: TOML
using Pkg: Pkg
using Tar: Tar
using CodecZlib: GzipDecompressorStream

function main()
    output_file = abspath(joinpath(@__DIR__, "..", "search_history.toml"))
    isfile(output_file) || touch(output_file)
    toml = TOML.parsefile(output_file)
    registry = Pkg.Registry.reachable_registries()[1]
    for (_, pkg_info) in registry.pkgs
        pkg_dict = get!(toml, pkg_info.name, Dict{String,Any}())
        if !get(pkg_dict, "artifacts", false)
            # This is overzealous. It'd be much better to only check new versions since the last run,
            # that that requires yet more state, or perhaps (better) getting direct pushes from changes to General.
            pkg_dict["artifacts"] = any_version_has_artifacts(pkg_info)
        end
    end
    open(output_file, "w") do io
        TOML.print(io, toml, sorted=true)
    end
end

function any_version_has_artifacts(pkg_info)
    Pkg.Registry.init_package_info!(pkg_info)
    try
        mktempdir() do tmp
            repo_url = pkg_info.info.repo
            subdir = pkg_info.info.subdir
            run(Pipeline(`git clone --bare $repo_url $tmp`, stdout=Base.devnull, stderr=Base.devnull))
            for (_, verinfo) in pkg_info.info.version_info
                cmd = `git -C $tmp ls-tree -r --name-only $(verinfo.git_tree_sha1)`
                if !isnothing(subdir)
                    cmd = `$cmd $subdir`
                end
                if success(pipeline(cmd, `grep -qE '(?:^|/)(?:Julia)?Artifacts\.toml$'`))
                    return true
                end
            end
        end
    catch ex1
        # use the Pkg server instead
        @info "falling back to Pkg server to check artifacts for package $(pkg_info.name)" ex1
        try
            server = Pkg.Registry.pkg_server_registry_info()[1]
            for (_, verinfo) in pkg_info.info.version_info
                url = "$server/package/$(pkg_info.uuid)/$(verinfo.git_tree_sha1)"
                mktempdir() do d
                    tarball = joinpath(d, "pkg.tar.gz")
                    download(url, tarball)
                    files = Tar.list(GzipDecompressorStream(open(tarball)))
                    if any(x->occursin(r"(?:^|/)(?:Julia)?Artifacts\.toml$",x.path), files)
                        return true
                    end
                end
            end
        catch ex2
            @warn "Failed to check artifacts for package $(pkg_info.name)" ex1 ex2
        end
    end
    return false
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
