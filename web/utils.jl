using SecurityAdvisories: SecurityAdvisories
using Dates

const ADVISORIES_DIR = joinpath(@__DIR__, "..", "advisories", "published")
const REPO_BASE = "https://github.com/JuliaLang/SecurityAdvisories.jl"

function _log(msg; level=:info)
    ts = Dates.format(now(), "HH:MM:SS")
    prefix = level == :warn ? "⚠" : level == :done ? "✓" : "·"
    println("  $prefix [$ts] $msg")
end

# Advisory loading & caching

let _cache = Ref{Union{Nothing,Vector{SecurityAdvisories.Advisory}}}(nothing)
    global function load_all_advisories(; force::Bool=false)
        !force && _cache[] !== nothing && return _cache[]
        t0 = time()
        advisories = SecurityAdvisories.Advisory[]
        isdir(ADVISORIES_DIR) || return advisories
        parsed = failed = 0
        for (root, _, files) in walkdir(ADVISORIES_DIR)
            for file in files
                endswith(file, ".md") || continue
                try
                    push!(advisories, SecurityAdvisories.parsefile(joinpath(root, file)))
                    parsed += 1
                catch e
                    failed += 1
                    @warn "Failed to parse $file" exception = e
                end
            end
        end
        sort!(advisories; by=_effective_datetime, rev=true)
        elapsed = round(time() - t0; digits=2)
        _log("Loaded $parsed advisories in $(elapsed)s$(failed > 0 ? " ($failed failed)" : "")")
        _cache[] = advisories
    end

    global invalidate_advisory_cache!() = (_cache[] = nothing)
end

#  Dates
#
# `advisory.published` is the date the JLSEC team created and issued the
# entry — consistent with how RustSec and the Haskell advisory database
# treat "published".  For advisories imported from an upstream source
# (CVE, GHSA, OSV…) the original upstream disclosure timestamp lives in
# `jlsec_sources[].published` and is used only for sorting, not displayed
# in the UI.
#
# We sort by the *effective* publication datetime (upstream source date
# when available, JLSEC published date otherwise) so that
# historically-imported advisories appear in chronological order relative
# to when the vulnerability was originally disclosed.
#
# In the UI every date is rendered as a `<time>` element with
#  - visible text  → human-friendly "Nov 28, 2025"
#  - title tooltip → full ISO-8601 UTC "2025-11-28T19:09:30Z"
# Hovering any date reveals the precise timestamp.

function _source_published(adv::SecurityAdvisories.Advisory)
    for src in adv.jlsec_sources
        src.published !== nothing && return src.published
    end
    nothing
end

_effective_datetime(adv::SecurityAdvisories.Advisory) =
    something(_source_published(adv), adv.published, DateTime(2000))

function _format_datetime(dt::DateTime)
    human = Dates.format(dt, "u d, yyyy")
    iso   = Dates.format(dt, "yyyy-mm-ddTHH:MM:SS") * "Z"
    """<time datetime="$iso" data-tip="$iso">$human</time>"""
end
_format_datetime(::Nothing) = "—"

function _format_datetime_plain(dt::DateTime)
    human = Dates.format(dt, "u d, yyyy")
    iso   = Dates.format(dt, "yyyy-mm-ddTHH:MM:SS") * "Z"
    """<time datetime="$iso" data-tip="$iso">$human</time>"""
end
_format_datetime_plain(::Nothing) = "—"

_display_date(adv) = _format_datetime(something(_source_published(adv), adv.published, nothing))

_display_date_inline(adv) =
    _format_datetime_plain(something(_source_published(adv), adv.published, nothing))

# HTML helpers

function _escape(s::AbstractString)
    replace(replace(replace(replace(s,
        "&" => "&amp;"),
        "<" => "&lt;"),
        ">" => "&gt;"),
        "\"" => "&quot;")
end

function _truncate(s::AbstractString, n::Int=120)
    length(s) <= n && return s
    s[1:prevind(s, n)] * "…"
end

_advisory_url(adv) = "/advisories/$(adv.id)/"

_advisory_file_path(adv) =
    "advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md"

# CVSS v3 base score calculation
# The SecurityAdvisories.jl package stores CVSS vectors as strings but
# does not compute numeric scores.  We implement the CVSS v3.x
# specification here for rendering severity badges in the web UI.

const _AV  = Dict('N' => 0.85, 'A' => 0.62, 'L' => 0.55, 'P' => 0.20)
const _AC  = Dict('L' => 0.77, 'H' => 0.44)
const _PRU = Dict('N' => 0.85, 'L' => 0.62, 'H' => 0.27)
const _PRC = Dict('N' => 0.85, 'L' => 0.68, 'H' => 0.50)
const _UI  = Dict('N' => 0.85, 'R' => 0.62)
const _CIA = Dict('N' => 0.0,  'L' => 0.22, 'H' => 0.56)

function _cvss3_base_score(vector::AbstractString)::Union{Nothing,Float64}
    m = Dict{String,Char}()
    for part in split(vector, '/')
        kv = split(part, ':')
        length(kv) == 2 && (m[kv[1]] = first(kv[2]))
    end
    av = get(_AV, get(m, "AV", ' '), nothing)
    ac = get(_AC, get(m, "AC", ' '), nothing)
    sc = get(m, "S", 'U') == 'C'
    pr = get(sc ? _PRC : _PRU, get(m, "PR", ' '), nothing)
    ui = get(_UI, get(m, "UI", ' '), nothing)
    c  = get(_CIA, get(m, "C", ' '), nothing)
    i  = get(_CIA, get(m, "I", ' '), nothing)
    a  = get(_CIA, get(m, "A", ' '), nothing)
    any(isnothing, (av, ac, pr, ui, c, i, a)) && return nothing
    iss = 1.0 - (1.0 - c) * (1.0 - i) * (1.0 - a)
    impact = sc ? 7.52(iss - 0.029) - 3.25(iss - 0.02)^15 : 6.42iss
    impact <= 0 && return 0.0
    exploit = 8.22 * av * ac * pr * ui
    base = sc ? min(1.08(impact + exploit), 10.0) : min(impact + exploit, 10.0)
    ceil(base * 10) / 10
end

function _severity_label(score::Float64)
    score >= 9.0 && return ("Critical", "critical")
    score >= 7.0 && return ("High", "high")
    score >= 4.0 && return ("Medium", "medium")
    score >= 0.1 && return ("Low", "low")
    ("None", "info")
end

function _severity_badge(adv)
    isempty(adv.severity) && return ""
    sev = first(adv.severity)
    if startswith(sev.type, "CVSS_V3") || startswith(sev.type, "CVSS_V4")
        score = _cvss3_base_score(sev.score)
        if score !== nothing
            label, cls = _severity_label(score)
            return """<span class="severity-badge severity-$cls" title="$(_escape(sev.score))">$label $(round(score; digits=1))</span>"""
        end
    end
    """<span class="severity-badge severity-info" title="$(_escape(sev.score))">$(sev.type)</span>"""
end

function _severity_class(adv)
    isempty(adv.severity) && return ""
    sev = first(adv.severity)
    score = _cvss3_base_score(sev.score)
    score === nothing ? "" : last(_severity_label(score))
end

# Alias / cross-reference rendering

function _aliases_html(adv)
    io = IOBuffer()
    seen = Set{String}()
    for alias in Iterators.flatten((adv.aliases, adv.upstream))
        alias in seen && continue
        push!(seen, alias)
        url = if startswith(alias, "CVE-")
            "https://nvd.nist.gov/vuln/detail/$alias"
        elseif startswith(alias, "GHSA-")
            "https://github.com/advisories/$alias"
        else
            nothing
        end
        if url !== nothing
            write(io, """<a href="$(_escape(url))">$(_escape(alias))</a> """)
        else
            write(io, "$(_escape(alias)) ")
        end
    end
    String(take!(io))
end

# Shared advisory-row renderer
# Used by recent_advisories, all_advisories, and package_advisories to
# keep list-item markup consistent.

function _write_advisory_row(io::IOBuffer, adv;
        extra_attrs::String="", summary_len::Int=90)
    summary = something(adv.summary, "No summary available")
    badge = _severity_badge(adv)
    withdrawn_badge = adv.withdrawn !== nothing ? """<span class="withdrawn-badge">Withdrawn</span>""" : ""
    write(io, """<a href="$(_advisory_url(adv))" class="advisory-item"$extra_attrs>""")
    write(io, """<span class="advisory-id">$(adv.id)</span>""")
    write(io, """<span class="advisory-badge">$badge$withdrawn_badge</span>""")
    write(io, """<span class="advisory-summary">$(_escape(_truncate(summary, summary_len)))</span>""")
    write(io, """<span class="advisory-meta">$(_display_date_inline(adv))</span>""")
    write(io, "</a>")
end

# Franklin hfun_ page functions

function hfun_stats()
    advs = load_all_advisories()
    pkgs = Set{String}()
    for a in advs
        for pkg in SecurityAdvisories.vulnerable_packages(a)
            push!(pkgs, pkg)
        end
    end
    cutoff = DateTime(Dates.now() - Dates.Day(30))
    recent = count(a -> _effective_datetime(a) > cutoff, advs)
    """<p class="pulse-line">Tracking <strong>$(length(advs))</strong> advisories across <strong>$(length(pkgs))</strong> packages &mdash; <strong>$recent</strong> new in the last 30 days.</p>"""
end

function hfun_recent_advisories()
    advs = load_all_advisories()
    n = min(10, length(advs))
    io = IOBuffer()
    write(io, """<div class="advisory-list">""")
    for adv in @view advs[1:n]
        _write_advisory_row(io, adv)
    end
    write(io, "</div>")
    String(take!(io))
end

function hfun_all_advisories()
    advs = load_all_advisories()
    io = IOBuffer()

    write(io, """<div class="filter-bar">""")
    write(io, """<input type="text" id="adv-filter-text" placeholder="Filter by ID, summary, or package…" oninput="filterAdvisories()">""")
    write(io, """<div class="sev-btns" id="adv-sev-btns">""")
    write(io, """<button class="sev-btn active" data-sev="">All</button>""")
    for sev in ("critical", "high", "medium", "low")
        write(io, """<button class="sev-btn sev-btn-$sev" data-sev="$sev">$(uppercasefirst(sev))</button>""")
    end
    write(io, "</div>")
    write(io, """<span class="filter-count" id="adv-filter-count"></span>""")
    write(io, "</div>")

    write(io, """<div class="advisory-list" id="advisory-list">""")
    for adv in advs
        sev_cls = _severity_class(adv)
        pkgs_str = join(SecurityAdvisories.vulnerable_packages(adv), " ")
        summary = something(adv.summary, "No summary available")
        attrs = """ data-severity="$sev_cls" data-pkgs="$(_escape(pkgs_str))" data-summary="$(_escape(lowercase(summary)))" """
        _write_advisory_row(io, adv; extra_attrs=attrs)
    end
    write(io, "</div>")

    write(io, """
<script>
(function(){
  var btns = document.querySelectorAll('#adv-sev-btns .sev-btn');
  btns.forEach(function(btn){
    btn.addEventListener('click', function(){
      btns.forEach(function(b){ b.classList.remove('active'); });
      btn.classList.add('active');
      filterAdvisories();
    });
  });
})();
function filterAdvisories(){
  var text = document.getElementById('adv-filter-text').value.toLowerCase();
  var activeBtn = document.querySelector('#adv-sev-btns .sev-btn.active');
  var sev = activeBtn ? activeBtn.getAttribute('data-sev') : '';
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
    String(take!(io))
end

function hfun_package_index()
    advs = load_all_advisories()
    pkg_counts = Dict{String,Int}()
    for a in advs
        for pkg in SecurityAdvisories.vulnerable_packages(a)
            pkg_counts[pkg] = get(pkg_counts, pkg, 0) + 1
        end
    end
    sorted = sort(collect(pkg_counts); by=x -> lowercase(first(x)))

    io = IOBuffer()
    write(io, """<div class="filter-bar">""")
    write(io, """<input type="text" id="pkg-filter" placeholder="Filter packages…" oninput="filterPackages()">""")
    write(io, """<span class="filter-count" id="pkg-filter-count"></span>""")
    write(io, "</div>")

    letters_available = Set([uppercase(string(first(pkg))) for (pkg, _) in sorted])
    write(io, """<nav class="alpha-toc" id="alpha-toc">""")
    for ch in 'A':'Z'
        l = string(ch)
        if l in letters_available
            write(io, """<a href="#letter-$l">$l</a>""")
        else
            write(io, """<span class="alpha-toc-disabled">$l</span>""")
        end
    end
    write(io, "</nav>")

    write(io, """<div id="pkg-list">""")
    current_letter = ""
    for (pkg, count) in sorted
        letter = uppercase(string(first(pkg)))
        if letter != current_letter
            current_letter != "" && write(io, "</div>")
            current_letter = letter
            write(io, """<div class="pkg-alpha-section" data-letter="$letter">""")
            write(io, """<div class="pkg-alpha-heading" id="letter-$letter">$letter</div>""")
        end
        write(io, """<a href="/packages/$(_escape(pkg))/" class="pkg-list-item" data-pkg="$(_escape(lowercase(pkg)))">""")
        write(io, """<span class="pkg-list-name">$(_escape(pkg))</span>""")
        write(io, """<span class="pkg-list-count">$count</span>""")
        write(io, "</a>")
    end
    current_letter != "" && write(io, "</div>")
    write(io, "</div>")

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
    var any = false;
    sec.querySelectorAll('.pkg-list-item').forEach(function(el){
      if(el.style.display !== 'none') any = true;
    });
    sec.style.display = any ? '' : 'none';
  });
  document.getElementById('pkg-filter-count').textContent = shown + ' of ' + items.length;
}
filterPackages();
</script>""")
    String(take!(io))
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
    write(io, """<a href="https://osv.dev/vulnerability/$(adv.id)" target="_blank" rel="noopener">OSV</a>""")
    write(io, """<a href="https://api.osv.dev/v1/vulns/$(adv.id)" target="_blank" rel="noopener">JSON (OSV)</a>""")
    write(io, "</div></div>")

    if adv.withdrawn !== nothing
        iso = Dates.format(adv.withdrawn, "yyyy-mm-ddTHH:MM:SS") * "Z"
        human = Dates.format(adv.withdrawn, "u d, yyyy")
        write(io, """<div class="withdrawn-notice">⚠ This advisory was withdrawn on <time datetime="$iso" data-tip="$iso">$human</time>. It may have been issued in error or superseded.</div>""")
    end

    write(io, """<dl class="meta-list">""")

    write(io, """<div class="meta-row"><dt>JLSEC Published</dt><dd>$(_format_datetime(adv.published))</dd></div>""")
    write(io, """<div class="meta-row"><dt>Modified</dt><dd>$(_format_datetime(adv.modified))</dd></div>""")

    if adv.withdrawn !== nothing
        write(io, """<div class="meta-row"><dt>Withdrawn</dt><dd>$(_format_datetime(adv.withdrawn))</dd></div>""")
    end

    if !isempty(adv.severity)
        sev = first(adv.severity)
        write(io, """<div class="meta-row"><dt>Severity</dt><dd><code>$(_escape(sev.score))</code></dd></div>""")
    end

    vuln_entries = filter(SecurityAdvisories.is_vulnerable, adv.affected)
    if !isempty(vuln_entries)
        write(io, """<div class="meta-row"><dt>Affected Packages</dt><dd>""")
        for v in vuln_entries
            ranges_str = join(string.(v.ranges), ", ")
            write(io, """<a class="pkg-tag" href="/packages/$(_escape(v.pkg))/">$(_escape(v.pkg))</a> """)
            write(io, """<span style="font-size:0.78rem;color:var(--c-text-muted)">$(_escape(ranges_str))</span><br>""")
        end
        write(io, "</dd></div>")
    end

    aliases_str = _aliases_html(adv)
    if !isempty(strip(aliases_str))
        write(io, """<div class="meta-row"><dt>Aliases / Upstream</dt><dd>$aliases_str</dd></div>""")
    end

    write(io, "</dl>")

    if adv.details !== nothing
        write(io, """<div class="detail-body">""")
        write(io, Franklin.fd2html(adv.details; internal=true))
        write(io, "</div>")
    end

    if !isempty(adv.references)
        write(io, "<h3>References</h3><ul>")
        for ref in adv.references
            write(io, """<li><a href="$(_escape(ref.url))">$(_escape(ref.url))</a></li>""")
        end
        write(io, "</ul>")
    end

    String(take!(io))
end

function hfun_package_advisories()
    pkg = locvar(:package_name)
    pkg === nothing && return "<p>Package not specified.</p>"
    advs = load_all_advisories()
    filtered = filter(advs) do a
        any(v -> v.pkg == pkg && SecurityAdvisories.is_vulnerable(v), a.affected)
    end
    io = IOBuffer()
    write(io, """<div class="advisory-list">""")
    for adv in filtered
        _write_advisory_row(io, adv)
    end
    write(io, "</div>")
    isempty(filtered) && write(io, "<p>No advisories found for $(_escape(pkg)).</p>")
    String(take!(io))
end
