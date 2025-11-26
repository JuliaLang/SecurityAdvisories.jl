```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxh-t5y2p2"
modified = 2025-11-25T22:36:00.629Z
upstream = ["CVE-2021-20309"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1946722", "https://lists.debian.org/debian-lts-announce/2021/06/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1946722", "https://lists.debian.org/debian-lts-announce/2021/06/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.13025+0"]

[[jlsec_sources]]
id = "CVE-2021-20309"
imported = 2025-11-25T22:36:00.629Z
modified = 2024-11-21T05:46:20.823Z
published = 2021-05-11T23:15:08.720Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20309"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20309"
```

# A flaw was found in ImageMagick in versions before 7.0.11 and before 6.9.12, where a division by zer...

A flaw was found in ImageMagick in versions before 7.0.11 and before 6.9.12, where a division by zero in WaveImage() of MagickCore/visual-effects.c may trigger undefined behavior via a crafted image file submitted to an application using ImageMagick. The highest threat from this vulnerability is to system availability.

