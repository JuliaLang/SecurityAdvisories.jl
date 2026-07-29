"""
    CVSS

CVSS scoring for vector strings. Implements the CVSS v2 and v3.x base score
specifications and the CVSS v4.0 scoring system (a port of FIRST's official
reference implementation).

The main entry points are [`CVSS.score`](@ref) and [`CVSS.version`](@ref);
[`v2_score`](@ref), [`v3_score`](@ref), and [`v4_score`](@ref) compute scores
directly from version-specific vector strings.
"""
module CVSS

"""
    score(vector::AbstractString) -> Union{Nothing, Float64}

Compute the numeric CVSS score for a vector string, using the scoring system
that matches its [`version`](@ref). Returns `nothing` if the vector is not a
recognized or complete CVSS v2, v3.x, or v4.0 vector.

For v2 and v3.x this is the base score; for v4.0 it is the full CVSS-BTE score,
which reduces to the base (CVSS-B) score when no threat or environmental
metrics are present.
"""
function score(vector::AbstractString)
    v = version(vector)
    v == 4 ? v4_score(vector) :
    v == 3 ? v3_score(vector) :
    v == 2 ? v2_score(vector) : nothing
end

"""
    version(vector::AbstractString) -> Union{Nothing, Int}

The CVSS version number (2, 3, or 4) of a vector string, or `nothing` if it is
not recognized as a CVSS vector. Version 3 and 4 vectors are identified by
their `CVSS:` prefix; version 2 vectors by their mandatory base metrics.
"""
function version(vector::AbstractString)
    m = match(r"^CVSS:([34])", vector)
    m !== nothing && return parse(Int, only(m.captures))
    startswith(vector, r"AV:[LAN]/AC:[HML]/Au:[MSN]/C:[NPC]/I:[NPC]/A:[NPC]") && return 2
    return nothing
end

_metric(table, m, key) = get(table, get(m, key, ""), nothing)

_metric_pairs(vector::AbstractString) =
    Dict(String(kv[1]) => String(kv[2])
         for kv in (split(part, ':') for part in split(vector, '/'; keepempty=false))
         if length(kv) == 2)

# CVSS v3.x base score (https://www.first.org/cvss/v3.1/specification-document,
# section 7.1)

const V3_AV  = Dict("N" => 0.85, "A" => 0.62, "L" => 0.55, "P" => 0.20)
const V3_AC  = Dict("L" => 0.77, "H" => 0.44)
const V3_PRU = Dict("N" => 0.85, "L" => 0.62, "H" => 0.27)
const V3_PRC = Dict("N" => 0.85, "L" => 0.68, "H" => 0.50)
const V3_UI  = Dict("N" => 0.85, "R" => 0.62)
const V3_CIA = Dict("N" => 0.0,  "L" => 0.22, "H" => 0.56)

"""
    v3_score(vector::AbstractString) -> Union{Nothing, Float64}

Compute the CVSS v3.x base score for a vector string like
`"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H"`. Returns `nothing` if any
base metric is missing or invalid.
"""
function v3_score(vector::AbstractString)::Union{Nothing,Float64}
    m = _metric_pairs(vector)
    av = _metric(V3_AV, m, "AV")
    ac = _metric(V3_AC, m, "AC")
    s  = get(m, "S", "")
    s in ("U", "C") || return nothing
    sc = s == "C"
    pr = _metric(sc ? V3_PRC : V3_PRU, m, "PR")
    ui = _metric(V3_UI, m, "UI")
    c  = _metric(V3_CIA, m, "C")
    i  = _metric(V3_CIA, m, "I")
    a  = _metric(V3_CIA, m, "A")
    any(isnothing, (av, ac, pr, ui, c, i, a)) && return nothing
    iss = 1.0 - (1.0 - c) * (1.0 - i) * (1.0 - a)
    impact = sc ? 7.52(iss - 0.029) - 3.25(iss - 0.02)^15 : 6.42iss
    impact <= 0 && return 0.0
    exploit = 8.22 * av * ac * pr * ui
    base = sc ? min(1.08(impact + exploit), 10.0) : min(impact + exploit, 10.0)
    ceil(base * 10) / 10
end

# CVSS v2 base score (https://www.first.org/cvss/v2/guide, section 3.2.1)

const V2_AV  = Dict("L" => 0.395, "A" => 0.646, "N" => 1.0)
const V2_AC  = Dict("H" => 0.35,  "M" => 0.61,  "L" => 0.71)
const V2_AU  = Dict("M" => 0.45,  "S" => 0.56,  "N" => 0.704)
const V2_CIA = Dict("N" => 0.0,   "P" => 0.275, "C" => 0.660)

"""
    v2_score(vector::AbstractString) -> Union{Nothing, Float64}

Compute the CVSS v2 base score for a vector string like
`"AV:N/AC:L/Au:N/C:P/I:P/A:P"`. Returns `nothing` if any base metric is
missing or invalid.
"""
function v2_score(vector::AbstractString)::Union{Nothing,Float64}
    m = _metric_pairs(vector)
    av = _metric(V2_AV,  m, "AV")
    ac = _metric(V2_AC,  m, "AC")
    au = _metric(V2_AU,  m, "Au")
    c  = _metric(V2_CIA, m, "C")
    i  = _metric(V2_CIA, m, "I")
    a  = _metric(V2_CIA, m, "A")
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

const V4_LOOKUP = Dict{String,Float64}(
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

const V4_LEVELS = Dict(
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
const V4_MAX_COMPOSED = Dict(
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
const V4_MAX_COMPOSED_EQ3EQ6 = Dict(
    "00" => ["VC:H/VI:H/VA:H/CR:H/IR:H/AR:H/"],
    "01" => ["VC:H/VI:H/VA:L/CR:M/IR:M/AR:H/", "VC:H/VI:H/VA:H/CR:M/IR:M/AR:M/"],
    "10" => ["VC:L/VI:H/VA:H/CR:H/IR:H/AR:H/", "VC:H/VI:L/VA:H/CR:H/IR:H/AR:H/"],
    "11" => ["VC:L/VI:H/VA:L/CR:H/IR:M/AR:H/", "VC:L/VI:H/VA:H/CR:H/IR:M/AR:M/",
             "VC:H/VI:L/VA:H/CR:M/IR:H/AR:M/", "VC:H/VI:L/VA:L/CR:M/IR:H/AR:H/",
             "VC:L/VI:L/VA:H/CR:H/IR:H/AR:M/"],
    "21" => ["VC:L/VI:L/VA:L/CR:H/IR:H/AR:H/"],
)

# Max severity distances (in 0.1 steps) within each equivalence class.
const V4_MAX_SEVERITY = Dict(
    "eq1" => Dict(0 => 1, 1 => 4, 2 => 5),
    "eq2" => Dict(0 => 1, 1 => 2),
    "eq4" => Dict(0 => 6, 1 => 5, 2 => 4),
)
const V4_MAX_SEVERITY_EQ3EQ6 =
    Dict("00" => 7, "01" => 6, "10" => 8, "11" => 8, "21" => 10)

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

const V4_DISTANCE_METRICS =
    ("AV", "PR", "UI", "AC", "AT", "VC", "VI", "VA", "SC", "SI", "SA", "CR", "IR", "AR")

"""
    v4_score(vector::AbstractString) -> Union{Nothing, Float64}

Compute the CVSS v4.0 score for a vector string like
`"CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N"`.
Threat (E) and environmental (CR/IR/AR/M*) metrics are honored when present,
so this is the CVSS-BTE score; it reduces to the base CVSS-B score when only
base metrics are given. Returns `nothing` if any mandatory metric is missing
or invalid.
"""
function v4_score(vector::AbstractString)::Union{Nothing,Float64}
    startswith(vector, "CVSS:4.0/") || return nothing
    m = _metric_pairs(vector)
    g(x) = _v4_metric(m, x)
    all(haskey(m, k) for k in ("AV", "AC", "AT", "PR", "UI", "VC", "VI", "VA", "SC", "SI", "SA")) ||
        return nothing
    all(haskey(V4_LEVELS[k], g(k)) for k in V4_DISTANCE_METRICS) || return nothing

    # No impact at all is scored 0.0 outright.
    all(g(x) == "N" for x in ("VC", "VI", "VA", "SC", "SI", "SA")) && return 0.0

    eq1, eq2, eq3, eq4, eq5, eq6 = _v4_macrovector(m)
    eq3eq6 = "$eq3$eq6"
    value = get(V4_LOOKUP, "$eq1$eq2$eq3$eq4$eq5$eq6", nothing)
    value === nothing && return nothing

    # Scores of the next-lower MacroVector along each equivalence class
    # (NaN when none exists).
    lower(s) = get(V4_LOOKUP, s, NaN)
    lower_eq1 = lower("$(eq1 + 1)$eq2$eq3$eq4$eq5$eq6")
    lower_eq2 = lower("$eq1$(eq2 + 1)$eq3$eq4$eq5$eq6")
    lower_eq4 = lower("$eq1$eq2$eq3$(eq4 + 1)$eq5$eq6")
    lower_eq5 = lower("$eq1$eq2$eq3$eq4$(eq5 + 1)$eq6")
    # EQ3/EQ6 has two possible lower paths; take the higher score.  Invalid
    # neighbor combinations are simply absent from the lookup table (NaN).
    lower_eq3eq6 = let l = lower("$eq1$eq2$eq3$eq4$eq5$(eq6 + 1)"),
                       r = lower("$eq1$eq2$(eq3 + 1)$eq4$eq5$eq6")
        isnan(l) ? r : isnan(r) ? l : max(l, r)
    end

    # Severity distance of the vector from the highest-severity vector in
    # its MacroVector: the first max candidate with no negative distances.
    own = Dict(metric => V4_LEVELS[metric][g(metric)] for metric in V4_DISTANCE_METRICS)
    dist = Dict{String,Float64}()
    for a in V4_MAX_COMPOSED["eq1"][eq1], b in V4_MAX_COMPOSED["eq2"][eq2],
        c in V4_MAX_COMPOSED_EQ3EQ6[eq3eq6], d in V4_MAX_COMPOSED["eq4"][eq4],
        e in V4_MAX_COMPOSED["eq5"][eq5]

        mvd = _metric_pairs(a * b * c * d * e)
        trial = Dict(metric => own[metric] - V4_LEVELS[metric][mvd[metric]]
                     for metric in V4_DISTANCE_METRICS)
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
        (value - lower_eq1, dist["AV"] + dist["PR"] + dist["UI"], V4_MAX_SEVERITY["eq1"][eq1]),
        (value - lower_eq2, dist["AC"] + dist["AT"], V4_MAX_SEVERITY["eq2"][eq2]),
        (value - lower_eq3eq6,
         dist["VC"] + dist["VI"] + dist["VA"] + dist["CR"] + dist["IR"] + dist["AR"],
         V4_MAX_SEVERITY_EQ3EQ6[eq3eq6]),
        (value - lower_eq4, dist["SC"] + dist["SI"] + dist["SA"], V4_MAX_SEVERITY["eq4"][eq4]),
        (value - lower_eq5, 0.0, 1),
    )
        isnan(avail) && continue
        n_lower += 1
        normalized += avail * (d / (maxsev * step))
    end
    n_lower > 0 && (value -= normalized / n_lower)
    # A 1e-6 epsilon absorbs accumulated floating point error at .x5 rounding
    # boundaries (e.g. 6.1 - 0.45 = 5.6499999…, which should round to 5.7).
    # FIRST's JS calculator rounds the raw float; we follow the Red Hat cvss
    # library in rounding the spec-intended decimal value instead, see
    # https://github.com/RedHatProductSecurity/cvss-v4-calculator/issues/48
    round(clamp(value, 0.0, 10.0) + 1e-6, RoundNearestTiesUp; digits=1)
end

end # module CVSS
