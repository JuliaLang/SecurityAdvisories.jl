```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyy-oupega"
modified = 2025-11-25T22:35:59.386Z
upstream = ["CVE-2016-10146"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95744", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851380", "https://github.com/ImageMagick/ImageMagick/commit/aeff00de228bc5a158c2a975ab47845d8a1db456", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95744", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851380", "https://github.com/ImageMagick/ImageMagick/commit/aeff00de228bc5a158c2a975ab47845d8a1db456", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10146"
imported = 2025-11-25T22:35:59.386Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:00.480Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10146"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10146"
```

# Multiple memory leaks in the caption and label handling code in ImageMagick allow remote attackers t...

Multiple memory leaks in the caption and label handling code in ImageMagick allow remote attackers to cause a denial of service (memory consumption) via unspecified vectors.

