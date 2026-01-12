```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubut-1a4r4tb"
modified = 2025-11-25T22:35:59.237Z
upstream = ["CVE-2016-9559"]
references = ["http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/11/19/7", "http://www.openwall.com/lists/oss-security/2016/11/23/4", "http://www.securityfocus.com/bid/94489", "https://blogs.gentoo.org/ago/2016/11/19/imagemagick-null-pointer-must-never-be-null-tiff-c/", "https://github.com/ImageMagick/ImageMagick/commit/b61d35eaccc0a7ddeff8a1c3abfcd0a43ccf210b", "https://github.com/ImageMagick/ImageMagick/issues/298", "http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/11/19/7", "http://www.openwall.com/lists/oss-security/2016/11/23/4", "http://www.securityfocus.com/bid/94489", "https://blogs.gentoo.org/ago/2016/11/19/imagemagick-null-pointer-must-never-be-null-tiff-c/", "https://github.com/ImageMagick/ImageMagick/commit/b61d35eaccc0a7ddeff8a1c3abfcd0a43ccf210b", "https://github.com/ImageMagick/ImageMagick/issues/298"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-9559"
imported = 2025-11-25T22:35:59.237Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-01T15:59:00.383Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-9559"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-9559"
```

# coders/tiff.c in ImageMagick before 7.0.3.7 allows remote attackers to cause a denial of service (NU...

coders/tiff.c in ImageMagick before 7.0.3.7 allows remote attackers to cause a denial of service (NULL pointer dereference and crash) via a crafted image.

