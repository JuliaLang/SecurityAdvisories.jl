```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf742-1877tzp"
modified = 2026-03-31T14:42:50.690Z
upstream = ["CVE-2018-6952"]
references = ["http://www.securityfocus.com/bid/103047", "https://access.redhat.com/errata/RHSA-2019:2033", "https://savannah.gnu.org/bugs/index.php?53133", "https://security.gentoo.org/glsa/201904-17", "http://www.securityfocus.com/bid/103047", "https://access.redhat.com/errata/RHSA-2019:2033", "https://savannah.gnu.org/bugs/index.php?53133", "https://security.gentoo.org/glsa/201904-17"]

[[affected]]
pkg = "patch_jll"
ranges = ["< 2.8.0+0"]

[[jlsec_sources]]
id = "CVE-2018-6952"
imported = 2026-03-31T14:42:50.690Z
modified = 2024-11-21T04:11:28.420Z
published = 2018-02-13T19:29:00.573Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-6952"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-6952"
```

A double free exists in the another_hunk function in pch.c in GNU patch through 2.7.6.

