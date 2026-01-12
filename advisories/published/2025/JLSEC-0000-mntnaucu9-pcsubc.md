```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucu9-pcsubc"
modified = 2025-11-25T22:36:00.513Z
upstream = ["CVE-2019-7396"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://www.securityfocus.com/bid/106849", "https://github.com/ImageMagick/ImageMagick/commit/748a03651e5b138bcaf160d15133de2f4b1b89ce", "https://github.com/ImageMagick/ImageMagick/issues/1452", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://www.securityfocus.com/bid/106849", "https://github.com/ImageMagick/ImageMagick/commit/748a03651e5b138bcaf160d15133de2f4b1b89ce", "https://github.com/ImageMagick/ImageMagick/issues/1452", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-7396"
imported = 2025-11-25T22:36:00.513Z
modified = 2024-11-21T04:48:08.690Z
published = 2019-02-05T00:29:00.447Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7396"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7396"
```

# In ImageMagick before 7.0.8-25, a memory leak exists in ReadSIXELImage in coders/sixel.c.

In ImageMagick before 7.0.8-25, a memory leak exists in ReadSIXELImage in coders/sixel.c.

