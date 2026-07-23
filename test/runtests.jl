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

    matches = SecurityAdvisories.affected_julia_packages(desc, vpv)
    @test "julia" ∉ (x->x.pkg).(matches)
    @test "OpenBLAS_jll" in (x->x.pkg).(matches)
    @test "OpenBLAS32_jll" in (x->x.pkg).(matches)
    @test "OpenBLASHighCoreCount_jll" in (x->x.pkg).(matches)

    @test only(matches[(x->x.pkg).(matches) .== "OpenBLASHighCoreCount_jll"]).ranges == [SecurityAdvisories.VersionRange{VersionNumber}("*")]
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

using SecurityAdvisories: Advisory, PackageVulnerability, VersionString, recipe_update_candidates
using DataStructures: OrderedDict
@testset "recipe update candidates" begin
    unbounded = [VR{VersionNumber}(">= 1.0.0")]
    bounded = [VR{VersionNumber}(">= 1.0.0, < 2.0.0")]
    mapping(versions...) = Dict("vendor:product" => OrderedDict(v => [VR{VersionNumber}("*")] for v in versions))
    jll(; kw...) = Advisory(affected=[PackageVulnerability(; pkg="Zstd_jll", ranges=unbounded, source_type="upstream", kw...)])

    # An unbounded JLL whose upstream fix version is known (an exclusive upper bound) is actionable
    @test recipe_update_candidates(jll(source_mapping=mapping("< 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    # ... using the largest fixed version across ranges, even non-semver-ish ones
    @test recipe_update_candidates(jll(source_mapping=mapping(">= 1.0.0, < 1.4.0", "< 1.5.7"))) == ["Zstd" => VersionString("1.5.7")]
    @test recipe_update_candidates(jll(source_mapping=mapping("< 4.3.2p2", "< 4.3.2p10"))) == ["Zstd" => VersionString("4.3.2p10")]

    # But not when any upstream range is inclusively bounded, unbounded, exact, or unparseable
    @test isempty(recipe_update_candidates(jll(source_mapping=mapping("<= 1.5.7"))))
    @test isempty(recipe_update_candidates(jll(source_mapping=mapping("< 1.5.7", "<= 1.5.7"))))
    @test isempty(recipe_update_candidates(jll(source_mapping=mapping("*"))))
    @test isempty(recipe_update_candidates(jll(source_mapping=mapping("= 1.5.7"))))
    @test isempty(recipe_update_candidates(jll(source_mapping=mapping("who knows"))))
    # Nor without any upstream version information at all
    @test isempty(recipe_update_candidates(jll()))
    @test isempty(recipe_update_candidates(jll(source_mapping=Dict{String,Any}())))

    # Only vulnerable-and-unbounded JLL packages are considered
    @test isempty(recipe_update_candidates(Advisory(affected=[
        PackageVulnerability(pkg="Zstd_jll", ranges=bounded, source_type="upstream", source_mapping=mapping("< 1.5.7"))])))
    @test isempty(recipe_update_candidates(Advisory(affected=[
        PackageVulnerability(pkg="Zstd_jll", ranges=VR{VersionNumber}[], source_type="upstream", source_mapping=mapping("< 1.5.7"))])))
    @test isempty(recipe_update_candidates(Advisory(affected=[
        PackageVulnerability(pkg="NotAJLL", ranges=unbounded, source_type="upstream", source_mapping=mapping("< 1.5.7"))])))
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
