```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubtm-bjc0j5"
modified = 2025-11-25T22:35:59.194Z
upstream = ["CVE-2016-5841"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/23/1", "http://www.openwall.com/lists/oss-security/2016/06/25/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91394", "https://github.com/ImageMagick/ImageMagick/commit/d8ab7f046587f2e9f734b687ba7e6e10147c294b", "https://github.com/ImageMagick/ImageMagick/commits/7.0.2-1", "http://www.openwall.com/lists/oss-security/2016/06/23/1", "http://www.openwall.com/lists/oss-security/2016/06/25/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91394", "https://github.com/ImageMagick/ImageMagick/commit/d8ab7f046587f2e9f734b687ba7e6e10147c294b", "https://github.com/ImageMagick/ImageMagick/commits/7.0.2-1"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2016-5841"
imported = 2025-11-25T22:35:59.194Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-12-13T15:59:06.607Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5841"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5841"
```

# Integer overflow in MagickCore/profile.c in ImageMagick before 7.0.2-1 allows remote attackers to ca...

Integer overflow in MagickCore/profile.c in ImageMagick before 7.0.2-1 allows remote attackers to cause a denial of service (segmentation fault) or possibly execute arbitrary code via vectors involving the offset variable.

