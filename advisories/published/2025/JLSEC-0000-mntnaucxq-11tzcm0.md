```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxq-11tzcm0"
modified = 2025-11-25T22:36:00.638Z
upstream = ["CVE-2021-4219"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2054611", "https://bugzilla.redhat.com/show_bug.cgi?id=2054611"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2021-4219"
imported = 2025-11-25T22:36:00.638Z
modified = 2024-11-21T06:37:10.617Z
published = 2022-03-23T20:15:10.257Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-4219"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-4219"
```

# A flaw was found in ImageMagick

A flaw was found in ImageMagick. The vulnerability occurs due to improper use of open functions and leads to a denial of service. This flaw allows an attacker to crash the system.

