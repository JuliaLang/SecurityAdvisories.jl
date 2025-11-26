```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx8-b6zc42"
modified = 2025-11-25T22:36:00.620Z
upstream = ["CVE-2020-27758"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894236", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894236", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27758"
imported = 2025-11-25T22:36:00.620Z
modified = 2024-11-21T05:21:46.530Z
published = 2020-12-08T22:15:18.507Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27758"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27758"
```

# A flaw was found in ImageMagick in coders/txt.c

A flaw was found in ImageMagick in coders/txt.c. An attacker who submits a crafted file that is processed by ImageMagick could trigger undefined behavior in the form of values outside the range of type `unsigned long long`. This would most likely lead to an impact to application availability, but could potentially cause other problems related to undefined behavior. This flaw affects ImageMagick versions prior to 7.0.8-68.

