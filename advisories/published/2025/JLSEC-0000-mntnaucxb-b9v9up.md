```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxb-b9v9up"
modified = 2025-11-25T22:36:00.623Z
upstream = ["CVE-2021-20241"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1928952", "https://github.com/ImageMagick/ImageMagick/pull/3177", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1928952", "https://github.com/ImageMagick/ImageMagick/pull/3177", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2021-20241"
imported = 2025-11-25T22:36:00.623Z
modified = 2024-11-21T05:46:11.953Z
published = 2021-03-09T18:15:14.877Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20241"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20241"
```

# A flaw was found in ImageMagick in coders/jp2.c

A flaw was found in ImageMagick in coders/jp2.c. An attacker who submits a crafted file that is processed by ImageMagick could trigger undefined behavior in the form of math division by zero. The highest threat from this vulnerability is to system availability.

