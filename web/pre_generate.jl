using SecurityAdvisories: SecurityAdvisories
using Dates

const ADVISORIES_DIR = joinpath(@__DIR__, "..", "advisories", "published")

function _escape(s::AbstractString)
    replace(replace(replace(replace(s,
        "&" => "&amp;"), "<" => "&lt;"), ">" => "&gt;"), "\"" => "&quot;")
end

function _source_published(adv)
    for src in adv.jlsec_sources
        src.published !== nothing && return src.published
    end
    nothing
end

_effective_datetime(adv) = something(_source_published(adv), adv.published, DateTime(2000))

function main()
    t0 = time()
    advisories = SecurityAdvisories.Advisory[]
    for (root, _, files) in walkdir(ADVISORIES_DIR)
        for file in files
            endswith(file, ".md") || continue
            try
                push!(advisories, SecurityAdvisories.parsefile(joinpath(root, file)))
            catch e
                @warn "Failed to parse $file" exception = e
            end
        end
    end
    sort!(advisories; by=_effective_datetime, rev=true)
    println("  · Loaded $(length(advisories)) advisories")

    adv_new = 0
    for adv in advisories
        dirpath = joinpath(@__DIR__, "advisories", adv.id)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        isfile(filepath) && continue
        summary = something(adv.summary, adv.id)
        open(filepath, "w") do f
            write(f, """@def title = "$(_escape(summary))"\n""")
            write(f, """@def advisory_id = "$(adv.id)"\n\n""")
            write(f, "{{advisory_detail}}\n")
        end
        adv_new += 1
    end

    pkg_counts = Dict{String, Vector{String}}()
    for adv in advisories
        for pkg in SecurityAdvisories.vulnerable_packages(adv)
            push!(get!(pkg_counts, pkg, String[]), adv.id)
        end
    end

    pkg_new = 0
    for (pkg, _) in pkg_counts
        dirpath = joinpath(@__DIR__, "packages", pkg)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        isfile(filepath) && continue
        open(filepath, "w") do f
            write(f, """@def title = "$pkg Advisories"\n""")
            write(f, """@def package_name = "$pkg"\n\n""")
            write(f, "# $pkg\n\n")
            write(f, "{{package_advisories}}\n")
        end
        pkg_new += 1
    end

    elapsed = round(time() - t0; digits=2)
    println("  ✓ Pre-generated $adv_new advisory pages, $pkg_new package pages in $(elapsed)s")
end

main()
