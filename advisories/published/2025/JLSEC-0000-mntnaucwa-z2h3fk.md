```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwa-z2h3fk"
modified = 2025-11-25T22:36:00.586Z
upstream = ["CVE-2020-27765"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894684", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894684", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27765"
imported = 2025-11-25T22:36:00.586Z
modified = 2024-11-21T05:21:47.537Z
published = 2020-12-04T15:15:10.427Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27765"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27765"
```

# A flaw was found in ImageMagick in MagickCore/segment.c

A flaw was found in ImageMagick in MagickCore/segment.c. An attacker who submits a crafted file that is processed by ImageMagick could trigger undefined behavior in the form of math division by zero. This would most likely lead to an impact to application availability, but could potentially cause other problems related to undefined behavior. This flaw affects ImageMagick versions prior to 7.0.9-0.

