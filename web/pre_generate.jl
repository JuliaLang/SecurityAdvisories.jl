using SecurityAdvisories: SecurityAdvisories
using Dates

const ADVISORIES_DIR = joinpath(@__DIR__, "..", "advisories", "published")

function _sanitize(s::AbstractString)
    s = replace(s, "\\" => "\\\\")
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

    limit = parse(Int, get(ENV, "FRANKLIN_DEV_LIMIT", "0"))
    if limit > 0
        advisories = advisories[1:min(limit, length(advisories))]
        println("  · DEV: limiting to $limit advisories")
    end

    clean = "--clean" in ARGS
    if clean
        for d in (joinpath(@__DIR__, "advisories"), joinpath(@__DIR__, "packages"))
            for entry in readdir(d; join=true)
                basename(entry) == "index.md" && continue
                isdir(entry) && rm(entry; recursive=true)
            end
        end
        println("  · Cleaned generated pages")
    end

    adv_written = 0
    adv_skipped = 0
    for adv in advisories
        dirpath = joinpath(@__DIR__, "advisories", adv.id)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        if isfile(filepath) && !clean
            adv_skipped += 1
            continue
        end
        summary = _sanitize(something(adv.summary, adv.id))
        pub_dt = _effective_datetime(adv)
        rss_y, rss_m, rss_d = Dates.year(pub_dt), Dates.month(pub_dt), Dates.day(pub_dt)
        open(filepath, "w") do f
            write(f, """@def title = "$summary"\n""")
            write(f, """@def advisory_id = "$(adv.id)"\n""")
            write(f, """@def rss_title = "$(adv.id): $summary"\n""")
            write(f, """@def rss_pubdate = Date($rss_y, $rss_m, $rss_d)\n""")
            write(f, """@def rss_description = "Security advisory $(adv.id): $summary"\n\n""")
            write(f, "{{advisory_detail}}\n")
        end
        adv_written += 1
    end

    pkg_counts = Dict{String, Vector{String}}()
    for adv in advisories
        for pkg in SecurityAdvisories.vulnerable_packages(adv)
            push!(get!(pkg_counts, pkg, String[]), adv.id)
        end
    end

    pkg_written = 0
    pkg_skipped = 0
    for (pkg, _) in pkg_counts
        dirpath = joinpath(@__DIR__, "packages", pkg)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        if isfile(filepath) && !clean
            pkg_skipped += 1
            continue
        end
        open(filepath, "w") do f
            write(f, """@def title = "$pkg Advisories"\n""")
            write(f, """@def package_name = "$pkg"\n\n""")
            write(f, "# $pkg\n\n")
            write(f, "{{package_advisories}}\n")
        end
        pkg_written += 1
    end

    elapsed = round(time() - t0; digits=2)
    total_adv = adv_written + adv_skipped
    total_pkg = pkg_written + pkg_skipped
    parts = String[]
    adv_written > 0 && push!(parts, "wrote $adv_written advisory pages")
    adv_skipped > 0 && push!(parts, "$adv_skipped already existed")
    pkg_written > 0 && push!(parts, "wrote $pkg_written package pages")
    pkg_skipped > 0 && push!(parts, "$pkg_skipped already existed")
    println("  ✓ $(total_adv) advisory + $(total_pkg) package pages ($(join(parts, ", "))) in $(elapsed)s")
end

main()
