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

# Serialize a string / string-keyed dict to a JS literal for inlining in a
# <script>. `<` is escaped so a value can never terminate the script element.
function _js_string(s::AbstractString)
    io = IOBuffer()
    write(io, '"')
    for c in s
        c == '\\'  ? write(io, "\\\\") :
        c == '"'   ? write(io, "\\\"") :
        c == '\n'  ? write(io, "\\n")  :
        c == '<'   ? write(io, "\\u003c") :
                     write(io, c)
    end
    write(io, '"')
    String(take!(io))
end

_js_object(d::AbstractDict) =
    "{" * join((_js_string(k) * ":" * _js_string(v) for (k, v) in d), ", ") * "}"

_advisory_url(adv) = "/advisories/$(adv.id)/"

_is_upstream(adv) = !isempty(adv.upstream)

# Lead-in copy for the advisories index, keyed by the active source tab
# (`""` = all sources). Rendered server-side for the default and swapped
# client-side by `filterAdvisories` when a tab is selected.
const SRC_DESCRIPTIONS = Dict(
    ""         => "All published security advisories for packages in the Julia ecosystem.",
    "julia"    => "Advisories authored directly for packages in the Julia ecosystem.",
    "upstream" => "Advisories for upstream components (like artifacts) incorporated into a Julia package (like a JLL).",
)

_advisory_file_path(adv) =
    "advisories/published/$(SecurityAdvisories.year(adv))/$(adv.id).md"

# CVSS score calculation
# The SecurityAdvisories.jl package stores CVSS vectors as strings but
# does not compute numeric scores.  We implement the CVSS v2, v3.x, and
# v4.0 scoring specifications here for rendering severity badges in the
# web UI.

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

# CVSS v2 base score (https://www.first.org/cvss/v2/guide, section 3.2.1)

const _V2_AV  = Dict('L' => 0.395, 'A' => 0.646, 'N' => 1.0)
const _V2_AC  = Dict('H' => 0.35,  'M' => 0.61,  'L' => 0.71)
const _V2_AU  = Dict('M' => 0.45,  'S' => 0.56,  'N' => 0.704)
const _V2_CIA = Dict('N' => 0.0,   'P' => 0.275, 'C' => 0.660)

function _cvss2_base_score(vector::AbstractString)::Union{Nothing,Float64}
    m = Dict{String,Char}()
    for part in split(vector, '/')
        kv = split(part, ':')
        length(kv) == 2 && (m[kv[1]] = first(kv[2]))
    end
    av = get(_V2_AV,  get(m, "AV", ' '), nothing)
    ac = get(_V2_AC,  get(m, "AC", ' '), nothing)
    au = get(_V2_AU,  get(m, "Au", ' '), nothing)
    c  = get(_V2_CIA, get(m, "C",  ' '), nothing)
    i  = get(_V2_CIA, get(m, "I",  ' '), nothing)
    a  = get(_V2_CIA, get(m, "A",  ' '), nothing)
    any(isnothing, (av, ac, au, c, i, a)) && return nothing
    impact = 10.41 * (1.0 - (1.0 - c) * (1.0 - i) * (1.0 - a))
    exploitability = 20.0 * av * ac * au
    impact == 0 && return 0.0
    round((0.6impact + 0.4exploitability - 1.5) * 1.176, RoundNearestTiesUp; digits=1)
end

# CVSS v4.0 score, ported from the official FIRST reference implementation
# (https://github.com/FIRSTdotorg/cvss-v4-calculator, BSD-2-Clause,
# Copyright FIRST, Red Hat, and contributors).  Scores are derived from a
# lookup table of "MacroVector" equivalence classes plus an interpolation
# step based on severity distances within each class.

const _V4_LOOKUP = Dict{String,Float64}(
    "000000" => 10, "000001" => 9.9, "000010" => 9.8, "000011" => 9.5, "000020" => 9.5,
    "000021" => 9.2, "000100" => 10, "000101" => 9.6, "000110" => 9.3, "000111" => 8.7,
    "000120" => 9.1, "000121" => 8.1, "000200" => 9.3, "000201" => 9, "000210" => 8.9,
    "000211" => 8, "000220" => 8.1, "000221" => 6.8, "001000" => 9.8, "001001" => 9.5,
    "001010" => 9.5, "001011" => 9.2, "001020" => 9, "001021" => 8.4, "001100" => 9.3,
    "001101" => 9.2, "001110" => 8.9, "001111" => 8.1, "001120" => 8.1, "001121" => 6.5,
    "001200" => 8.8, "001201" => 8, "001210" => 7.8, "001211" => 7, "001220" => 6.9,
    "001221" => 4.8, "002001" => 9.2, "002011" => 8.2, "002021" => 7.2, "002101" => 7.9,
    "002111" => 6.9, "002121" => 5, "002201" => 6.9, "002211" => 5.5, "002221" => 2.7,
    "010000" => 9.9, "010001" => 9.7, "010010" => 9.5, "010011" => 9.2, "010020" => 9.2,
    "010021" => 8.5, "010100" => 9.5, "010101" => 9.1, "010110" => 9, "010111" => 8.3,
    "010120" => 8.4, "010121" => 7.1, "010200" => 9.2, "010201" => 8.1, "010210" => 8.2,
    "010211" => 7.1, "010220" => 7.2, "010221" => 5.3, "011000" => 9.5, "011001" => 9.3,
    "011010" => 9.2, "011011" => 8.5, "011020" => 8.5, "011021" => 7.3, "011100" => 9.2,
    "011101" => 8.2, "011110" => 8, "011111" => 7.2, "011120" => 7, "011121" => 5.9,
    "011200" => 8.4, "011201" => 7, "011210" => 7.1, "011211" => 5.2, "011220" => 5,
    "011221" => 3, "012001" => 8.6, "012011" => 7.5, "012021" => 5.2, "012101" => 7.1,
    "012111" => 5.2, "012121" => 2.9, "012201" => 6.3, "012211" => 2.9, "012221" => 1.7,
    "100000" => 9.8, "100001" => 9.5, "100010" => 9.4, "100011" => 8.7, "100020" => 9.1,
    "100021" => 8.1, "100100" => 9.4, "100101" => 8.9, "100110" => 8.6, "100111" => 7.4,
    "100120" => 7.7, "100121" => 6.4, "100200" => 8.7, "100201" => 7.5, "100210" => 7.4,
    "100211" => 6.3, "100220" => 6.3, "100221" => 4.9, "101000" => 9.4, "101001" => 8.9,
    "101010" => 8.8, "101011" => 7.7, "101020" => 7.6, "101021" => 6.7, "101100" => 8.6,
    "101101" => 7.6, "101110" => 7.4, "101111" => 5.8, "101120" => 5.9, "101121" => 5,
    "101200" => 7.2, "101201" => 5.7, "101210" => 5.7, "101211" => 5.2, "101220" => 5.2,
    "101221" => 2.5, "102001" => 8.3, "102011" => 7, "102021" => 5.4, "102101" => 6.5,
    "102111" => 5.8, "102121" => 2.6, "102201" => 5.3, "102211" => 2.1, "102221" => 1.3,
    "110000" => 9.5, "110001" => 9, "110010" => 8.8, "110011" => 7.6, "110020" => 7.6,
    "110021" => 7, "110100" => 9, "110101" => 7.7, "110110" => 7.5, "110111" => 6.2,
    "110120" => 6.1, "110121" => 5.3, "110200" => 7.7, "110201" => 6.6, "110210" => 6.8,
    "110211" => 5.9, "110220" => 5.2, "110221" => 3, "111000" => 8.9, "111001" => 7.8,
    "111010" => 7.6, "111011" => 6.7, "111020" => 6.2, "111021" => 5.8, "111100" => 7.4,
    "111101" => 5.9, "111110" => 5.7, "111111" => 5.7, "111120" => 4.7, "111121" => 2.3,
    "111200" => 6.1, "111201" => 5.2, "111210" => 5.7, "111211" => 2.9, "111220" => 2.4,
    "111221" => 1.6, "112001" => 7.1, "112011" => 5.9, "112021" => 3, "112101" => 5.8,
    "112111" => 2.6, "112121" => 1.5, "112201" => 2.3, "112211" => 1.3, "112221" => 0.6,
    "200000" => 9.3, "200001" => 8.7, "200010" => 8.6, "200011" => 7.2, "200020" => 7.5,
    "200021" => 5.8, "200100" => 8.6, "200101" => 7.4, "200110" => 7.4, "200111" => 6.1,
    "200120" => 5.6, "200121" => 3.4, "200200" => 7, "200201" => 5.4, "200210" => 5.2,
    "200211" => 4, "200220" => 4, "200221" => 2.2, "201000" => 8.5, "201001" => 7.5,
    "201010" => 7.4, "201011" => 5.5, "201020" => 6.2, "201021" => 5.1, "201100" => 7.2,
    "201101" => 5.7, "201110" => 5.5, "201111" => 4.1, "201120" => 4.6, "201121" => 1.9,
    "201200" => 5.3, "201201" => 3.6, "201210" => 3.4, "201211" => 1.9, "201220" => 1.9,
    "201221" => 0.8, "202001" => 6.4, "202011" => 5.1, "202021" => 2, "202101" => 4.7,
    "202111" => 2.1, "202121" => 1.1, "202201" => 2.4, "202211" => 0.9, "202221" => 0.4,
    "210000" => 8.8, "210001" => 7.5, "210010" => 7.3, "210011" => 5.3, "210020" => 6,
    "210021" => 5, "210100" => 7.3, "210101" => 5.5, "210110" => 5.9, "210111" => 4,
    "210120" => 4.1, "210121" => 2, "210200" => 5.4, "210201" => 4.3, "210210" => 4.5,
    "210211" => 2.2, "210220" => 2, "210221" => 1.1, "211000" => 7.5, "211001" => 5.5,
    "211010" => 5.8, "211011" => 4.5, "211020" => 4, "211021" => 2.1, "211100" => 6.1,
    "211101" => 5.1, "211110" => 4.8, "211111" => 1.8, "211120" => 2, "211121" => 0.9,
    "211200" => 4.6, "211201" => 1.8, "211210" => 1.7, "211211" => 0.7, "211220" => 0.8,
    "211221" => 0.2, "212001" => 5.3, "212011" => 2.4, "212021" => 1.4, "212101" => 2.4,
    "212111" => 1.2, "212121" => 0.5, "212201" => 1, "212211" => 0.3, "212221" => 0.1,
)

const _V4_LEVELS = Dict(
    "AV" => Dict("N" => 0.0, "A" => 0.1, "L" => 0.2, "P" => 0.3),
    "PR" => Dict("N" => 0.0, "L" => 0.1, "H" => 0.2),
    "UI" => Dict("N" => 0.0, "P" => 0.1, "A" => 0.2),
    "AC" => Dict("L" => 0.0, "H" => 0.1),
    "AT" => Dict("N" => 0.0, "P" => 0.1),
    "VC" => Dict("H" => 0.0, "L" => 0.1, "N" => 0.2),
    "VI" => Dict("H" => 0.0, "L" => 0.1, "N" => 0.2),
    "VA" => Dict("H" => 0.0, "L" => 0.1, "N" => 0.2),
    "SC" => Dict("H" => 0.1, "L" => 0.2, "N" => 0.3),
    "SI" => Dict("S" => 0.0, "H" => 0.1, "L" => 0.2, "N" => 0.3),
    "SA" => Dict("S" => 0.0, "H" => 0.1, "L" => 0.2, "N" => 0.3),
    "CR" => Dict("H" => 0.0, "M" => 0.1, "L" => 0.2),
    "IR" => Dict("H" => 0.0, "M" => 0.1, "L" => 0.2),
    "AR" => Dict("H" => 0.0, "M" => 0.1, "L" => 0.2),
)

# Highest-severity sub-vectors per MacroVector equivalence class.  EQ3 and
# EQ6 are interdependent and keyed jointly as "$eq3$eq6".
const _V4_MAX_COMPOSED = Dict(
    "eq1" => Dict(
        0 => ["AV:N/PR:N/UI:N/"],
        1 => ["AV:A/PR:N/UI:N/", "AV:N/PR:L/UI:N/", "AV:N/PR:N/UI:P/"],
        2 => ["AV:P/PR:N/UI:N/", "AV:A/PR:L/UI:P/"]),
    "eq2" => Dict(
        0 => ["AC:L/AT:N/"],
        1 => ["AC:H/AT:N/", "AC:L/AT:P/"]),
    "eq4" => Dict(
        0 => ["SC:H/SI:S/SA:S/"],
        1 => ["SC:H/SI:H/SA:H/"],
        2 => ["SC:L/SI:L/SA:L/"]),
    "eq5" => Dict(
        0 => ["E:A/"],
        1 => ["E:P/"],
        2 => ["E:U/"]),
)
const _V4_MAX_COMPOSED_EQ3EQ6 = Dict(
    "00" => ["VC:H/VI:H/VA:H/CR:H/IR:H/AR:H/"],
    "01" => ["VC:H/VI:H/VA:L/CR:M/IR:M/AR:H/", "VC:H/VI:H/VA:H/CR:M/IR:M/AR:M/"],
    "10" => ["VC:L/VI:H/VA:H/CR:H/IR:H/AR:H/", "VC:H/VI:L/VA:H/CR:H/IR:H/AR:H/"],
    "11" => ["VC:L/VI:H/VA:L/CR:H/IR:M/AR:H/", "VC:L/VI:H/VA:H/CR:H/IR:M/AR:M/",
             "VC:H/VI:L/VA:H/CR:M/IR:H/AR:M/", "VC:H/VI:L/VA:L/CR:M/IR:H/AR:H/",
             "VC:L/VI:L/VA:H/CR:H/IR:H/AR:M/"],
    "21" => ["VC:L/VI:L/VA:L/CR:H/IR:H/AR:H/"],
)

# Max severity distances (in 0.1 steps) within each equivalence class.
const _V4_MAX_SEVERITY = Dict(
    "eq1" => Dict(0 => 1, 1 => 4, 2 => 5),
    "eq2" => Dict(0 => 1, 1 => 2),
    "eq4" => Dict(0 => 6, 1 => 5, 2 => 4),
)
const _V4_MAX_SEVERITY_EQ3EQ6 =
    Dict("00" => 7, "01" => 6, "10" => 8, "11" => 8, "21" => 10)

_v4_parse_pairs(s::AbstractString) =
    Dict(String(kv[1]) => String(kv[2])
         for kv in (split(part, ':') for part in split(s, '/'; keepempty=false))
         if length(kv) == 2)

# Effective metric value: environmental M* metrics override their base
# counterparts, and undefined E/CR/IR/AR default to their worst case.
function _v4_metric(m::Dict{String,String}, metric::String)
    v = get(m, metric, "X")
    if v == "X"
        metric == "E" && return "A"
        metric in ("CR", "IR", "AR") && return "H"
    end
    mv = get(m, "M" * metric, "X")
    mv != "X" && return mv
    return v
end

function _v4_macrovector(m::Dict{String,String})
    g(x) = _v4_metric(m, x)
    eq1 = g("AV") == "N" && g("PR") == "N" && g("UI") == "N" ? 0 :
          (g("AV") == "N" || g("PR") == "N" || g("UI") == "N") && g("AV") != "P" ? 1 : 2
    eq2 = g("AC") == "L" && g("AT") == "N" ? 0 : 1
    eq3 = g("VC") == "H" && g("VI") == "H" ? 0 :
          g("VC") == "H" || g("VI") == "H" || g("VA") == "H" ? 1 : 2
    eq4 = g("MSI") == "S" || g("MSA") == "S" ? 0 :
          g("SC") == "H" || g("SI") == "H" || g("SA") == "H" ? 1 : 2
    eq5 = g("E") == "A" ? 0 : g("E") == "P" ? 1 : 2
    eq6 = (g("CR") == "H" && g("VC") == "H") || (g("IR") == "H" && g("VI") == "H") ||
          (g("AR") == "H" && g("VA") == "H") ? 0 : 1
    (eq1, eq2, eq3, eq4, eq5, eq6)
end

const _V4_DISTANCE_METRICS =
    ("AV", "PR", "UI", "AC", "AT", "VC", "VI", "VA", "SC", "SI", "SA", "CR", "IR", "AR")

function _cvss4_score(vector::AbstractString)::Union{Nothing,Float64}
    startswith(vector, "CVSS:4.0/") || return nothing
    m = _v4_parse_pairs(vector)
    g(x) = _v4_metric(m, x)
    all(haskey(m, k) for k in ("AV", "AC", "AT", "PR", "UI", "VC", "VI", "VA", "SC", "SI", "SA")) ||
        return nothing
    all(haskey(_V4_LEVELS[k], g(k)) for k in _V4_DISTANCE_METRICS) || return nothing

    # No impact at all is scored 0.0 outright.
    all(g(x) == "N" for x in ("VC", "VI", "VA", "SC", "SI", "SA")) && return 0.0

    eq1, eq2, eq3, eq4, eq5, eq6 = _v4_macrovector(m)
    eq3eq6 = "$eq3$eq6"
    value = get(_V4_LOOKUP, "$eq1$eq2$eq3$eq4$eq5$eq6", nothing)
    value === nothing && return nothing

    # Scores of the next-lower MacroVector along each equivalence class
    # (NaN when none exists).
    lower(s) = get(_V4_LOOKUP, s, NaN)
    lower_eq1 = lower("$(eq1 + 1)$eq2$eq3$eq4$eq5$eq6")
    lower_eq2 = lower("$eq1$(eq2 + 1)$eq3$eq4$eq5$eq6")
    lower_eq4 = lower("$eq1$eq2$eq3$(eq4 + 1)$eq5$eq6")
    lower_eq5 = lower("$eq1$eq2$eq3$eq4$(eq5 + 1)$eq6")
    lower_eq3eq6 = if eq3 == 0 && eq6 == 0
        # Two possible lower paths; take the higher score.
        l = lower("$eq1$eq2$eq3$eq4$eq5$(eq6 + 1)")
        r = lower("$eq1$eq2$(eq3 + 1)$eq4$eq5$eq6")
        isnan(l) ? r : isnan(r) ? l : max(l, r)
    elseif eq3 == 1 && eq6 == 0
        lower("$eq1$eq2$eq3$eq4$eq5$(eq6 + 1)")
    elseif eq3 == 2
        NaN
    else # (eq3, eq6) in ((0, 1), (1, 1))
        lower("$eq1$eq2$(eq3 + 1)$eq4$eq5$eq6")
    end

    # Severity distance of the vector from the highest-severity vector in
    # its MacroVector: the first max candidate with no negative distances.
    dist = Dict{String,Float64}()
    for a in _V4_MAX_COMPOSED["eq1"][eq1], b in _V4_MAX_COMPOSED["eq2"][eq2],
        c in _V4_MAX_COMPOSED_EQ3EQ6[eq3eq6], d in _V4_MAX_COMPOSED["eq4"][eq4],
        e in _V4_MAX_COMPOSED["eq5"][eq5]

        mvd = _v4_parse_pairs(a * b * c * d * e)
        trial = Dict(metric => _V4_LEVELS[metric][g(metric)] - _V4_LEVELS[metric][mvd[metric]]
                     for metric in _V4_DISTANCE_METRICS)
        if all(>=(0), values(trial))
            dist = trial
            break
        end
    end
    isempty(dist) && return nothing

    # Interpolate towards the next-lower MacroVector proportionally to the
    # severity distance within each equivalence class.
    step = 0.1
    normalized = 0.0
    n_lower = 0
    for (avail, d, maxsev) in (
        (value - lower_eq1, dist["AV"] + dist["PR"] + dist["UI"], _V4_MAX_SEVERITY["eq1"][eq1]),
        (value - lower_eq2, dist["AC"] + dist["AT"], _V4_MAX_SEVERITY["eq2"][eq2]),
        (value - lower_eq3eq6,
         dist["VC"] + dist["VI"] + dist["VA"] + dist["CR"] + dist["IR"] + dist["AR"],
         _V4_MAX_SEVERITY_EQ3EQ6[eq3eq6]),
        (value - lower_eq4, dist["SC"] + dist["SI"] + dist["SA"], _V4_MAX_SEVERITY["eq4"][eq4]),
        (value - lower_eq5, 0.0, 1),
    )
        isnan(avail) && continue
        n_lower += 1
        normalized += avail * (d / (maxsev * step))
    end
    n_lower > 0 && (value -= normalized / n_lower)
    round(clamp(value, 0.0, 10.0), RoundNearestTiesUp; digits=1)
end

# Severity display selection

const _CVSS_VERSION = Dict("CVSS_V2" => 2, "CVSS_V3" => 3, "CVSS_V4" => 4)

_cvss_score(sev) =
    sev.type == "CVSS_V4" ? _cvss4_score(sev.score) :
    sev.type == "CVSS_V3" ? _cvss3_base_score(sev.score) :
    sev.type == "CVSS_V2" ? _cvss2_base_score(sev.score) : nothing

# When an advisory carries multiple CVSS entries, display the one from the
# most recent CVSS version; among entries of that version, the highest score.
function _display_severity(adv)
    best = nothing
    for sev in adv.severity
        version = get(_CVSS_VERSION, sev.type, nothing)
        version === nothing && continue
        score = _cvss_score(sev)
        score === nothing && continue
        if best === nothing || (version, score) > (best[1], best[2])
            best = (version, score, sev)
        end
    end
    best
end

function _severity_label(score::Float64, version::Int=3)
    if version == 2
        # CVSS v2 defines no qualitative scale; use NVD's Low/Medium/High.
        score >= 7.0 && return ("High", "high")
        score >= 4.0 && return ("Medium", "medium")
        return ("Low", "low")
    end
    score >= 9.0 && return ("Critical", "critical")
    score >= 7.0 && return ("High", "high")
    score >= 4.0 && return ("Medium", "medium")
    score >= 0.1 && return ("Low", "low")
    ("None", "info")
end

function _severity_badge(adv)
    isempty(adv.severity) && return ""
    best = _display_severity(adv)
    if best === nothing
        sev = first(adv.severity)
        return """<span class="severity-badge severity-info" title="$(_escape(sev.score))">$(sev.type)</span>"""
    end
    version, score, sev = best
    label, cls = _severity_label(score, version)
    """<span class="severity-badge severity-$cls" title="$(_escape(sev.score))">$label $(round(score; digits=1))</span>"""
end

function _severity_class(adv)
    best = _display_severity(adv)
    best === nothing ? "" : last(_severity_label(best[2], best[1]))
end

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
        extra_attrs::String="", summary_len::Int=90, show_source::Bool=false)
    summary = something(adv.summary, "No summary available")
    badge = _severity_badge(adv)
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

    write(io, """<div class="src-tabs" id="adv-src-tabs">""")
    write(io, """<button class="src-tab active" data-src="">All</button>""")
    write(io, """<button class="src-tab" data-src="julia">Julia only</button>""")
    write(io, """<button class="src-tab" data-src="upstream">Upstream only</button>""")
    write(io, "</div>")

    write(io, """<p class="adv-src-desc" id="adv-src-desc">$(SRC_DESCRIPTIONS[""])</p>""")

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
        src = _is_upstream(adv) ? "upstream" : "julia"
        pkgs_str = join(SecurityAdvisories.vulnerable_packages(adv), " ")
        summary = something(adv.summary, "No summary available")
        attrs = """ data-severity="$sev_cls" data-source="$src" data-pkgs="$(_escape(pkgs_str))" data-summary="$(_escape(lowercase(summary)))" """
        _write_advisory_row(io, adv; extra_attrs=attrs, show_source=true)
    end
    write(io, "</div>")

    write(io, """
<script>
var SRC_DESCRIPTIONS = $(_js_object(SRC_DESCRIPTIONS));
(function(){
  function wire(sel, cb){
    var btns = document.querySelectorAll(sel);
    btns.forEach(function(btn){
      btn.addEventListener('click', function(){
        btns.forEach(function(b){ b.classList.remove('active'); });
        btn.classList.add('active');
        cb();
      });
    });
  }
  wire('#adv-sev-btns .sev-btn', filterAdvisories);
  wire('#adv-src-tabs .src-tab', filterAdvisories);
})();
function filterAdvisories(){
  var text = document.getElementById('adv-filter-text').value.toLowerCase();
  var activeSev = document.querySelector('#adv-sev-btns .sev-btn.active');
  var sev = activeSev ? activeSev.getAttribute('data-sev') : '';
  var activeSrc = document.querySelector('#adv-src-tabs .src-tab.active');
  var src = activeSrc ? activeSrc.getAttribute('data-src') : '';
  var desc = document.getElementById('adv-src-desc');
  if(desc) desc.textContent = SRC_DESCRIPTIONS[src] || SRC_DESCRIPTIONS[''];
  var items = document.querySelectorAll('#advisory-list .advisory-item');
  var shown = 0;
  items.forEach(function(el){
    var id = el.querySelector('.advisory-id').textContent.toLowerCase();
    var summary = el.getAttribute('data-summary') || '';
    var pkgs = (el.getAttribute('data-pkgs') || '').toLowerCase();
    var elSev = el.getAttribute('data-severity') || '';
    var elSrc = el.getAttribute('data-source') || '';
    var matchText = !text || id.includes(text) || summary.includes(text) || pkgs.includes(text);
    var matchSev = !sev || elSev === sev;
    var matchSrc = !src || elSrc === src;
    if(matchText && matchSev && matchSrc){ el.style.display=''; shown++; }
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
        best = _display_severity(adv)
        sev = best === nothing ? first(adv.severity) : best[3]
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
    write(io, """<div class="advisory-list">""")
    for adv in filtered
        _write_advisory_row(io, adv; show_source=true)
    end
    write(io, "</div>")
    isempty(filtered) && write(io, "<p>No advisories found for $(_escape(pkg)).</p>")
    String(take!(io))
end
