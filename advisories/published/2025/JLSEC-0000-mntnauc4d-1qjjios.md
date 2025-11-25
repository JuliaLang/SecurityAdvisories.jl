```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4d-1qjjios"
modified = 2025-11-25T22:35:59.581Z
upstream = ["CVE-2017-5510"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95755", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851376", "https://github.com/ImageMagick/ImageMagick/commit/91cc3f36f2ccbd485a0456bab9aebe63b635da88", "https://github.com/ImageMagick/ImageMagick/commit/e87af64b1ff1635a32d9b6162f1b0e260fb54ed9", "https://github.com/ImageMagick/ImageMagick/issues/348", "https://security.gentoo.org/glsa/201702-09", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95755", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851376", "https://github.com/ImageMagick/ImageMagick/commit/91cc3f36f2ccbd485a0456bab9aebe63b635da88", "https://github.com/ImageMagick/ImageMagick/commit/e87af64b1ff1635a32d9b6162f1b0e260fb54ed9", "https://github.com/ImageMagick/ImageMagick/issues/348", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-5510"
imported = 2025-11-25T22:35:59.581Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:01.170Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5510"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5510"
```

# coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted PSD fil...

coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted PSD file, which triggers an out-of-bounds write.

