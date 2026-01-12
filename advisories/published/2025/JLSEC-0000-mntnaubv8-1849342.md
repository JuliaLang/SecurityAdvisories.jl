```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv8-1849342"
modified = 2025-11-25T22:35:59.252Z
upstream = ["CVE-2017-6502"]
references = ["http://www.securityfocus.com/bid/96763", "https://github.com/ImageMagick/ImageMagick/commit/126c7c98ea788241922c30df4a5633ea692cf8df", "http://www.securityfocus.com/bid/96763", "https://github.com/ImageMagick/ImageMagick/commit/126c7c98ea788241922c30df4a5633ea692cf8df"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6502"
imported = 2025-11-25T22:35:59.252Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.683Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6502"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6502"
```

# An issue was discovered in ImageMagick 6.9.7

An issue was discovered in ImageMagick 6.9.7. A specially crafted webp file could lead to a file-descriptor leak in libmagickcore (thus, a DoS).

