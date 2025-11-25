```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv7-1mcwv13"
modified = 2025-11-25T22:35:59.251Z
upstream = ["CVE-2017-6501"]
references = ["http://www.securityfocus.com/bid/96589", "https://bugs.debian.org/856881", "https://github.com/ImageMagick/ImageMagick/commit/d31fec57e9dfb0516deead2053a856e3c71e9751", "http://www.securityfocus.com/bid/96589", "https://bugs.debian.org/856881", "https://github.com/ImageMagick/ImageMagick/commit/d31fec57e9dfb0516deead2053a856e3c71e9751"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6501"
imported = 2025-11-25T22:35:59.251Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.650Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6501"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6501"
```

# An issue was discovered in ImageMagick 6.9.7

An issue was discovered in ImageMagick 6.9.7. A specially crafted xcf file could lead to a NULL pointer dereference.

