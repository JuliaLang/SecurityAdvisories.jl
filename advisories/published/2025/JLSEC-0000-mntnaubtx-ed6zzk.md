```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubtx-ed6zzk"
modified = 2025-11-25T22:35:59.205Z
upstream = ["CVE-2016-6491"]
references = ["http://www.openwall.com/lists/oss-security/2016/07/28/13", "http://www.openwall.com/lists/oss-security/2016/07/28/15", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/92186", "http://www.securitytracker.com/id/1036501", "https://github.com/ImageMagick/ImageMagick/blob/6.9.5-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/dd84447b63a71fa8c3f47071b09454efc667767b", "https://security.gentoo.org/glsa/201611-21", "http://www.openwall.com/lists/oss-security/2016/07/28/13", "http://www.openwall.com/lists/oss-security/2016/07/28/15", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/92186", "http://www.securitytracker.com/id/1036501", "https://github.com/ImageMagick/ImageMagick/blob/6.9.5-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/dd84447b63a71fa8c3f47071b09454efc667767b", "https://security.gentoo.org/glsa/201611-21"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-6491"
imported = 2025-11-25T22:35:59.205Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-12-13T15:59:09.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-6491"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-6491"
```

# Buffer overflow in the Get8BIMProperty function in MagickCore/property.c in ImageMagick before 6.9.5...

Buffer overflow in the Get8BIMProperty function in MagickCore/property.c in ImageMagick before 6.9.5-4 and 7.x before 7.0.2-6 allows remote attackers to cause a denial of service (out-of-bounds read, memory leak, and crash) via a crafted image.

