```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv4-18fsilw"
modified = 2025-11-25T22:35:59.248Z
upstream = ["CVE-2017-6497"]
references = ["http://www.securityfocus.com/bid/96594", "https://bugs.debian.org/856882", "https://github.com/ImageMagick/ImageMagick/commit/7f2dc7a1afc067d0c89f12c82bcdec0445fb1b94", "http://www.securityfocus.com/bid/96594", "https://bugs.debian.org/856882", "https://github.com/ImageMagick/ImageMagick/commit/7f2dc7a1afc067d0c89f12c82bcdec0445fb1b94"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6497"
imported = 2025-11-25T22:35:59.248Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.527Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6497"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6497"
```

# An issue was discovered in ImageMagick 6.9.7

An issue was discovered in ImageMagick 6.9.7. A specially crafted psd file could lead to a NULL pointer dereference (thus, a DoS).

