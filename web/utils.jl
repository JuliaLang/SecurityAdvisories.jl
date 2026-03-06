using SecurityAdvisories: SecurityAdvisories
using Dates

const ADVISORIES_DIR = joinpath(@__DIR__, "..", "advisories", "published")
const IS_DEV = get(ENV, "FRANKLIN_DEV", "") != ""
const DEV_LIMIT = parse(Int, get(ENV, "FRANKLIN_DEV_LIMIT", "10"))
const REPO_BASE = "https://github.com/JuliaLang/SecurityAdvisories.jl"

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
        sort!(advisories, by=a -> something(_source_date(a), a.published, DateTime(2000)), rev=true)
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

function _source_date(adv)
    isempty(adv.jlsec_sources) && return nothing
    for src in adv.jlsec_sources
        src.published !== nothing && return src.published
    end
    return nothing
end

function _format_date(dt::DateTime)
    short = Dates.format(dt, "u d, yyyy")
    iso = Dates.format(dt, "yyyy-mm-ddTHH:MM:SS") * "Z"
    return """<time datetime="$iso" title="$iso">$short</time>"""
end
_format_date(::Nothing) = "—"
_format_date_plain(dt::DateTime) = Dates.format(dt, "u d, yyyy")
_format_date_plain(::Nothing) = "—"

function _display_date(adv)
    src_date = _source_date(adv)
    src_date !== nothing && return _format_date(src_date)
    return _format_date(adv.published)
end
_display_date_plain(adv) = _format_date_plain(something(_source_date(adv), adv.published, nothing))

function _advisory_url(adv)
    "/advisories/$(adv.id)/"
end

function _advisory_file_path(adv)
    "advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md"
end

const _CVSS3_AV = Dict('N'=>0.85, 'A'=>0.62, 'L'=>0.55, 'P'=>0.20)
const _CVSS3_AC = Dict('L'=>0.77, 'H'=>0.44)
const _CVSS3_PR_U = Dict('N'=>0.85, 'L'=>0.62, 'H'=>0.27)
const _CVSS3_PR_C = Dict('N'=>0.85, 'L'=>0.68, 'H'=>0.50)
const _CVSS3_UI = Dict('N'=>0.85, 'R'=>0.62)
const _CVSS3_CIA = Dict('N'=>0.0, 'L'=>0.22, 'H'=>0.56)

function _cvss3_base_score(vector::AbstractString)
    metrics = Dict{String,Char}()
    for part in split(vector, '/')
        kv = split(part, ':')
        length(kv) == 2 && (metrics[kv[1]] = first(kv[2]))
    end
    av = get(_CVSS3_AV, get(metrics, "AV", ' '), nothing)
    ac = get(_CVSS3_AC, get(metrics, "AC", ' '), nothing)
    scope_changed = get(metrics, "S", 'U') == 'C'
    pr_map = scope_changed ? _CVSS3_PR_C : _CVSS3_PR_U
    pr = get(pr_map, get(metrics, "PR", ' '), nothing)
    ui = get(_CVSS3_UI, get(metrics, "UI", ' '), nothing)
    c = get(_CVSS3_CIA, get(metrics, "C", ' '), nothing)
    i = get(_CVSS3_CIA, get(metrics, "I", ' '), nothing)
    a = get(_CVSS3_CIA, get(metrics, "A", ' '), nothing)
    any(isnothing, (av, ac, pr, ui, c, i, a)) && return nothing
    iss = 1.0 - (1.0 - c) * (1.0 - i) * (1.0 - a)
    impact = scope_changed ? 7.52 * (iss - 0.029) - 3.25 * (iss - 0.02)^15 : 6.42 * iss
    impact <= 0 && return 0.0
    exploitability = 8.22 * av * ac * pr * ui
    base = scope_changed ? min(1.08 * (impact + exploitability), 10.0) : min(impact + exploitability, 10.0)
    return ceil(base * 10) / 10
end

function _severity_label(score::Float64)
    score >= 9.0 && return ("Critical", "critical")
    score >= 7.0 && return ("High", "high")
    score >= 4.0 && return ("Medium", "medium")
    score >= 0.1 && return ("Low", "low")
    return ("None", "info")
end

function _severity_badge(adv)
    isempty(adv.severity) && return ""
    sev = first(adv.severity)
    if startswith(sev.type, "CVSS_V3") || startswith(sev.type, "CVSS_V4")
        score = _cvss3_base_score(sev.score)
        if score !== nothing
            label, cls = _severity_label(score)
            return """<span class="severity-badge severity-$cls" title="$(sev.score)">$label $(round(score, digits=1))</span>"""
        end
    end
    return """<span class="severity-badge severity-info" title="$(sev.score)">$(sev.type)</span>"""
end

function _aliases_html(adv)
    io = IOBuffer()
    seen = Set{String}()
    for a in Iterators.flatten((adv.aliases, adv.upstream))
        a in seen && continue
        push!(seen, a)
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
    cutoff = DateTime(Dates.now() - Dates.Day(30))
    recent = count(a -> something(_source_date(a), a.published, DateTime(2000)) > cutoff, advs)
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
        badge = _severity_badge(adv)
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-badge">$badge</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_display_date_plain(adv))</span>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")
    return String(take!(io))
end

function hfun_all_advisories()
    advs = load_all_advisories()
    io = IOBuffer()

    write(io, """<div class="filter-bar">""")
    write(io, """<input type="text" id="adv-filter-text" placeholder="Filter by ID, summary, or package…" oninput="filterAdvisories()">""")
    write(io, """<select id="adv-filter-severity" onchange="filterAdvisories()"><option value="">All severities</option><option value="critical">Critical</option><option value="high">High</option><option value="medium">Medium</option><option value="low">Low</option></select>""")
    write(io, """<span class="filter-count" id="adv-filter-count"></span>""")
    write(io, """</div>""")

    write(io, """<div class="advisory-list" id="advisory-list">""")
    for adv in advs
        summary = something(adv.summary, "No summary available")
        badge = _severity_badge(adv)
        sev_class = ""
        if !isempty(adv.severity)
            s = first(adv.severity)
            score = _cvss3_base_score(s.score)
            if score !== nothing
                _, sev_class = _severity_label(score)
            end
        end
        pkgs_str = join([v.pkg for v in adv.affected if SecurityAdvisories.is_vulnerable(v)], " ")
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item" data-severity="$sev_class" data-pkgs="$(_escape(pkgs_str))" data-summary="$(_escape(lowercase(summary)))">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-badge">$badge</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_display_date_plain(adv))</span>""")
        write(io, """</a>""")
    end
    write(io, """</div>""")

    write(io, """
<script>
function filterAdvisories(){
  var text = document.getElementById('adv-filter-text').value.toLowerCase();
  var sev = document.getElementById('adv-filter-severity').value;
  var items = document.querySelectorAll('#advisory-list .advisory-item');
  var shown = 0;
  items.forEach(function(el){
    var id = el.querySelector('.advisory-id').textContent.toLowerCase();
    var summary = el.getAttribute('data-summary') || '';
    var pkgs = (el.getAttribute('data-pkgs') || '').toLowerCase();
    var elSev = el.getAttribute('data-severity') || '';
    var matchText = !text || id.includes(text) || summary.includes(text) || pkgs.includes(text);
    var matchSev = !sev || elSev === sev;
    if(matchText && matchSev){ el.style.display=''; shown++; }
    else { el.style.display='none'; }
  });
  document.getElementById('adv-filter-count').textContent = shown + ' of ' + items.length;
}
filterAdvisories();
</script>""")
    return String(take!(io))
end

function hfun_package_index()
    advs = load_all_advisories()
    pkg_counts = Dict{String,Int}()
    for a in advs, v in a.affected
        SecurityAdvisories.is_vulnerable(v) || continue
        pkg_counts[v.pkg] = get(pkg_counts, v.pkg, 0) + 1
    end
    sorted = sort(collect(pkg_counts), by=x -> lowercase(x[1]))

    io = IOBuffer()
    write(io, """<div class="filter-bar"><input type="text" id="pkg-filter" placeholder="Filter packages…" oninput="filterPackages()"><span class="filter-count" id="pkg-filter-count"></span></div>""")
    write(io, """<div id="pkg-list">""")
    current_letter = ""
    for (pkg, count) in sorted
        letter = uppercase(string(first(pkg)))
        if letter != current_letter
            if current_letter != ""
                write(io, """</div>""")
            end
            current_letter = letter
            write(io, """<div class="pkg-alpha-section" data-letter="$letter">""")
            write(io, """<div class="pkg-alpha-heading">$letter</div>""")
        end
        write(io, """<a href="/packages/$(_escape(pkg))/" class="pkg-list-item" data-pkg="$(_escape(lowercase(pkg)))">""")
        write(io, """<span class="pkg-list-name">$(_escape(pkg))</span>""")
        write(io, """<span class="pkg-list-count">$count</span>""")
        write(io, """</a>""")
    end
    if current_letter != ""
        write(io, """</div>""")
    end
    write(io, """</div>""")

    write(io, """
<script>
function filterPackages(){
  var text = document.getElementById('pkg-filter').value.toLowerCase();
  var items = document.querySelectorAll('.pkg-list-item');
  var shown = 0;
  items.forEach(function(el){
    var name = el.getAttribute('data-pkg') || '';
    if(!text || name.includes(text)){ el.style.display=''; shown++; }
    else { el.style.display='none'; }
  });
  document.querySelectorAll('.pkg-alpha-section').forEach(function(sec){
    var visible = sec.querySelectorAll('.pkg-list-item[style=""],.pkg-list-item:not([style])');
    var any = false;
    sec.querySelectorAll('.pkg-list-item').forEach(function(el){ if(el.style.display!=='none') any=true; });
    sec.style.display = any ? '' : 'none';
  });
  document.getElementById('pkg-filter-count').textContent = shown + ' of ' + items.length;
}
filterPackages();
</script>""")
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

    fpath = _advisory_file_path(adv)
    summary = something(adv.summary, adv.id)
    badge = _severity_badge(adv)

    write(io, """<div class="advisory-detail-header">""")
    write(io, """<span class="advisory-id-large">$(adv.id)</span> $badge""")
    write(io, """<h1>$(_escape(summary))</h1>""")
    write(io, """<div class="detail-actions">""")
    write(io, """<a href="$REPO_BASE/blob/main/$fpath">Source</a>""")
    write(io, """<a href="$REPO_BASE/edit/main/$fpath">Edit</a>""")
    write(io, """<a href="$REPO_BASE/commits/main/$fpath">History</a>""")
    write(io, """<a href="https://api.osv.dev/v1/vulns/$(adv.id)" target="_blank" rel="noopener">JSON (OSV)</a>""")
    write(io, """</div>""")
    write(io, """</div>""")

    write(io, """<div class="meta-grid">""")

    src_date = _source_date(adv)
    if src_date !== nothing
        write(io, """<div class="meta-card"><div class="meta-label">Published (Source)</div><div class="meta-value">$(_format_date(src_date))</div></div>""")
    end
    write(io, """<div class="meta-card"><div class="meta-label">Added to JLSEC</div><div class="meta-value">$(_format_date(adv.published))</div></div>""")
    write(io, """<div class="meta-card"><div class="meta-label">Modified</div><div class="meta-value">$(_format_date(adv.modified))</div></div>""")

    if !isempty(adv.severity)
        sev = first(adv.severity)
        write(io, """<div class="meta-card"><div class="meta-label">Severity</div><div class="meta-value"><code>$(sev.score)</code></div></div>""")
    end

    if !isempty(adv.affected)
        write(io, """<div class="meta-card"><div class="meta-label">Affected Packages</div><div class="meta-value">""")
        for v in adv.affected
            SecurityAdvisories.is_vulnerable(v) || continue
            ranges_str = join([string(r) for r in v.ranges], ", ")
            write(io, """<a class="pkg-tag" href="/packages/$(_escape(v.pkg))/">$(_escape(v.pkg))</a> <span style="font-size:0.78rem;color:var(--c-text-muted)">$(_escape(ranges_str))</span><br>""")
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
        badge = _severity_badge(adv)
        write(io, """<a href="$(_advisory_url(adv))" class="advisory-item">""")
        write(io, """<span class="advisory-id">$(adv.id)</span>""")
        write(io, """<span class="advisory-badge">$badge</span>""")
        write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, 90)))</span>""")
        write(io, """<span class="advisory-meta">$(_display_date_plain(adv))</span>""")
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
