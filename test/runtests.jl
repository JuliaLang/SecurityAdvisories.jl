using SecurityAdvisories, Test, TOML

using SecurityAdvisories.VersionStrings: VersionString as V
@testset "VersionString comparisons" begin
    @test V("1.0.3") < V("1.0.10")
    @test V("1.0.3-rc2") < V("1.0.3-rc10")
    @test V("2.0.3-rc2") > V("1.0.3-rc10")
    @test V("1") < V("1.0.1")
    @test V("1.2.3-") < V("1.2.3")
    @test V("1.2.3-rc1") < V("1.2.3")
    @test !(V("1.2.3") < V("1.2.3"))
    @test V("1.1.1") < V("1.1.1c")
    @test V("01") < V("1")
    @test V("01") < V("1.0")
    @test V("1.2.03") < V("1.2.3")
    @test V("1.2.03") != V("1.2.3")
    @test V("1.2.3") > V("1.2.03")
    @test V("1.2.03") < V("1.2.3-")
    @test V("1.2.3-") > V("1.2.03")
end

using SecurityAdvisories: VersionRange as VR, merge_ranges
@testset "VersionRange parsing" begin
    # EUVD writes an inclusive lower bound before the operator, with or without a comma
    @test VR("26.0.0<36.0.3") == VR(">= 26.0.0, < 36.0.3")
    @test VR("26.0.0, < 36.0.3") == VR(">= 26.0.0, < 36.0.3")
    @test VR("4.2.0.Final, < 4.2.17.Final") == VR(">= 4.2.0.Final, < 4.2.17.Final")
    @test VR("1.0.0-alpha.0, ≤ 1.0.0-alpha.20").ubinclusive
    # But other comma-ed or operator-less shapes stay unparseable
    @test tryparse(VR, "patch: 0:2.6.4-8.el10_2") === nothing
    @test tryparse(VR, "25.0.0, 26.0.0, < 27.0.0") === nothing
    @test tryparse(VR, ", < 1.0") === nothing
    @test tryparse(VR, "1.0, 2.0") === nothing
end

@testset "VersionRange merging" begin
    @test merge_ranges(VR.(["1 < 2", "2 < 3", "3 < 4"])) == [VR("1 < 4")]
    @test merge_ranges(VR.(["1 < 2", "2 <= 4", "3 < 4"])) == [VR("1 <= 4")]
    @test merge_ranges(VR.(["1 < 2", "2 <= 4", "3 < 4", "3 < 5"])) == [VR("1 < 5")]
    @test merge_ranges(VR.(["1 < 2", "> 2, <= 5", "3 < 5"])) == [VR("1 < 2"), VR(">2, <=5")]

    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 < 3", "3 < 4"])) == [VR{VersionNumber}("1 < 4")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 <= 4", "3 < 4"])) == [VR{VersionNumber}("1 <= 4")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 <= 4", "3 < 4", "3 < 5"])) == [VR{VersionNumber}("1 < 5")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "> 2, <= 5", "3 < 5"])) == [VR{VersionNumber}("1 < 2"), VR{VersionNumber}(">2, <=5")]
end

# Matching; this should ideally be more isolated from GeneralMetadata.jl's package components data
@testset "CVE-2021-4048 — applicable packages and ranges" begin
    desc = "An out-of-bounds read flaw was found in the CLARRV, DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0, as also used in OpenBLAS before version 0.3.18. Specially crafted inputs passed to these functions could cause an application using lapack to crash or possibly disclose portions of its memory."
    vpv = [("lapack_project", "lapack", "<= 3.10.0"), ("openblas_project", "openblas", "< 0.3.18"), ("julialang", "julia", "<= 1.6.3"), ("julialang", "julia", "= 1.7.0-beta1"), ("julialang", "julia", "= 1.7.0-beta2"), ("julialang", "julia", "= 1.7.0-beta3"), ("julialang", "julia", "= 1.7.0-beta4"), ("julialang", "julia", "= 1.7.0-rc1"), ("redhat", "ceph_storage", "= 2.0"), ("redhat", "ceph_storage", "= 3.0"), ("redhat", "ceph_storage", "= 4.0"), ("redhat", "ceph_storage", "= 5.0"), ("redhat", "openshift_container_storage", "= 4.0"), ("redhat", "openshift_data_foundation", "= 4.0"), ("redhat", "enterprise_linux", "= 8.0"), ("fedoraproject", "fedora", "= 34"), ("fedoraproject", "fedora", "= 35")]

    (; affected, upstreams, upstream_type) = SecurityAdvisories.affected_julia_packages(desc, vpv)
    matches = affected
    @test upstream_type == :upstream
    @test "julia" ∉ (x->x.pkg).(matches)
    @test "OpenBLAS_jll" in (x->x.pkg).(matches)
    @test "OpenBLAS32_jll" in (x->x.pkg).(matches)
    @test "OpenBLASHighCoreCount_jll" in (x->x.pkg).(matches)

    @test only(matches[(x->x.pkg).(matches) .== "OpenBLASHighCoreCount_jll"]).ranges == [SecurityAdvisories.VersionRange{VersionNumber}("*")]

    # The upstream components' originating ranges are recorded alongside, verbatim
    @test only(u for u in upstreams if u.vendor_product == "lapack_project:lapack").ranges == ["<= 3.10.0"]
    @test only(u for u in upstreams if u.vendor_product == "openblas_project:openblas").ranges == ["< 0.3.18"]
    # ... and the packages providing each component are computed, not stored
    @test "LAPACK_jll" in SecurityAdvisories.packages_with_upstream_component("lapack_project:lapack")
    @test "OpenBLAS_jll" in SecurityAdvisories.packages_with_upstream_component("openblas_project:openblas")

    # `used_source` re-runs each source's components to find whose data made the ranges
    dt = SecurityAdvisories.Dates.DateTime(2026, 1, 1)
    src(id, components) = SecurityAdvisories.AdvisorySource(; id, imported=dt, modified=dt, published=dt,
        url="https://example.com", html_url="https://example.com", affected=components)
    adv = SecurityAdvisories.Advisory(id="JLSEC-0000-CVE-2021-4048", aliases=["CVE-2021-4048"], affected=matches,
        jlsec_sources=[src("CVE-2021-4048", upstreams),
                       src("EUVD-2021-1", [SecurityAdvisories.UpstreamRanges(vendor_product="lapack_project:lapack", ranges=["= 0.0.1"])])])
    @test SecurityAdvisories.used_source(SecurityAdvisories.to_toml_frontmatter(adv)) == "CVE-2021-4048"
end

using SecurityAdvisories: convert_versions, VersionRange
@testset "version conversions" begin
    @test isempty(convert_versions(["1.2.3" => "3.4.5"], VersionRange("< 3.4.5")))
    @test only(convert_versions(["1.2.3" => "3.4.5"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("*")
    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "3.4.5", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => "*", "1.2.3" => "3.4.5", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")
    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "3.4.5", "1.2.4" => "*"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => [], "1.2.3" => "3.4.5", "1.2.4" => []], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.4","3.4.5"], "1.2.3" => "3.4.5", "1.2.4" => []], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")

    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "*", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.6","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.5"], "1.2.3" => "*", "1.2.4" => ["3.4.6","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.5","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.4","3.4.5"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.4","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")

    @test only(convert_versions(["1.2.2" => "*", "1.2.3" => "*", "1.2.4" => "*"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("*")
    @test only(convert_versions(["1.2.2" => "*", "1.2.3" => "*", "1.2.4" => "*"], VersionRange("< 3.4.5"))) == VersionRange{VersionNumber}("*")

    # Note that there's an intentional asymmetry here — we ignore the oldest unknowns (unless everything is vulnerable),
    # bound intervening ones, and unbound newest ones
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange("< 1.2.3")) == []
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange("= 1.2.4")) == [VersionRange{VersionNumber}(">= 1.2.4")]
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange("= 1.2.3")) == [VersionRange{VersionNumber}("*")]
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange("= 1.2.2")) == []
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange("> 1.2.3")) == [VersionRange{VersionNumber}(">= 1.2.4")]
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => "*"], VersionRange(">= 1.2.3")) == [VersionRange{VersionNumber}("*")]

    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => []], VersionRange("< 1.2.3")) == []
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => []], VersionRange("= 1.2.4")) == []
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => []], VersionRange("= 1.2.3")) == [VersionRange{VersionNumber}("< 1.2.4")]
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => []], VersionRange("= 1.2.2")) == []
    @test convert_versions(["1.2.2" => "*", "1.2.3" => "1.2.3", "1.2.4" => []], VersionRange("> 1.2.3")) == []

    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("< 1.2.3")) == [VersionRange{VersionNumber}("< 1.2.4")]
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("= 1.2.5")) == []
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("= 1.2.4")) == [VersionRange{VersionNumber}(">= 1.2.3")]
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("= 1.2.3")) == [VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")]
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("= 1.2.2")) == [VersionRange{VersionNumber}("< 1.2.4")]
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("= 1.2.1")) == []
    @test convert_versions(["1.2.2" => "1.2.2", "1.2.3" => "*", "1.2.4" => "1.2.4"], VersionRange("> 1.2.3")) == [VersionRange{VersionNumber}(">= 1.2.3")]

    singular = Dict{String, Any}("4.1.3+0" => missing, "4.1.3+1" => missing, "4.1.3+2" => missing, "4.1.3+3" => missing, "4.1.3+4" => missing, "4.1.3+5" => missing, "4.1.3+6" => missing, "4.1.4+0" => ["*"], "401.390.0+0" => ["*"], "401.990.0+0" => ["*"], "402.0.0+0" => missing, "402.0.1+0" => missing, "402.0.101+0" => ["*"], "402.0.102+0" => ["*"], "402.0.102+1" => ["*"], "402.0.103+0" => ["*"], "402.0.104+0" => ["*"], "402.100.100+0" => ["*"], "402.100.101+0" => ["*"], "402.100.102+0" => ["*"], "402.101.100+0" => ["*"], "402.101.200+0" => ["4.2.1p2"], "402.101.201+0" => ["4.2.1p2"], "403.0.100+0" => ["*"], "403.1.100+0" => ["*"], "403.1.200+0" => ["*"], "403.1.300+0" => ["*"], "403.100.100+0" => ["*"], "403.100.200+0" => ["*"], "403.100.300+0" => ["*"], "403.101.400+0" => ["*"], "403.101.500+0" => ["*"], "403.201.0+0" => ["4.3.2p1"], "403.201.1+0" => ["*"], "403.201.202+0" => ["4.3.2p2"], "403.202.200+0" => ["4.3.2p2"], "403.203.200+0" => ["*"], "403.203.201+0" => ["*"], "403.203.202+0" => ["*"], "403.204.400+0" => ["4.3.2p4"], "403.205.500+0" => ["4.3.2p5"], "403.206.600+0" => ["4.3.2p6"], "403.207.700+0" => ["*"], "403.208.800+0" => ["4.3.2p8"], "403.209.900+0" => ["*"], "403.210.1000+0" => ["4.3.2p10"], "403.211.1100+0" => ["*"], "403.212.1200+0" => ["*"], "403.212.1201+0" => ["*"], "403.212.1202+0" => ["*"], "403.214.1400+0" => ["4.3.2p14"], "403.216.1600+0" => ["4.3.2p16"], "403.216.1601+0" => ["*"], "403.216.1602+0" => ["*"], "403.216.1603+0" => ["*"], "404.0.100+0" => ["*"], "404.0.301+0" => ["*"], "404.0.502+0" => ["*"], "404.0.503+0" => ["*"], "404.0.504+0" => ["*"], "404.0.605+0" => ["4.4.0p6"], "404.0.606+0" => ["*"], "404.0.707+0" => ["*"], "404.0.708+0" => ["*"], "404.0.709+0" => ["*"], "404.0.710+0" => ["*"], "404.0.711+0" => ["*"], "404.1.700+0" => ["*"], "404.100.0+0" => ["*"], "404.100.100+0" => ["*"], "404.100.101+0" => ["*"], "404.100.102+0" => ["*"], "404.100.103+0" => ["*"], "404.100.104+0" => ["*"], "404.100.105+0" => ["*"], "404.100.106+0" => ["*"], "404.100.107+0" => ["*"], "404.100.108+0" => ["*"], "404.100.109+0" => ["*"], "404.100.300+0" => ["*"], "404.100.301+0" => ["*"], "404.101.300+0" => ["*"], "404.101.301+0" => ["*"], "404.101.400+0" => ["*"], "404.101.500+0" => ["*"], "404.101.501+0" => ["*"], "404.101.502+0" => ["*"], "404.101.503+0" => ["*"], "404.101.504+0" => ["*"], "404.101.505+0" => ["4.4.1p5"], "404.101.505+1" => ["4.4.1p5"], "404.101.505+2" => ["4.4.1p5"], "404.101.505+3" => ["*"])
    @test convert_versions(singular, VersionRange("< 4.3.1")) == [VersionRange{VersionNumber}("< 403.201.0+0")]
end

# Specific support for re-interpreting GitHub's patched field:
@testset "GitHub version extraction" begin
    # From GHSA-543v-gj2c-r3ch
    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "activemodel", :ecosystem => "rubygems"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14.0", :first_patched_version => "4.1.14.1"), Dict(:package => Dict(:name => "activemodel", :ecosystem => "rubygems"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5.0", :first_patched_version => "4.2.5.1")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("rubygems", "activemodel", ">= 4.1.0, < 4.1.14.1")
    @test vpv[2] == ("rubygems", "activemodel", ">= 4.2.0, < 4.2.5.1")

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14.0", :first_patched_version => "4.1.14.1"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5.0", :first_patched_version => "4.2.5.1")])
    @test_throws "invalid version" GitHub.vendor_product_versions(vuln)

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14", :first_patched_version => "4.1.15"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5", :first_patched_version => "4.2.6")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("Julia", "ActiveInference", ">= 4.1.0, < 4.1.15")
    @test vpv[2] == ("Julia", "ActiveInference", ">= 4.2.0, < 4.2.6")

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0", :first_patched_version => "4.1.15"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => "<= 4.2.5", :first_patched_version => "4.2.6")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("Julia", "ActiveInference", ">= 4.1.0, < 4.1.15")
    @test vpv[2] == ("Julia", "ActiveInference", "< 4.2.6")
end

@testset "purl" begin
    packages = ["HTTP", "TimeZones", "TOML"] # Use some of the general and stdlib packages we depend on
    project_toml = TOML.parsefile(joinpath(@__DIR__, "..", "Project.toml"))
    for pkg in packages
        expected = project_toml["deps"][pkg]
        result = SecurityAdvisories.purl(pkg)
        @test contains(result, "?")
        ecosystem, parameter = split(result, "?")
        # Mandatory
        @test startswith(ecosystem, "pkg:julia/$pkg")
        @test contains(parameter, "uuid=$(expected)")
        # Optional
    end
    @test_throws "no UUID" SecurityAdvisories.purl("ThisPackageDoesHopefullyNotExist")
end

@testset "combining severities" begin
    using SecurityAdvisories: Severity, combine_severities
    v3_nvd = Severity("CVSS_V3", "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H", "NVD")
    v3_nvd_revised = Severity("CVSS_V3", "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:L", "NVD")
    v3_ghsa = Severity("CVSS_V3", "CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H", "GHSA")
    v3_unsourced = Severity("CVSS_V3", "CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H")
    v3_unsourced_revised = Severity("CVSS_V3", "CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H")
    v4_ghsa = Severity("CVSS_V4", "CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:N/SC:N/SI:N/SA:N", "GHSA")
    # New types are appended
    @test combine_severities([v3_nvd], [v4_ghsa]) == [v3_nvd, v4_ghsa]
    # Same type from a different source: the first argument wins
    @test combine_severities([v3_nvd], [v3_ghsa]) == [v3_nvd]
    # Same type from the same source: it's an updated assessment, so the new value wins
    @test combine_severities([v3_nvd], [v3_nvd_revised]) == [v3_nvd_revised]
    # Sources must match exactly; sourceless severities only match other sourceless ones
    @test combine_severities([v3_unsourced], [v3_nvd]) == [v3_unsourced]
    @test combine_severities([v3_nvd], [v3_unsourced]) == [v3_nvd]
    @test combine_severities([v3_unsourced], [v3_unsourced_revised]) == [v3_unsourced_revised]
end

@testset "CVSS scoring" begin
    using SecurityAdvisories: CVSS, Severity
    # Expected scores verified against the RedHat `cvss` Python reference
    # library (v2/v3 base scores; v4 full CVSS-BTE scores).
    @testset "CVSS v3.x base scores" begin
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H") == 9.8
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H") == 10.0
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:L/I:L/A:N") == 6.1
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N") == 5.3
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H") == 7.5
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H") == 8.8
        @test CVSS.v3_score("CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H") == 7.8
        # Changed scope exercises the alternate impact and 1.08 scaling terms
        @test CVSS.v3_score("CVSS:3.0/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:N/A:N") == 5.6
        @test CVSS.v3_score("CVSS:3.1/AV:A/AC:H/PR:L/UI:R/S:C/C:L/I:L/A:L") == 5.1
        @test CVSS.v3_score("CVSS:3.1/AV:P/AC:H/PR:H/UI:R/S:U/C:L/I:N/A:N") == 1.6
        # No impact scores 0.0 regardless of exploitability
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:N") == 0.0
        # Temporal metrics are ignored; the base score is unaffected
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H/E:F/RL:O/RC:C") == 9.8
        # Incomplete or invalid vectors
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H") === nothing
        @test CVSS.v3_score("CVSS:3.1/AV:Q/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H") === nothing
        @test CVSS.v3_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/C:H/I:H/A:H") === nothing  # missing S
        @test CVSS.v3_score("AV:N/AC:L/Au:N/C:P/I:P/A:P") === nothing  # v2 vector
        @test CVSS.v3_score("bogus") === nothing
    end

    @testset "CVSS v2 base scores" begin
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:C/I:C/A:C") == 10.0
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:P/I:P/A:P") == 7.5
        @test CVSS.v2_score("AV:N/AC:M/Au:N/C:N/I:P/A:N") == 4.3
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:P/I:N/A:N") == 5.0
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:N/I:N/A:C") == 7.8
        @test CVSS.v2_score("AV:L/AC:H/Au:N/C:C/I:C/A:C") == 6.2
        @test CVSS.v2_score("AV:L/AC:H/Au:M/C:P/I:N/A:N") == 0.8
        @test CVSS.v2_score("AV:A/AC:M/Au:S/C:P/I:C/A:N") == 5.8
        # No impact scores 0.0 regardless of exploitability
        @test CVSS.v2_score("AV:L/AC:L/Au:N/C:N/I:N/A:N") == 0.0
        # Temporal metrics are ignored; the base score is unaffected
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:P/I:P/A:P/E:F/RL:OF/RC:C") == 7.5
        # Incomplete or invalid vectors
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:P/I:P") === nothing
        @test CVSS.v2_score("AV:N/AC:L/Au:N/C:X/I:P/A:P") === nothing
        @test CVSS.v2_score("bogus") === nothing
    end

    @testset "CVSS v4.0 scores" begin
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") == 9.3
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:H/SI:H/SA:H") == 10.0
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:N/VI:N/VA:N/SC:N/SI:N/SA:N") == 0.0
        # Interpolation between MacroVectors (non-zero severity distances)
        @test CVSS.v4_score("CVSS:4.0/AV:L/AC:L/AT:N/PR:N/UI:P/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") == 8.5
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:H/AT:P/PR:L/UI:P/VC:L/VI:L/VA:N/SC:N/SI:N/SA:N") == 2.1
        @test CVSS.v4_score("CVSS:4.0/AV:P/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") == 7.0
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:L/UI:N/VC:H/VI:L/VA:N/SC:N/SI:N/SA:N") == 7.1
        @test CVSS.v4_score("CVSS:4.0/AV:A/AC:H/AT:P/PR:L/UI:A/VC:L/VI:L/VA:L/SC:L/SI:L/SA:L") == 1.0
        # Threat metrics lower the score from the base 9.3
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N/E:P") == 8.9
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N/E:U") == 8.1
        # Environmental metrics: M* overrides and security requirements
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N/MAV:P/MVC:N") == 5.2
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N/CR:L/IR:L/AR:L") == 8.9
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:N/VI:N/VA:N/SC:H/SI:H/SA:H/MSI:S") == 9.1
        # Incomplete or invalid vectors
        @test CVSS.v4_score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N") === nothing
        @test CVSS.v4_score("CVSS:4.0/AV:Q/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") === nothing
        @test CVSS.v4_score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H") === nothing
        @test CVSS.v4_score("bogus") === nothing
    end

    @testset "CVSS.score entry points" begin
        # Version auto-detection from vector strings
        @test CVSS.version("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H") == 3
        @test CVSS.version("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") == 4
        @test CVSS.version("AV:N/AC:L/Au:N/C:P/I:P/A:P") == 2
        @test CVSS.version("not a cvss vector") === nothing
        @test CVSS.score("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H") == 9.8
        @test CVSS.score("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N") == 9.3
        @test CVSS.score("AV:N/AC:L/Au:N/C:P/I:P/A:P") == 7.5
        @test CVSS.score("not a cvss vector") === nothing
        # Severity parsing derives its type from the vector's CVSS version
        @test Severity("CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H").type == "CVSS_V3"
        @test Severity("CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N").type == "CVSS_V4"
        @test Severity("AV:N/AC:L/Au:N/C:P/I:P/A:P").type == "CVSS_V2"
        @test tryparse(Severity, "medium") === nothing
    end
end

using Downloads: Downloads
@testset "CVSS scoring corpus" begin
    # The Red Hat `cvss` library's full test corpus (LGPL-3.0), downloaded
    # on demand from a pinned revision. Each line pairs a vector with its
    # expected scores as "<vector> - (base[, temporal, environmental])",
    # where undefined scores are `None`. Our v2/v3 scorers compute the base
    # score (the first element) and v4_score the full CVSS-BTE score.
    corpus_url = "https://raw.githubusercontent.com/RedHatProductSecurity/cvss/2f149099257ae06b98cef252efc440bddafe61e5/tests/"
    @testset "$file" for (file, scorer) in [
        ("vectors_simple2",  CVSS.v2_score),
        ("vectors_random2",  CVSS.v2_score),
        ("vectors_simple3",  CVSS.v3_score),
        ("vectors_random3",  CVSS.v3_score),
        ("vectors_simple31", CVSS.v3_score),
        ("vectors_random31", CVSS.v3_score),
        ("vectors_simple4",  CVSS.v4_score),
        ("vectors_random4",  CVSS.v4_score),
    ]
        path = Downloads.download(corpus_url * file)
        n = 0
        mismatches = String[]
        for line in eachline(path)
            isempty(strip(line)) && continue
            vector, expected_str = split(line, " - ")
            expected = parse(Float64, strip(first(split(strip(expected_str, ['(', ')', ' ']), ','))))
            got = scorer(String(vector))
            n += 1
            got == expected || push!(mismatches, "$vector: expected $expected, got $(something(got, "nothing"))")
        end
        rm(path)
        @test n > 0
        @test isempty(mismatches)
    end
end

@testset "fetch_combinations tolerates aliases that can't be fetched" begin
    # GHSA/EUVD/NVD advisories can reference aliases (e.g. PYSEC-*) that `fetch_advisory`
    # doesn't know how to fetch; those should be dropped from `sources` but still retained as alias ids
    batch = tryparse.(SecurityAdvisories.Advisory, [
        "```toml\nschema_version = \"1.7.4\"\nid = \"JLSEC-0000-CVE-2025-15346\"\nmodified = 2026-07-14T19:24:49.287Z\naliases = [\"CVE-2025-15346\"]\nreferences = [\"https://github.com/wolfSSL/wolfssl-py/commit/b4517dece79f682a8f453abce5cfc0b81bae769d\", \"https://github.com/wolfSSL/wolfssl-py/pull/62\", \"https://github.com/wolfSSL/wolfssl-py/releases/tag/v5.8.4-stable\"]\n\n[[jlsec_sources]]\nid = \"CVE-2025-15346\"\nimported = 2026-07-14T19:24:49.287Z\nmodified = 2026-06-17T08:37:36.140Z\npublished= 2026-01-08T00:15:59.393Z\nurl = \"https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-15346\"\nhtml_url = \"https://nvd.nist.gov/vuln/detail/CVE-2025-15346\"\ndatabase_specific = {status = \"Deferred\"}\n```\n\nA vulnerability in the handling of verify_mode = CERT_REQUIRED in the wolfssl Python package (wolfssl-py) causes client certificate requirements to not be fully enforced.\n\nBecause the WOLFSSL_VERIFY_FAIL_IF_NO_PEER_CERT flag was not included, the behavior effectively matched CERT_OPTIONAL: a peer certificate was verified if presented, but connections were incorrectly authenticated when no client certificate was provided.\n\nThis resultsin improper authentication, allowing attackers to bypass mutual TLS (mTLS) client authentication by omitting a client certificate during the TLS handshake.\n\nThe issue affects versions up to and including 5.8.2.\n\n",
        "```toml\nschema_version = \"1.7.4\"\nid = \"JLSEC-0000-GHSA-vj87-jj27-4h9c\"\nmodified = 2026-07-14T19:24:49.600Z\naliases = [\"CVE-2025-15346\", \"GHSA-vj87-jj27-4h9c\"]\nreferences = [\"https://github.com/advisories/GHSA-vj87-jj27-4h9c\", \"https://github.com/wolfSSL/wolfssl-py/commit/b4517dece79f682a8f453abce5cfc0b81bae769d\", \"https://github.com/wolfSSL/wolfssl-py/pull/62\", \"https://github.com/wolfSSL/wolfssl-py/releases/tag/v5.8.4-stable\", \"https://nvd.nist.gov/vuln/detail/CVE-2025-15346\"]\n\n[[credits]]\nname = \"rhdesmond\"\ncontact = [\"https://github.com/rhdesmond\"]\ntype = \"ANALYST\"\n\n[[jlsec_sources]]\nid = \"GHSA-vj87-jj27-4h9c\"\nimported = 2026-07-14T19:24:49.600Z\nmodified = 2026-01-30T14:41:52.000Z\npublished = 2026-01-08T00:31:15.000Z\nurl = \"https://api.github.com/advisories/GHSA-vj87-jj27-4h9c\"\nhtml_url = \"https://github.com/advisories/GHSA-vj87-jj27-4h9c\"\n```\n\n# wolfSSL Python module vulnerable toImproper Authentication\n\nA vulnerability in the handling of verify_mode = CERT_REQUIRED in the wolfssl Python package (wolfssl-py) causes client certificate requirements to not be fully enforced.\n\nBecause the WOLFSSL_VERIFY_FAIL_IF_NO_PEER_CERT flag was not included, the behavior effectively matched CERT_OPTIONAL: a peer certificate was verified if presented, but connections were incorrectly authenticated when no client certificate was provided.\n\nThis results in improper authentication, allowing attackers to bypass mutual TLS (mTLS) client authentication by omitting a client certificate during the TLS handshake.\n\nThe issue affects versions up to and including 5.8.2.\n\n",
        "```toml\nschema_version = \"1.7.4\"\nid = \"JLSEC-0000-CVE-2025-15346\"\nmodified = 2026-07-14T19:35:14.692Z\naliases = [\"CVE-2025-15346\", \"GHSA-vj87-jj27-4h9c\", \"EUVD-2026-1463\", \"PYSEC-2026-575\"]\nseverity = [\"CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:N/SC:N/SI:N/SA:N/AU:Y\"]\nreferences = [\"https://github.com/wolfSSL/wolfssl-py/commit/b4517dece79f682a8f453abce5cfc0b81bae769d\", \"https://github.com/wolfSSL/wolfssl-py/pull/62\", \"https://github.com/wolfSSL/wolfssl-py/releases/tag/v5.8.4-stable\"]\n\n[[jlsec_sources]]\nid = \"EUVD-2026-1463\"\nimported = 2026-07-14T19:35:14.692Z\nmodified = 2026-01-08T19:22:49.000Z\npublished = 2026-01-07T23:32:11.000Z\nurl = \"https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2026-1463\"\nhtml_url = \"https://euvd.enisa.europa.eu/vulnerability/EUVD-2026-1463\"\n```\n\nA vulnerability in the handling of verify_mode = CERT_REQUIRED in the wolfssl Python package (wolfssl-py) causes client certificate requirements to not be fully enforced.\n\nBecause the WOLFSSL_VERIFY_FAIL_IF_NO_PEER_CERT flag was not included, the behavior effectively matched CERT_OPTIONAL: a peer certificate was verified if presented, but connections were incorrectly authenticated when no client certificate was provided.\n\nThis results in improper authentication, allowing attackers to bypass mutual TLS (mTLS) client authentication by omitting a client certificate during the TLS handshake.\n\nThe issue affects versions up to and including 5.8.2."])
    combined = SecurityAdvisories.fetch_combinations(batch)
    @test length(combined) == 1
    @test "PYSEC-2026-575" in only(combined).aliases
end

@testset "fetch_combinations of repository GHSAs" begin
    # Repository GHSAs are keyed by a repo-scoped `srcid` (owner/repo/GHSA-...) but their
    # aliases only list the plain GHSA id; the two must still be recognized as the same advisory
    batch = tryparse.(SecurityAdvisories.Advisory, [
        "```toml\nschema_version = \"1.8.0\"\nid = \"JLSEC-0000-GHSA-r3xx-hw22-6h6w\"\nmodified = 2026-07-23T19:36:30.000Z\naliases = [\"GHSA-r3xx-hw22-6h6w\"]\n\n[[affected]]\npkg = \"LibSSH\"\nranges = [\"< 1.1.0\"]\n\n[[jlsec_sources]]\nid = \"GHSA-r3xx-hw22-6h6w\"\nimported = 2026-07-23T19:36:30.000Z\nmodified = 2026-07-23T15:00:00.000Z\npublished = 2026-07-23T15:00:00.000Z\nurl = \"https://api.github.com/repos/JuliaWeb/LibSSH.jl/security-advisories/GHSA-r3xx-hw22-6h6w\"\nhtml_url = \"https://github.com/JuliaWeb/LibSSH.jl/security/advisories/GHSA-r3xx-hw22-6h6w\"\n```\n\n# Writing to SFTP files resulting in sending out-of-bounds data to the server\n"])
    combined = SecurityAdvisories.fetch_combinations(batch)
    @test length(combined) == 1
    @test "GHSA-r3xx-hw22-6h6w" in only(combined).aliases
end

@testset "fetch_combinations skips alias sets with no fetchable sources" begin
    # A published JLSEC whose aliases can't be re-fetched shouldn't error
    batch = tryparse.(SecurityAdvisories.Advisory, [
        "```toml\nschema_version = \"1.8.0\"\nid = \"JLSEC-2026-12345\"\nmodified = 2026-07-23T19:36:30.000Z\npublished = 2026-07-23T19:36:30.000Z\naliases = [\"PYSEC-2026-99999\"]\n\n[[affected]]\npkg = \"Example\"\nranges = [\"< 1.0.0\"]\n\n[[jlsec_sources]]\nid = \"PYSEC-2026-99999\"\nimported = 2026-07-23T19:36:30.000Z\nmodified = 2026-07-23T15:00:00.000Z\npublished = 2026-07-23T15:00:00.000Z\nurl = \"https://example.com/PYSEC-2026-99999\"\nhtml_url = \"https://example.com/PYSEC-2026-99999\"\n```\n\n# Some advisory\n"])
    combined = @test_logs (:info,) (:warn, r"no fetched advisories") SecurityAdvisories.fetch_combinations(batch)
    @test isempty(combined)
end

using SecurityAdvisories: Advisory, AdvisorySource, PackageVulnerability, UpstreamRanges, VersionString, recipe_update_candidates
using DataStructures: OrderedDict
using Dates: DateTime
# A jlsec_sources entry with the required metadata; keywords (like `affected`) override the defaults
test_source(; kw...) = AdvisorySource(; id="CVE-2025-99999", imported=DateTime(2026,1,1), modified=DateTime(2026,1,1),
    published=DateTime(2025,1,1), url="https://example.com", html_url="https://example.com", kw...)
@testset "recipe update candidates" begin
    unbounded = [VR{VersionNumber}(">= 1.0.0")]
    bounded = [VR{VersionNumber}(">= 1.0.0, < 2.0.0")]
    upstreams(versions...) = [test_source(affected=[
        UpstreamRanges(vendor_product="vendor:product", ranges=collect(String, versions))])]
    jll(; kw...) = Advisory(; affected=[PackageVulnerability(pkg="Zstd_jll", ranges=unbounded)], kw...)
    # The component-to-package association is computed from GeneralMetadata; inject a test double
    candidates(adv; pkgs=["Zstd_jll"]) = recipe_update_candidates(adv;
        packages_with_component = vp -> vp == "vendor:product" ? pkgs : String[])

    # An unbounded JLL whose upstream fix version is known (an exclusive upper bound) is actionable
    @test candidates(jll(jlsec_sources=upstreams("< 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    # ... using the largest fixed version across ranges, even non-semver-ish ones
    @test candidates(jll(jlsec_sources=upstreams(">= 1.0.0, < 1.4.0", "< 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    @test candidates(jll(jlsec_sources=upstreams("< 4.3.2p2", "< 4.3.2p10"))) == ["Zstd" => VersionString("4.3.2p10")]

    # Ranges that don't identify a fixed version (inclusively bounded, unbounded, exact,
    # or unparseable ones) are ignored...
    @test isempty(candidates(jll(jlsec_sources=upstreams("<= 1.5.7"))))
    @test isempty(candidates(jll(jlsec_sources=upstreams("*"))))
    @test isempty(candidates(jll(jlsec_sources=upstreams("= 1.5.7"))))
    @test isempty(candidates(jll(jlsec_sources=upstreams("who knows"))))
    # ... and don't veto ranges that do — such as when a second source reports a looser range
    @test candidates(jll(jlsec_sources=upstreams("< 1.5.7", "<= 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    @test candidates(jll(jlsec_sources=upstreams("*", "< 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    @test candidates(jll(jlsec_sources=[only(upstreams("< 1.5.7")),
        test_source(id="EUVD-2025-1", affected=[UpstreamRanges(vendor_product="vendor:product", ranges=["*"])])])) ==
        ["Zstd" => VersionString("1.5.7")]
    # Nor without any upstream version information at all
    @test isempty(candidates(jll()))
    @test isempty(candidates(jll(jlsec_sources=upstreams())))
    # Nor when the upstream component belongs to some other package
    @test isempty(candidates(jll(jlsec_sources=upstreams("< 1.5.7")); pkgs=["Other_jll"]))

    # Only vulnerable-and-unbounded JLL packages are considered
    @test isempty(candidates(Advisory(affected=[
        PackageVulnerability(pkg="Zstd_jll", ranges=bounded)], jlsec_sources=upstreams("< 1.5.7"))))
    @test isempty(candidates(Advisory(affected=[
        PackageVulnerability(pkg="Zstd_jll", ranges=VR{VersionNumber}[])], jlsec_sources=upstreams("< 1.5.7"))))
    @test isempty(candidates(Advisory(affected=[
        PackageVulnerability(pkg="NotAJLL", ranges=unbounded)], jlsec_sources=upstreams("< 1.5.7")); pkgs=["NotAJLL"]))
end

@testset "upstream ranges normalization and serialization" begin
    VRN = VR{VersionNumber}
    # Construction dedupes the ranges and sorts them by their parsed values
    u = UpstreamRanges(vendor_product="ffmpeg:ffmpeg",
        ranges=[">= 4.10, < 4.11", ">= 4.9, < 4.10", "< 3.4.14", "< 3.4.14"])
    @test u.ranges == ["< 3.4.14", ">= 4.9, < 4.10", ">= 4.10, < 4.11"] # numerically, not lexicographically
    # Unparseable ranges fall back to lexicographic order
    @test UpstreamRanges(vendor_product="v:p", ranges=["who knows", "< 1.0"]).ranges == ["< 1.0", "who knows"]
    # Malformed vendor_product identifiers (now hand-editable in advisory files) error clearly...
    @test_throws ArgumentError SecurityAdvisories.upstream_projects_by_cpe("no-colon-here")
    # ... while the package association treats them as mapping to no packages, so reports
    # and recipe updates skip the entry rather than crashing on it
    @test isempty(SecurityAdvisories.packages_with_upstream_component("no-colon-here"))

    # The sources' affected components round-trip through the Markdown/TOML serialization
    adv = Advisory(id="JLSEC-2025-9999", modified=DateTime(2026,1,1), published=DateTime(2025,1,1),
        upstream=["CVE-2025-99999"],
        affected=[PackageVulnerability(pkg="FFMPEG_jll", ranges=[VRN("< 6.1.2+0")]),
                  PackageVulnerability(pkg="FFplay_jll", ranges=[VRN("< 7.1.0+0")])],
        jlsec_sources=[test_source(affected=[u], database_specific=Dict{String,Any}("status"=>"Analyzed"))],
        summary="Test", details="Details.")
    serialized = sprint(print, adv)
    @test contains(serialized, "[[jlsec_sources.affected]]")
    reparsed = tryparse(Advisory, serialized)
    @test reparsed == adv
    @test only(only(reparsed.jlsec_sources).affected) == u
end

@testset "combining carries sources' upstream ranges" begin
    VRN = VR{VersionNumber}
    adv(id; kw...) = Advisory(; id, aliases=["CVE-2025-99999"],
        affected=[PackageVulnerability(pkg="Foo", ranges=[VRN("< 1.2.0")])], details="Details.", kw...)
    record(ranges) = UpstreamRanges(; vendor_product="v:p", ranges)

    # A newer import of the same source replaces it, carrying its affected upstream components along
    bare = adv("JLSEC-2025-9998", jlsec_sources=[test_source(imported=DateTime(2026,1,1))])
    mapped = adv("JLSEC-0000-placeholder", jlsec_sources=[test_source(imported=DateTime(2026,2,1), affected=[record(["< 2.0"])])])
    @test only(SecurityAdvisories.combine(bare, mapped).jlsec_sources).affected == [record(["< 2.0"])]
    @test only(SecurityAdvisories.combine(mapped, bare).jlsec_sources).affected == [record(["< 2.0"])]
    # ... and `update` considers that backfill a change worth saving
    updated = SecurityAdvisories.update(bare, mapped)
    @test only(updated.jlsec_sources).affected == [record(["< 2.0"])]
    @test updated.id == "JLSEC-2025-9998"
    # ... but a merely-newer import with the same affected components is not worth saving
    refetched = adv("JLSEC-2025-9998", jlsec_sources=[test_source(imported=DateTime(2026,3,1), affected=[record(["< 2.0"])])])
    @test SecurityAdvisories.update(updated, refetched) === updated

    # better_affected is the one choice both `combine` and `used_source` make:
    # prefer the first unless the second is clearly better
    ba = SecurityAdvisories.better_affected
    entry(ranges...) = PackageVulnerability(pkg="Foo", ranges=[VRN(r) for r in ranges])
    @test ba(entry("< 1.0.0"), entry("< 2.0.0")) == entry("< 1.0.0")               # a tie keeps the first
    @test ba(entry(">= 1.0.0"), entry("< 1.0.0", ">= 2.0.0")) == entry("< 1.0.0", ">= 2.0.0") # more ranges are more specific
    @test ba(entry("< 1.0.0"), entry(">= 2.0.0")) == entry("< 1.0.0")              # bounded beats unbounded
    @test ba(entry(">= 1.0.0"), entry("< 2.0.0")) == entry("< 2.0.0")

    # Different sources keep their own affected components side by side
    other = adv("JLSEC-0000-placeholder", jlsec_sources=[test_source(id="EUVD-2025-1", affected=[record(["< 1.5"])])])
    combined = SecurityAdvisories.combine(updated, other)
    @test length(combined.jlsec_sources) == 2
    @test only(s for s in combined.jlsec_sources if s.id == "CVE-2025-99999").affected == [record(["< 2.0"])]
    @test only(s for s in combined.jlsec_sources if s.id == "EUVD-2025-1").affected == [record(["< 1.5"])]

    # Affected components are sorted at construction, so their in-memory ordering (which
    # depends upon Dict iteration order at import time) is never mistaken for a change
    components = [UpstreamRanges(vendor_product="v:q", ranges=["< 3.0"]), record(["< 2.0"])]
    @test test_source(affected=components).affected == test_source(affected=reverse(components)).affected
    @test adv("JLSEC-2025-9998", jlsec_sources=[test_source(affected=components)]) ≈
          adv("JLSEC-2025-9998", jlsec_sources=[test_source(affected=reverse(components))])

    # Advisories without details can still be combined
    @test isnothing(SecurityAdvisories.combine(
        Advisory(id="JLSEC-2025-9998", aliases=["CVE-2025-99999"]),
        Advisory(id="JLSEC-0000-placeholder", aliases=["CVE-2025-99999"])).details)
end

using SecurityAdvisories: print_advisory_versions
@testset "version range rendering" begin
    VRN = VR{VersionNumber}
    # The component-to-package association is computed from GeneralMetadata; inject a test double
    render(adv, old=nothing; kw...) = sprint() do io
        print_advisory_versions(io, adv, old;
            packages_with_component = vp -> vp == "ffmpeg:ffmpeg" ? ["FFMPEG_jll", "FFplay_jll"] : String[], kw...)
    end
    adv = Advisory(id="JLSEC-2025-9999", aliases=["CVE-2025-99999"],
        affected=[PackageVulnerability(pkg="FFMPEG_jll", ranges=[VRN("< 6.1.2+0")])],
        jlsec_sources=[test_source(affected=[UpstreamRanges(vendor_product="ffmpeg:ffmpeg", ranges=["< 6.1.2"])])])
    out = render(adv)
    @test contains(out, "- `JLSEC-2025-9999` (from: [CVE-2025-99999](https://example.com)) for upstream project(s):")
    @test contains(out, "- **ffmpeg:ffmpeg** (per CVE-2025-99999) at versions: `< 6.1.2`")
    @test contains(out, "- mapping to packages:")
    @test contains(out, "- **FFMPEG_jll** at versions: `< 6.1.2+0`")

    # Changes against a prior version of the advisory are annotated
    old = SecurityAdvisories.to_toml_frontmatter(adv)
    adv.affected = [PackageVulnerability(pkg="FFMPEG_jll", ranges=[VRN("< 6.1.3+0")]),
                    PackageVulnerability(pkg="FFplay_jll", ranges=[VRN("< 7.1.0+0")])]
    out = render(adv, old)
    @test contains(out, "- **FFMPEG_jll** at versions: `< 6.1.3+0` (was: `< 6.1.2+0`)")
    @test contains(out, "- **FFplay_jll** at versions: `< 7.1.0+0` (newly listed)")

    # Components that map to none of the listed packages are not shown
    adv.jlsec_sources = [test_source(affected=[UpstreamRanges(vendor_product="ffmpeg:ffmpeg", ranges=["< 6.1.2"]),
                                               UpstreamRanges(vendor_product="other:lib", ranges=["< 9.9"])])]
    @test !contains(render(adv), "other:lib")
    # ... and an advisory whose components all map elsewhere renders as a plain package list
    adv.jlsec_sources = [test_source(affected=[UpstreamRanges(vendor_product="other:lib", ranges=["< 9.9"])])]
    @test contains(render(adv), "for packages:\n    - **FFMPEG_jll**")

    # When several sources list components, only the one whose data was used is shown
    adv.jlsec_sources = [test_source(affected=[UpstreamRanges(vendor_product="ffmpeg:ffmpeg", ranges=["< 6.1.2"])]),
                         test_source(id="EUVD-2025-1", affected=[UpstreamRanges(vendor_product="ffmpeg:ffmpeg", ranges=["< 6.1"])])]
    out = render(adv; pick_used = _ -> "CVE-2025-99999")
    @test contains(out, "(per CVE-2025-99999)") && !contains(out, "(per EUVD-2025-1)")
    # ... unless we cannot tell whose it was, in which case all are shown
    out = render(adv; pick_used = _ -> nothing)
    @test contains(out, "(per CVE-2025-99999)") && contains(out, "(per EUVD-2025-1)")

    # Component ranges that fail to parse are called out; they are where "*" ranges come from
    adv.jlsec_sources = [test_source(affected=[UpstreamRanges(vendor_product="ffmpeg:ffmpeg", ranges=["not a version range"])])]
    @test contains(render(adv), "⚠ could not parse `not a version range`")

    # Advisories without upstream components render a flat package list
    alias = Advisory(id="JLSEC-2025-9999", aliases=["CVE-2025-99999"],
        affected=[PackageVulnerability(pkg="HTTP", ranges=[VRN("< 1.10.17")])], jlsec_sources=[test_source()])
    @test contains(render(alias), "for packages:\n    - **HTTP** at versions: `< 1.10.17`")

    # Hand-authored advisories may have no sources at all
    unsourced = Advisory(id="JLSEC-2025-9999", aliases=["CVE-2025-99999"],
        affected=[PackageVulnerability(pkg="HTTP", ranges=[VRN("< 1.10.17")])])
    @test contains(render(unsourced), "- `JLSEC-2025-9999` for packages:")
    @test !contains(render(unsourced), "(from:")
end

using JSON3: JSON3
@testset "sometimes EUVD has no description" begin
    vuln = JSON3.read(joinpath(@__DIR__, "EUVD-2025-32379.json"))
    @test EUVD.advisory(vuln) isa SecurityAdvisories.Advisory
    @test startswith(sprint(print, EUVD.advisory(vuln)), "```toml")
    @test contains(sprint(print, EUVD.advisory(vuln)), "id = \"EUVD-2025-32379\"")
end

@testset "sometimes EUVD has terrible product information" begin
    vuln = JSON3.read(joinpath(@__DIR__, "EUVD-2023-33066.json"))
    vpv = EUVD.vendor_product_versions(vuln)
    @test length(vpv) == 3
    @test vpv == [("Fedora", "", "")
                  ("Red Hat", "", "")
                  ("n/a", "", "")]
end

@testset "rejected advisories" begin
    using SecurityAdvisories: find_rejected, strip_rejected!
    mktempdir() do dir
        path = joinpath(dir, "rejected.toml")
        write(path, """
        [CVE-2000-12345]
        aliases = ["GHSA-xxxx-yyyy-zzzz"]
        packages = ["Example_jll"]
        reason = "It doesn't apply because of reasons."

        [CVE-2001-0001]
        reason = "Nothing about this one applies at all."
        """)
        advisory(ids, affected...) = SecurityAdvisories.Advisory(; upstream=ids, affected=collect(affected))
        vuln(pkg, rngs...) = SecurityAdvisories.PackageVulnerability(; pkg, ranges=[VR{VersionNumber}(r) for r in rngs])
        stripped(a) = SecurityAdvisories.vulnerable_packages(strip_rejected!(a; path))
        # Unrelated ids are untouched
        @test isnothing(find_rejected(["CVE-1999-0001"]; path))
        @test stripped(advisory(["CVE-1999-0001"], vuln("Example_jll", "*"))) == ["Example_jll"]
        # The key and any alias match, including repo-scoped GHSA ids
        @test first(something(find_rejected(["CVE-2000-12345"]; path))) == "CVE-2000-12345"
        @test first(something(find_rejected(["Example/Example.jl/GHSA-xxxx-yyyy-zzzz"]; path))) == "CVE-2000-12345"
        # A rejected package assessment is stripped...
        @test isempty(stripped(advisory(["CVE-2000-12345"], vuln("Example_jll", "*"))))
        # ...while unlisted packages are kept — a package-scoped rejection
        @test stripped(advisory(["CVE-2000-12345"], vuln("Example_jll", "*"), vuln("Other_jll", "*"))) == ["Other_jll"]
        # An entry without a packages field rejects everything
        @test isempty(stripped(advisory(["CVE-2001-0001"], vuln("A_jll", "*"), vuln("B_jll", "< 1.0.0"))))
    end
end

@testset "advisories/rejected.toml validation" begin
    seen = Set{String}()
    for (id, entry) in SecurityAdvisories.rejected_advisories()
        # Only known fields (this catches typos that would silently not apply)
        @test entry isa Dict && issubset(keys(entry), ["aliases", "packages", "reason"])
        for i in SecurityAdvisories.unscoped_id.([id; get(entry, "aliases", String[])])
            # Each id may only be rejected once
            @test i ∉ seen
            push!(seen, i)
        end
    end
    # A rejection may only coexist with a published advisory if it's package-scoped, and then
    # the two must not disagree about the packages it rejects
    for (root, _, files) in walkdir(joinpath(@__DIR__, "..", "advisories", "published")), file in files
        SecurityAdvisories.is_jlsec_advisory_path(joinpath(root, file)) || continue
        adv = SecurityAdvisories.parsefile(joinpath(root, file))
        rejection = SecurityAdvisories.find_rejected(adv)
        isnothing(rejection) && continue
        entry = last(rejection)
        @test haskey(entry, "packages") && isempty(intersect(SecurityAdvisories.vulnerable_packages(adv), entry["packages"]))
    end
end
