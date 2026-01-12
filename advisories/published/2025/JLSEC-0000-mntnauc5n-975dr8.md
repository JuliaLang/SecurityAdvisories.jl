```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5n-975dr8"
modified = 2025-11-25T22:35:59.627Z
upstream = ["CVE-2016-7526"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/bugs/1539050", "https://bugzilla.redhat.com/show_bug.cgi?id=1378758", "https://github.com/ImageMagick/ImageMagick/commit/998c687fb83993c13fa711d75f59a95b38ceab77", "https://github.com/ImageMagick/ImageMagick/commit/b60d1ed0af37c50b91a40937825b4c61e8458095", "https://github.com/ImageMagick/ImageMagick/commit/b6ae2f9e0ab13343c0281732d479757a8e8979c7", "https://github.com/ImageMagick/ImageMagick/commit/d9b2209a69ee90d8df81fb124eb66f593eb9f599", "https://github.com/ImageMagick/ImageMagick/issues/102", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/bugs/1539050", "https://bugzilla.redhat.com/show_bug.cgi?id=1378758", "https://github.com/ImageMagick/ImageMagick/commit/998c687fb83993c13fa711d75f59a95b38ceab77", "https://github.com/ImageMagick/ImageMagick/commit/b60d1ed0af37c50b91a40937825b4c61e8458095", "https://github.com/ImageMagick/ImageMagick/commit/b6ae2f9e0ab13343c0281732d479757a8e8979c7", "https://github.com/ImageMagick/ImageMagick/commit/d9b2209a69ee90d8df81fb124eb66f593eb9f599", "https://github.com/ImageMagick/ImageMagick/issues/102"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7526"
imported = 2025-11-25T22:35:59.627Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.187Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7526"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7526"
```

# coders/wpg.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds writ...

coders/wpg.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds write) via a crafted file.

