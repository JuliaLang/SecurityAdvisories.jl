```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyx-17c6n97"
modified = 2025-11-25T22:35:59.385Z
upstream = ["CVE-2016-10145"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95749", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851483", "https://github.com/ImageMagick/ImageMagick/commit/d23beebe7b1179fb75db1e85fbca3100e49593d9", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95749", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851483", "https://github.com/ImageMagick/ImageMagick/commit/d23beebe7b1179fb75db1e85fbca3100e49593d9", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10145"
imported = 2025-11-25T22:35:59.385Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:00.433Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10145"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10145"
```

# Off-by-one error in coders/wpg.c in ImageMagick allows remote attackers to have unspecified impact v...

Off-by-one error in coders/wpg.c in ImageMagick allows remote attackers to have unspecified impact via vectors related to a string copy.

