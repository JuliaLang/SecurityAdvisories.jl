using SecurityAdvisories: SecurityAdvisories
using Dates

const ADVISORIES_DIR = joinpath(@__DIR__, "..", "advisories", "published")
const IS_DEV = get(ENV, "FRANKLIN_DEV", "") != ""
const DEV_LIMIT = parse(Int, get(ENV, "FRANKLIN_DEV_LIMIT", "10"))

function _log(msg; level=:info)
    ts = Dates.format(now(), "HH:MM:SS")
    prefix = level == :warn ? "⚠" : level == :done ? "✓" : "·"
    println("  $prefix [$ts] $msg")
end

let _cache = Ref{Union{Nothing, Vector{SecurityAdvisories.Advisory}}}(nothing)
    global function load_all_advisories(; force=false)
        if !force && _cache[] !== nothing
            return _cache[]
        end
        t0 = time()
        advisories = SecurityAdvisories.Advisory[]
        isdir(ADVISORIES_DIR) || return advisories
        parsed = 0
        failed = 0
        for (root, _, files) in walkdir(ADVISORIES_DIR)
            for file in files
                endswith(file, ".md") || continue
                try
                    adv = SecurityAdvisories.parsefile(joinpath(root, file))
                    push!(advisories, adv)
                    parsed += 1
                catch e
                    failed += 1
                    @warn "Failed to parse $file" exception=e
                end
            end
        end
        sort!(advisories, by=a -> something(a.published, DateTime(2000)), rev=true)
        elapsed = round(time() - t0, digits=2)
        _log("Loaded $parsed advisories in $(elapsed)s$(failed > 0 ? " ($failed failed)" : "")")
        _cache[] = advisories
        return advisories
    end

    global function invalidate_advisory_cache!()
        _cache[] = nothing
    end
end

function _escape(s::AbstractString)
    s = replace(s, "&" => "&amp;")
    s = replace(s, "<" => "&lt;")
    s = replace(s, ">" => "&gt;")
    s = replace(s, "\"" => "&quot;")
    return s
end

function _truncate(s::AbstractString, n::Int=120)
    length(s) <= n && return s
    return s[1:prevind(s, n)] * "…"
end

function _format_date(dt::DateTime)
    Dates.format(dt, "u d, yyyy")
end
_format_date(::Nothing) = "—"

function _advisory_url(adv)
    "/advisories/$(adv.id)/"
end

function _affected_pkgs_html(adv)
    io = IOBuffer()
    for v in adv.affected
        SecurityAdvisories.is_vulnerable(v) || continue
        write(io, """<span class="pkg-tag">$(v.pkg)</span>""")
    end
    return String(take!(io))
end

function _aliases_html(adv)
    io = IOBuffer()
    for a in adv.aliases
        url = if startswith(a, "CVE-")
            "https://nvd.nist.gov/vuln/detail/$a"
        elseif startswith(a, "GHSA-")
            "https://github.com/advisories/$a"
        else
            nothing
        end
        if url !== nothing
            write(io, """<a href="$(_escape(url))">$(_escape(a))</a> """)
        else
            write(io, """$(_escape(a)) """)
        end
    end
    for a in adv.upstream
        url = if startswith(a, "CVE-")
            "https://nvd.nist.gov/vuln/detail/$a"
        elseif startswith(a, "GHSA-")
            "https://github.com/advisories/$a"
        else
            nothing
        end
        if url !== nothing
            write(io, """<a href="$(_escape(url))">$(_escape(a))</a> """)
        else
            write(io, """$(_escape(a)) """)
        end
    end
    return String(take!(io))
end

function hfun_stats()
    advs = load_all_advisories()
    pkgs = Set{String}()
    for a in advs, v in a.affected
        SecurityAdvisories.is_vulnerable(v) && push!(pkgs, v.pkg)
    end
    io = IOBuffer()
    write(io, """<div class="stats-row">""")
    write(io, """<div class="stat-card"><div class="stat-value">$(length(advs))</div><div class="stat-label">Advisories</div></div>""")
    write(io, """<div class="stat-card"><div class="stat-value">$(length(pkgs))</div><div class="stat-label">Packages</div></div>""")
    recent = count(a -> a.published !== nothing && a.published > DateTime(Dates.now() - Dates.Day(30)), advs)
    write(io, """<div class="stat-card"><div class="stat-value">$recent</div><div class="stat-label">Last 30 days</div></div>""")
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_recent_advisories()
    advs = load_all_advisories()
    n = min(10, length(advs))
    io = IOBuffer()
    write(io, """<div class="advisory-list">""")
    for adv in advs[1:n]
        summary = something(adv.summary, "No summary available")
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_format_date(adv.published))</span>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_all_advisories()
    advs = load_all_advisories()
    io = IOBuffer()
    write(io, """<div class="advisory-list">""")
    for adv in advs
        summary = something(adv.summary, "No summary available")
        pkgs = _affected_pkgs_html(adv)
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_format_date(adv.published))</span>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_package_index()
    advs = load_all_advisories()
    pkg_counts = Dict{String,Int}()
    for a in advs, v in a.affected
        SecurityAdvisories.is_vulnerable(v) || continue
        pkg_counts[v.pkg] = get(pkg_counts, v.pkg, 0) + 1
    end
    sorted = sort(collect(pkg_counts), by=x->(-x[2], x[1]))
    io = IOBuffer()
    write(io, """<div class="pkg-grid">""")
    for (pkg, count) in sorted
        write(io, """<a href="/packages/$(_escape(pkg))/" class="pkg-card">""")
        write(io, """<div class="pkg-card-name">$(_escape(pkg))</div>""")
        write(io, """<div class="pkg-card-count">$count $(count == 1 ? "advisory" : "advisories")</div>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_advisory_detail()
    id = locvar(:advisory_id)
    id === nothing && return "<p>Advisory not found.</p>"
    advs = load_all_advisories()
    idx = findfirst(a -> a.id == id, advs)
    idx === nothing && return "<p>Advisory $(_escape(id)) not found.</p>"
    adv = advs[idx]

    io = IOBuffer()

    summary = something(adv.summary, adv.id)
    write(io, """<div class="advisory-detail-header">""")
    write(io, """<span class="advisory-id-large">$(adv.id)</span>""")
    write(io, """<h1>$(_escape(summary))</h1>""")
    write(io, """<div class="detail-actions">""")
    write(io, """<a href="https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md">Source</a>""")
    write(io, """<a href="https://github.com/JuliaLang/SecurityAdvisories.jl/edit/main/advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md">Edit</a>""")
    write(io, """</div>""")
    write(io, """</div>""")

    write(io, """<div class="meta-grid">""")

    write(io, """<div class="meta-card"><div class="meta-label">Published</div><div class="meta-value">$(_format_date(adv.published))</div></div>""")
    write(io, """<div class="meta-card"><div class="meta-label">Modified</div><div class="meta-value">$(_format_date(adv.modified))</div></div>""")

    if !isempty(adv.affected)
        write(io, """<div class="meta-card"><div class="meta-label">Affected Packages</div><div class="meta-value">""")
        for v in adv.affected
            SecurityAdvisories.is_vulnerable(v) || continue
            ranges_str = join([string(r) for r in v.ranges], ", ")
            write(io, """<span class="pkg-tag">$(_escape(v.pkg))</span> <span style="font-size:0.82rem;color:var(--color-text-muted)">$(_escape(ranges_str))</span><br>""")
        end
        write(io, """</div></div>""")
    end

    aliases_str = _aliases_html(adv)
    if !isempty(strip(aliases_str))
        write(io, """<div class="meta-card"><div class="meta-label">Aliases / Upstream</div><div class="meta-value">$aliases_str</div></div>""")
    end

    write(io, """</div>""")

    if adv.details !== nothing
        write(io, """<div class="detail-body">""")
        write(io, Franklin.fd2html(adv.details, internal=true))
        write(io, """</div>""")
    end

    if !isempty(adv.references)
        write(io, """<h3>References</h3><ul>""")
        for ref in adv.references
            write(io, """<li><a href="$(_escape(ref.url))">$(_escape(_truncate(ref.url, 100)))</a></li>""")
        end
        write(io, """</ul>""")
    end

    return String(take!(io))
end

function hfun_package_advisories()
    pkg = locvar(:package_name)
    pkg === nothing && return "<p>Package not specified.</p>"
    advs = load_all_advisories()
    filtered = filter(a -> any(v -> v.pkg == pkg && SecurityAdvisories.is_vulnerable(v), a.affected), advs)
    io = IOBuffer()
    write(io, """<div class="advisory-list">""")
    for adv in filtered
        summary = something(adv.summary, "No summary available")
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_format_date(adv.published))</span>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")
    if isempty(filtered)
        write(io, "<p>No advisories found for $(_escape(pkg)).</p>")
    end
    return String(take!(io))
end

function hfun_generate_advisory_pages()
    t0 = time()
    advs = load_all_advisories()

    if IS_DEV
        _log("DEV MODE: limiting to $DEV_LIMIT advisories (set FRANKLIN_DEV_LIMIT to change)"; level=:warn)
        advs = advs[1:min(DEV_LIMIT, length(advs))]
    end

    adv_generated = 0
    adv_skipped = 0
    for adv in advs
        dirpath = joinpath(@__DIR__, "advisories", adv.id)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        if isfile(filepath)
            adv_skipped += 1
            continue
        end
        summary = something(adv.summary, adv.id)
        open(filepath, "w") do f
            write(f, """@def title = "$(_escape(summary))"\n""")
            write(f, """@def advisory_id = "$(adv.id)"\n\n""")
            write(f, """{{advisory_detail}}\n""")
        end
        adv_generated += 1
    end

    advs_pkgs = Dict{String,Vector{String}}()
    for adv in advs, v in adv.affected
        SecurityAdvisories.is_vulnerable(v) || continue
        push!(get!(advs_pkgs, v.pkg, String[]), adv.id)
    end

    pkg_generated = 0
    pkg_skipped = 0
    for (pkg, _) in advs_pkgs
        dirpath = joinpath(@__DIR__, "packages", pkg)
        mkpath(dirpath)
        filepath = joinpath(dirpath, "index.md")
        if isfile(filepath)
            pkg_skipped += 1
            continue
        end
        open(filepath, "w") do f
            write(f, """@def title = "$(pkg) Advisories"\n""")
            write(f, """@def package_name = "$(pkg)"\n\n""")
            write(f, """# $(pkg)\n\n""")
            write(f, """{{package_advisories}}\n""")
        end
        pkg_generated += 1
    end

    elapsed = round(time() - t0, digits=2)
    total_advs = adv_generated + adv_skipped
    total_pkgs = pkg_generated + pkg_skipped
    _log("Pages: $total_advs advisories ($adv_generated new), $total_pkgs packages ($pkg_generated new) [$(elapsed)s]"; level=:done)
    return ""
end
