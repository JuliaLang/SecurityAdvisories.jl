```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubu2-1qfc1rl"
modified = 2025-11-25T22:35:59.210Z
upstream = ["CVE-2016-7101"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/26/8", "http://www.securityfocus.com/bid/93181", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836776", "https://github.com/ImageMagick/ImageMagick/commit/7afcf9f71043df15508e46f079387bd4689a738d", "https://github.com/ImageMagick/ImageMagick/commit/8f8959033e4e59418d6506b345829af1f7a71127", "http://www.openwall.com/lists/oss-security/2016/09/26/8", "http://www.securityfocus.com/bid/93181", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836776", "https://github.com/ImageMagick/ImageMagick/commit/7afcf9f71043df15508e46f079387bd4689a738d", "https://github.com/ImageMagick/ImageMagick/commit/8f8959033e4e59418d6506b345829af1f7a71127"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7101"
imported = 2025-11-25T22:35:59.210Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-01-18T17:59:00.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7101"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7101"
```

# The SGI coder in ImageMagick before 7.0.2-10 allows remote attackers to cause a denial of service (o...

The SGI coder in ImageMagick before 7.0.2-10 allows remote attackers to cause a denial of service (out-of-bounds read) via a large row value in an sgi file.

