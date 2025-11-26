```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwe-zhag3q"
modified = 2025-11-25T22:36:00.590Z
upstream = ["CVE-2020-27770"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894691", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894691", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27770"
imported = 2025-11-25T22:36:00.590Z
modified = 2024-11-21T05:21:48.180Z
published = 2020-12-04T15:15:10.707Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27770"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27770"
```

# Due to a missing check for 0 value of `replace_extent`, it is possible for offset `p` to overflow in...

Due to a missing check for 0 value of `replace_extent`, it is possible for offset `p` to overflow in SubstituteString(), causing potential impact to application availability. This could be triggered by a crafted input file that is processed by ImageMagick. This flaw affects ImageMagick versions prior to 7.0.8-68.

