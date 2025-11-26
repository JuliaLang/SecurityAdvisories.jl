```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv6-r5urib"
modified = 2025-11-25T22:35:59.250Z
upstream = ["CVE-2017-6500"]
references = ["http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96592", "https://bugs.debian.org/856879", "https://github.com/ImageMagick/ImageMagick/commit/3007531bfd326c5c1e29cd41d2cd80c166de8528", "https://github.com/ImageMagick/ImageMagick/issues/375", "https://github.com/ImageMagick/ImageMagick/issues/376", "http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96592", "https://bugs.debian.org/856879", "https://github.com/ImageMagick/ImageMagick/commit/3007531bfd326c5c1e29cd41d2cd80c166de8528", "https://github.com/ImageMagick/ImageMagick/issues/375", "https://github.com/ImageMagick/ImageMagick/issues/376"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6500"
imported = 2025-11-25T22:35:59.250Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.620Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6500"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6500"
```

# An issue was discovered in ImageMagick 6.9.7

An issue was discovered in ImageMagick 6.9.7. A specially crafted sun file triggers a heap-based buffer over-read.

