```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyx-1vjno0t"
modified = 2025-11-25T22:35:59.385Z
upstream = ["CVE-2016-10144"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95750", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851485", "https://github.com/ImageMagick/ImageMagick/commit/97566cf2806c0a5a86e884c96831a0c3b1ec6c20", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95750", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851485", "https://github.com/ImageMagick/ImageMagick/commit/97566cf2806c0a5a86e884c96831a0c3b1ec6c20", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10144"
imported = 2025-11-25T22:35:59.385Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:00.403Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10144"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10144"
```

# coders/ipl.c in ImageMagick allows remote attackers to have unspecific impact by leveraging a missin...

coders/ipl.c in ImageMagick allows remote attackers to have unspecific impact by leveraging a missing malloc check.

