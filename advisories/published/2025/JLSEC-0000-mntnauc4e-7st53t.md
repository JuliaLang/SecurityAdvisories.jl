```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4e-7st53t"
modified = 2025-11-25T22:35:59.582Z
upstream = ["CVE-2017-5511"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95746", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851374", "https://github.com/ImageMagick/ImageMagick/commit/7d65a814ac76bd04760072c33e452371692ee790", "https://github.com/ImageMagick/ImageMagick/commit/c8c6a0f123d5e35c173125365c97e2c0fc7eca42", "https://github.com/ImageMagick/ImageMagick/issues/347", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95746", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851374", "https://github.com/ImageMagick/ImageMagick/commit/7d65a814ac76bd04760072c33e452371692ee790", "https://github.com/ImageMagick/ImageMagick/commit/c8c6a0f123d5e35c173125365c97e2c0fc7eca42", "https://github.com/ImageMagick/ImageMagick/issues/347", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-5511"
imported = 2025-11-25T22:35:59.582Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:01.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5511"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5511"
```

# coders/psd.c in ImageMagick allows remote attackers to have unspecified impact by leveraging an impr...

coders/psd.c in ImageMagick allows remote attackers to have unspecified impact by leveraging an improper cast, which triggers a heap-based buffer overflow.

