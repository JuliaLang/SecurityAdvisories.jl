```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucw7-oazmhf"
modified = 2025-11-25T22:36:00.583Z
upstream = ["CVE-2020-27762"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894680", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894680", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27762"
imported = 2025-11-25T22:36:00.583Z
modified = 2024-11-21T05:21:47.110Z
published = 2020-12-03T17:15:12.910Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27762"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27762"
```

# A flaw was found in ImageMagick in coders/hdr.c

A flaw was found in ImageMagick in coders/hdr.c. An attacker who submits a crafted file that is processed by ImageMagick could trigger undefined behavior in the form of values outside the range of type `unsigned char`. This would most likely lead to an impact to application availability, but could potentially cause other problems related to undefined behavior. This flaw affects ImageMagick versions prior to ImageMagick 7.0.8-68.

