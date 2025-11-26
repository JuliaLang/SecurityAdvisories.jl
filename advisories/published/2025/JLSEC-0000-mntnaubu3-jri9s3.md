```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubu3-jri9s3"
modified = 2025-11-25T22:35:59.211Z
upstream = ["CVE-2016-7799"]
references = ["http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/01/4", "http://www.openwall.com/lists/oss-security/2016/10/01/6", "http://www.securityfocus.com/bid/93264", "https://github.com/ImageMagick/ImageMagick/commit/a7bb158b7bedd1449a34432feb3a67c8f1873bfa", "https://github.com/ImageMagick/ImageMagick/issues/280", "https://security.gentoo.org/glsa/201611-21", "http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/01/4", "http://www.openwall.com/lists/oss-security/2016/10/01/6", "http://www.securityfocus.com/bid/93264", "https://github.com/ImageMagick/ImageMagick/commit/a7bb158b7bedd1449a34432feb3a67c8f1873bfa", "https://github.com/ImageMagick/ImageMagick/issues/280", "https://security.gentoo.org/glsa/201611-21"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7799"
imported = 2025-11-25T22:35:59.211Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-01-18T17:59:00.730Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7799"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7799"
```

# MagickCore/profile.c in ImageMagick before 7.0.3-2 allows remote attackers to cause a denial of serv...

MagickCore/profile.c in ImageMagick before 7.0.3-2 allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted file.

