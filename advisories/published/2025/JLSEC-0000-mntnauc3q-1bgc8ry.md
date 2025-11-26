```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc3q-1bgc8ry"
modified = 2025-11-25T22:35:59.558Z
upstream = ["CVE-2017-5507"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95752", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851382", "https://github.com/ImageMagick/ImageMagick/blob/6.9.7-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.4-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/66e283e0a9c141b19fe6c4c39f4a41c0d3188ba8", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95752", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851382", "https://github.com/ImageMagick/ImageMagick/blob/6.9.7-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.4-4/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/66e283e0a9c141b19fe6c4c39f4a41c0d3188ba8", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-5507"
imported = 2025-11-25T22:35:59.558Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:01.027Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5507"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5507"
```

# Memory leak in coders/mpc.c in ImageMagick before 6.9.7-4 and 7.x before 7.0.4-4 allows remote attac...

Memory leak in coders/mpc.c in ImageMagick before 6.9.7-4 and 7.x before 7.0.4-4 allows remote attackers to cause a denial of service (memory consumption) via vectors involving a pixel cache.

