```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucw9-1cu1gmc"
modified = 2025-11-25T22:36:00.585Z
upstream = ["CVE-2020-27764"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894683", "https://github.com/ImageMagick/ImageMagick6/commit/3e21bc8a58b4ae38d24c7e283837cc279f35b6a5", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894683", "https://github.com/ImageMagick/ImageMagick6/commit/3e21bc8a58b4ae38d24c7e283837cc279f35b6a5", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27764"
imported = 2025-11-25T22:36:00.585Z
modified = 2024-11-21T05:21:47.390Z
published = 2020-12-03T17:15:13.037Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27764"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27764"
```

# In /MagickCore/statistic.c, there are several areas in ApplyEvaluateOperator() where a size_t cast s...

In /MagickCore/statistic.c, there are several areas in ApplyEvaluateOperator() where a size_t cast should have been a ssize_t cast, which causes out-of-range values under some circumstances when a crafted input file is processed by ImageMagick. Red Hat Product Security marked this as Low severity because although it could potentially lead to an impact to application availability, no specific impact was shown in this case. This flaw affects ImageMagick versions prior to 6.9.10-69.

