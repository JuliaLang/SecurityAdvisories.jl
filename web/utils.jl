using SecurityAdvisories: SecurityAdvisories, CVSS
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

_is_upstream(adv) = !isempty(adv.upstream)

_advisory_file_path(adv) =
    "advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md"

# Severity display selection

# We choose to display the highest-version CVSS score (and if more than one, the highest score)
function _display_severity(adv)
    isempty(adv.severity) && return nothing
    rank(sev) = (something(CVSS.version(sev.score), -1), something(CVSS.score(sev.score), -1.0))
    sev = argmax(rank, adv.severity)
    (sev, CVSS.version(sev.score), CVSS.score(sev.score))
end

function _severity_label(score::Float64, version::Int)
    # CVSS v2 defines no qualitative scale; use NVD's convention with only Low/Medium/High
    version != 2 && score >= 9.0 && return ("Critical", "critical")
    score >= 7.0 && return ("High", "high")
    score >= 4.0 && return ("Medium", "medium")
    (version == 2 || score >= 0.1) && return ("Low", "low")
    ("None", "info")
end

_severity_badge(adv) = _severity_badge(_display_severity(adv))
function _severity_badge(disp::Union{Nothing,Tuple})
    disp === nothing && return ""
    sev, version, score = disp
    score === nothing &&
        return """<span class="severity-badge severity-info" title="$(_escape(sev.score))">$(sev.type)</span>"""
    label, cls = _severity_label(score, version)
    """<span class="severity-badge severity-$cls" title="$(_escape(sev.score))">$label $(round(score; digits=1))</span>"""
end

_severity_class(adv) = _severity_class(_display_severity(adv))
_severity_class(disp::Union{Nothing,Tuple}) =
    disp === nothing || disp[3] === nothing ? "" : last(_severity_label(disp[3], disp[2]))

function _idlinks_html(ids)
    io = IOBuffer()
    seen = Set{String}()
    for id in ids
        id in seen && continue
        push!(seen, id)
        url = if startswith(id, "CVE-")
            "https://nvd.nist.gov/vuln/detail/$id"
        elseif startswith(id, "GHSA-")
            "https://github.com/advisories/$id"
        elseif startswith(id, "EUVD-")
            "https://euvd.enisa.europa.eu/vulnerability/$id"
        else
            nothing
        end
        if url !== nothing
            write(io, """<a href="$(_escape(url))">$(_escape(id))</a> """)
        else
            write(io, "$(_escape(id)) ")
        end
    end
    String(take!(io))
end

# Shared advisory-row renderer
# Used by recent_advisories, all_advisories, and package_advisories to
# keep list-item markup consistent.

function _write_advisory_row(io::IOBuffer, adv;
        extra_attrs::String="", summary_len::Int=90, show_source::Bool=false,
        badge::String=_severity_badge(adv))
    summary = something(adv.summary, "No summary available")
    withdrawn_badge = adv.withdrawn !== nothing ? """<span class="withdrawn-badge">Withdrawn</span>""" : ""
    source_badge = (show_source && _is_upstream(adv)) ? """<span class="source-badge">Upstream</span>""" : ""
    write(io, """<a href="$(_advisory_url(adv))" class="advisory-item"$extra_attrs>""")
    write(io, """<span class="advisory-id">$(adv.id)</span>""")
    write(io, """<span class="advisory-badge">$badge$withdrawn_badge$source_badge</span>""")
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
        _write_advisory_row(io, adv; show_source=true)
    end
    write(io, "</div>")
    String(take!(io))
end

function hfun_all_advisories()
    advs = load_all_advisories()
    io = IOBuffer()

    write(io, """<p class="adv-src-desc">All published security advisories for packages in the Julia ecosystem &mdash; both authored directly for Julia packages and imported for upstream components (like artifacts) incorporated into them.</p>""")

    write(io, """<div class="filter-bar" id="adv-filter-bar">""")
    write(io, """<div class="filter-row"><input type="text" id="adv-filter-text" placeholder="Filter by ID, summary, or package…" oninput="filterAdvisories()"><span class="filter-count" id="adv-filter-count"></span></div>""")
    write(io, """<div class="filter-row" role="group" aria-label="Fix status"><span class="filter-label">Fix</span><div class="sev-btns">""")
    write(io, """<button class="sev-btn active" data-key="fixed" title="Advisories with a fixed release available">Available</button>""")
    write(io, """<button class="sev-btn active" data-key="unfixed" title="Advisories with no fixed release">Not available</button>""")
    write(io, "</div></div>")
    write(io, """<div class="filter-row" role="group" aria-label="Advisory type"><span class="filter-label">Type</span><div class="sev-btns">""")
    write(io, """<button class="sev-btn active" data-key="direct" title="Advisories authored directly for packages in the Julia ecosystem">Direct</button>""")
    write(io, """<button class="sev-btn active" data-key="upstream" title="Advisories for upstream components (like artifacts) incorporated into a Julia package (like a JLL)">Upstream</button>""")
    write(io, "</div></div>")
    write(io, """<div class="filter-row" role="group" aria-label="Severity"><span class="filter-label">Severity</span><div class="sev-btns">""")
    for sev in ("critical", "high", "medium", "low")
        write(io, """<button class="sev-btn sev-btn-$sev active" data-key="$sev" title="$(uppercasefirst(sev))-severity advisories">$(uppercasefirst(sev))</button>""")
    end
    write(io, """<button class="sev-btn active" data-key="unknown" title="Advisories without a CVSS score">Unknown</button>""")
    write(io, "</div></div>")
    write(io, "</div>")

    write(io, """<div class="advisory-list" id="advisory-list">""")
    for adv in advs
        disp = _display_severity(adv)
        src = _is_upstream(adv) ? "upstream" : "direct"
        pkgs_str = join(SecurityAdvisories.vulnerable_packages(adv), " ")
        summary = something(adv.summary, "No summary available")
        attrs = """ data-severity="$(_severity_key(adv))" data-fixed="$(Int(_adv_fixed(adv)))" data-source="$src" data-pkgs="$(_escape(pkgs_str))" data-summary="$(_escape(lowercase(summary)))" """
        _write_advisory_row(io, adv; extra_attrs=attrs, show_source=true, badge=_severity_badge(disp))
    end
    write(io, "</div>")

    write(io, """
<script>
// Every filter button is an independent toggle and all start enabled:
// deselect a property to hide advisories having it.  The deselected set
// syncs to a ?hide= query parameter for deep-linking, e.g.
// /advisories/?hide=fixed,upstream,low
(function(){
  var params = new URLSearchParams(location.search);
  var hidden = (params.get('hide') || '').split(',');
  document.querySelectorAll('#adv-filter-bar .sev-btn').forEach(function(btn){
    if(hidden.indexOf(btn.getAttribute('data-key')) >= 0) btn.classList.remove('active');
    btn.addEventListener('click', function(){
      btn.classList.toggle('active');
      filterAdvisories();
    });
  });
})();
function filterAdvisories(){
  var text = document.getElementById('adv-filter-text').value.toLowerCase();
  var sel = {}, hidden = [];
  document.querySelectorAll('#adv-filter-bar .sev-btn').forEach(function(btn){
    var key = btn.getAttribute('data-key');
    sel[key] = btn.classList.contains('active');
    if(!sel[key]) hidden.push(key);
  });
  var url = new URL(location);
  if(hidden.length) url.searchParams.set('hide', hidden.join(',')); else url.searchParams.delete('hide');
  history.replaceState(null, '', url);
  var items = document.querySelectorAll('#advisory-list .advisory-item');
  var shown = 0;
  items.forEach(function(el){
    var id = el.querySelector('.advisory-id').textContent.toLowerCase();
    var summary = el.getAttribute('data-summary') || '';
    var pkgs = (el.getAttribute('data-pkgs') || '').toLowerCase();
    var s = el.getAttribute('data-severity') || 'unknown';
    var f = el.getAttribute('data-fixed') === '1' ? 'fixed' : 'unfixed';
    var src = el.getAttribute('data-source') || 'direct';
    var matchText = !text || id.includes(text) || summary.includes(text) || pkgs.includes(text);
    if(matchText && sel[s] && sel[f] && sel[src]){ el.style.display=''; shown++; }
    else { el.style.display='none'; }
  });
  document.getElementById('adv-filter-count').textContent = shown + ' of ' + items.length;
}
filterAdvisories();
</script>""")
    String(take!(io))
end

# A vulnerability is "fixed" only when every range has an exclusive upper
# bound (the OSV `fixed` event); an inclusive `last_affected` bound or an
# unbounded range means no fixed release is known.
_has_fix(v::SecurityAdvisories.PackageVulnerability) =
    all(r -> SecurityAdvisories.has_upper_bound(r) && !r.ubinclusive, v.ranges)

# Filter-toggle keys shared by the advisories/packages pages: an advisory's
# fix status (fixed only when every vulnerable package range has one) and
# its severity class ("unknown" when there's no CVSS score).
_adv_fixed(a) = all(_has_fix(v) for v in a.affected if SecurityAdvisories.is_vulnerable(v))
_severity_key(a) = (cls = _severity_class(a); isempty(cls) ? "unknown" : cls)

# The subset of `pkgs` marked deprecated in the General registry, signalled
# by a `[metadata.deprecated]` table in the package's Package.toml.  Pkg's
# parsed PkgInfo doesn't surface this table until Julia 1.14, so read the
# raw file through the registry's (possibly in-memory) file access.
function _deprecated_packages(pkgs)
    reg = SecurityAdvisories.get_registry()
    deprecated = Set{String}()
    for pkg in pkgs
        uuids = SecurityAdvisories.uuids_from_name(pkg, reg)
        isempty(uuids) && continue
        entry = reg[first(uuids)]
        d = SecurityAdvisories.Registry.parsefile(
            entry.in_memory_registry, entry.registry_path, joinpath(entry.path, "Package.toml"))
        meta = get(d, "metadata", nothing)
        meta isa AbstractDict && haskey(meta, "deprecated") && push!(deprecated, pkg)
    end
    return deprecated
end

function hfun_package_index()
    advs = load_all_advisories()
    pkg_counts = Dict{String,Int}()
    # pkg => severity class => [fix-available, no-fix] advisory counts;
    # advisories without a CVSS score land in the "unknown" class
    pkg_sevs = Dict{String,Dict{String,Vector{Int}}}()
    for a in advs
        cls = _severity_key(a)
        for v in a.affected
            SecurityAdvisories.is_vulnerable(v) || continue
            pkg_counts[v.pkg] = get(pkg_counts, v.pkg, 0) + 1
            counts = get!(get!(pkg_sevs, v.pkg, Dict{String,Vector{Int}}()), cls, [0, 0])
            counts[_has_fix(v) ? 1 : 2] += 1
        end
    end
    sorted = sort(collect(pkg_counts); by=x -> lowercase(first(x)))
    deprecated = _deprecated_packages(keys(pkg_counts))

    io = IOBuffer()
    write(io, """<div class="filter-bar" id="pkg-filter-bar">""")
    write(io, """<div class="filter-row"><input type="text" id="pkg-filter" placeholder="Filter packages…" oninput="filterPackages()"><span class="filter-count" id="pkg-filter-count"></span></div>""")
    write(io, """<div class="filter-row" role="group" aria-label="Fix status"><span class="filter-label">Fix</span><div class="sev-btns">""")
    write(io, """<button class="sev-btn active" data-key="fixed" title="Advisories with a fixed release available">Available</button>""")
    write(io, """<button class="sev-btn active" data-key="unfixed" title="Advisories with no fixed release">Not available</button>""")
    write(io, "</div></div>")
    write(io, """<div class="filter-row" role="group" aria-label="Severity"><span class="filter-label">Severity</span><div class="sev-btns">""")
    for sev in ("critical", "high", "medium", "low")
        write(io, """<button class="sev-btn sev-btn-$sev active" data-key="$sev" title="$(uppercasefirst(sev))-severity advisories">$(uppercasefirst(sev))</button>""")
    end
    write(io, """<button class="sev-btn active" data-key="unknown" title="Advisories without a CVSS score">Unknown</button>""")
    write(io, "</div></div>")
    write(io, """<div class="filter-row" role="group" aria-label="Registry status"><span class="filter-label">Registry</span><div class="sev-btns">""")
    write(io, """<button class="sev-btn active" data-key="nondeprecated" title="Packages not marked deprecated in the General registry">Active</button>""")
    write(io, """<button class="sev-btn active" data-key="deprecated" title="Packages marked deprecated in the General registry">Deprecated</button>""")
    write(io, "</div></div>")
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
        sevs = pkg_sevs[pkg]
        sevs_json = "{" * join(("\"$k\":[$(v[1]),$(v[2])]" for (k, v) in sevs), ",") * "}"
        write(io, """<a href="/packages/$(_escape(pkg))/" class="pkg-list-item" data-pkg="$(_escape(lowercase(pkg)))" data-deprecated="$(Int(pkg in deprecated))" data-sevs='$sevs_json'>""")
        dep_badge = pkg in deprecated ? """ <span class="deprecated-badge">Deprecated</span>""" : ""
        write(io, """<span class="pkg-list-name">$(_escape(pkg))$dep_badge</span>""")
        write(io, """<span class="pkg-list-count">$count</span>""")
        write(io, "</a>")
    end
    current_letter != "" && write(io, "</div>")
    write(io, "</div>")

    write(io, """
<script>
// Every filter button is an independent toggle and all start enabled:
// deselect a property to hide packages whose advisories have it.  The
// deselected set syncs to a ?hide= query parameter for deep-linking,
// e.g. /packages/?hide=fixed,low,deprecated
(function(){
  var params = new URLSearchParams(location.search);
  var hidden = (params.get('hide') || '').split(',');
  document.querySelectorAll('#pkg-filter-bar .sev-btn').forEach(function(btn){
    if(hidden.indexOf(btn.getAttribute('data-key')) >= 0) btn.classList.remove('active');
    btn.addEventListener('click', function(){
      btn.classList.toggle('active');
      filterPackages();
    });
  });
})();
function filterPackages(){
  var text = document.getElementById('pkg-filter').value.toLowerCase();
  var sel = {}, hidden = [];
  document.querySelectorAll('#pkg-filter-bar .sev-btn').forEach(function(btn){
    var key = btn.getAttribute('data-key');
    sel[key] = btn.classList.contains('active');
    if(!sel[key]) hidden.push(key);
  });
  var url = new URL(location);
  if(hidden.length) url.searchParams.set('hide', hidden.join(',')); else url.searchParams.delete('hide');
  history.replaceState(null, '', url);
  var items = document.querySelectorAll('.pkg-list-item');
  var shown = 0;
  items.forEach(function(el){
    var name = el.getAttribute('data-pkg') || '';
    var deprecated = el.getAttribute('data-deprecated') === '1';
    var sevs = {};
    try { sevs = JSON.parse(el.getAttribute('data-sevs') || '{}'); } catch(e) {}
    // The count badge tallies the advisories still selected: each severity
    // class holds [fix-available, no-fix] counts, and a package with no
    // selected advisories is hidden.
    var badge = 0;
    ['critical','high','medium','low','unknown'].forEach(function(s){
      if(!sel[s]) return;
      var c = sevs[s] || [0, 0];
      if(sel.fixed) badge += c[0];
      if(sel.unfixed) badge += c[1];
    });
    var matchText = !text || name.includes(text);
    var matchDep = deprecated ? sel.deprecated : sel.nondeprecated;
    el.querySelector('.pkg-list-count').textContent = badge;
    if(matchText && matchDep && badge > 0){ el.style.display=''; shown++; }
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
    disp = _display_severity(adv)
    badge = _severity_badge(disp)

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

    if disp !== nothing
        write(io, """<div class="meta-row"><dt>Severity</dt><dd><code>$(_escape(disp[1].score))</code></dd></div>""")
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

    aliases_str = _idlinks_html(adv.aliases)
    if !isempty(strip(aliases_str))
        write(io, """<div class="meta-row"><dt>Aliases</dt><dd>$aliases_str</dd></div>""")
    end

    upstream_str = _idlinks_html(adv.upstream)
    if !isempty(strip(upstream_str))
        write(io, """<div class="meta-row"><dt>Upstream</dt><dd>$upstream_str</dd></div>""")
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

    # Independent fix-status, source, and severity toggles (all enabled by
    # default; deselect a property to hide advisories having it).  Each
    # group is offered only when both/multiple of its values are actually
    # present.  The deselected set syncs to a `?hide=` query parameter.
    _pkg_fixed(a) = all(_has_fix(v) for v in a.affected
                        if v.pkg == pkg && SecurityAdvisories.is_vulnerable(v))
    present = [c for c in ("critical", "high", "medium", "low", "unknown")
               if any(a -> _severity_key(a) == c, filtered)]
    show_fix = length(unique(_pkg_fixed.(filtered))) > 1
    show_src = length(unique(_is_upstream.(filtered))) > 1
    show_sev = length(present) > 1
    if show_fix || show_src || show_sev
        write(io, """<div class="filter-bar" id="pkg-adv-filter-bar">""")
        write(io, """<div class="filter-row"><span class="filter-count" id="pkg-adv-filter-count"></span></div>""")
        if show_fix
            write(io, """<div class="filter-row" role="group" aria-label="Fix status"><span class="filter-label">Fix</span><div class="sev-btns">""")
            write(io, """<button class="sev-btn active" data-key="fixed" title="Advisories with a fixed release available">Available</button>""")
            write(io, """<button class="sev-btn active" data-key="unfixed" title="Advisories with no fixed release">Not available</button>""")
            write(io, "</div></div>")
        end
        if show_src
            write(io, """<div class="filter-row" role="group" aria-label="Advisory type"><span class="filter-label">Type</span><div class="sev-btns">""")
            write(io, """<button class="sev-btn active" data-key="direct" title="Advisories authored directly for packages in the Julia ecosystem">Direct</button>""")
            write(io, """<button class="sev-btn active" data-key="upstream" title="Advisories for upstream components (like artifacts) incorporated into a Julia package (like a JLL)">Upstream</button>""")
            write(io, "</div></div>")
        end
        if show_sev
            write(io, """<div class="filter-row" role="group" aria-label="Severity"><span class="filter-label">Severity</span><div class="sev-btns">""")
            for sev in present
                label = sev == "unknown" ? "Unknown" : uppercasefirst(sev)
                color = sev == "unknown" ? "" : " sev-btn-$sev"
                write(io, """<button class="sev-btn$color active" data-key="$sev">$label</button>""")
            end
            write(io, "</div></div>")
        end
        write(io, "</div>")
    end

    write(io, """<div class="advisory-list" id="pkg-advisory-list">""")
    for adv in filtered
        disp = _display_severity(adv)
        src = _is_upstream(adv) ? "upstream" : "direct"
        attrs = """ data-severity="$(_severity_key(adv))" data-fixed="$(Int(_pkg_fixed(adv)))" data-source="$src" """
        _write_advisory_row(io, adv; extra_attrs=attrs, show_source=true, badge=_severity_badge(disp))
    end
    write(io, "</div>")
    isempty(filtered) && write(io, "<p>No advisories found for $(_escape(pkg)).</p>")

    if show_fix || show_src || show_sev
        write(io, """
<script>
(function(){
  var params = new URLSearchParams(location.search);
  var hidden = (params.get('hide') || '').split(',');
  document.querySelectorAll('#pkg-adv-filter-bar .sev-btn').forEach(function(btn){
    if(hidden.indexOf(btn.getAttribute('data-key')) >= 0) btn.classList.remove('active');
    btn.addEventListener('click', function(){
      btn.classList.toggle('active');
      filterPackageAdvisories();
    });
  });
})();
function filterPackageAdvisories(){
  var sel = {}, hidden = [];
  document.querySelectorAll('#pkg-adv-filter-bar .sev-btn').forEach(function(btn){
    var key = btn.getAttribute('data-key');
    sel[key] = btn.classList.contains('active');
    if(!sel[key]) hidden.push(key);
  });
  var url = new URL(location);
  if(hidden.length) url.searchParams.set('hide', hidden.join(',')); else url.searchParams.delete('hide');
  history.replaceState(null, '', url);
  var items = document.querySelectorAll('#pkg-advisory-list .advisory-item');
  var shown = 0;
  items.forEach(function(el){
    var s = el.getAttribute('data-severity') || 'unknown';
    var f = el.getAttribute('data-fixed') === '1' ? 'fixed' : 'unfixed';
    var src = el.getAttribute('data-source') || 'direct';
    // A property whose toggle group isn't rendered is always selected.
    var ok = (s in sel ? sel[s] : true) && (f in sel ? sel[f] : true) && (src in sel ? sel[src] : true);
    if(ok){ el.style.display=''; shown++; }
    else { el.style.display='none'; }
  });
  document.getElementById('pkg-adv-filter-count').textContent = shown + ' of ' + items.length;
}
filterPackageAdvisories();
</script>""")
    end
    String(take!(io))
end
