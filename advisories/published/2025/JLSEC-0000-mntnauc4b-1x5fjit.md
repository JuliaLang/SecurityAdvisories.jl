```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4b-1x5fjit"
modified = 2025-11-25T22:35:59.579Z
upstream = ["CVE-2017-5509"]
references = ["http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95751", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851377", "https://github.com/ImageMagick/ImageMagick/commit/37a1710e2dab6ed91128ea648d654a22fbe2a6af", "https://github.com/ImageMagick/ImageMagick/commit/d4ec73f866a7c42a2e7f301fcd696e5cb7a7d3ab", "https://github.com/ImageMagick/ImageMagick/issues/350", "https://security.gentoo.org/glsa/201702-09", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95751", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851377", "https://github.com/ImageMagick/ImageMagick/commit/37a1710e2dab6ed91128ea648d654a22fbe2a6af", "https://github.com/ImageMagick/ImageMagick/commit/d4ec73f866a7c42a2e7f301fcd696e5cb7a7d3ab", "https://github.com/ImageMagick/ImageMagick/issues/350", "https://security.gentoo.org/glsa/201702-09"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-5509"
imported = 2025-11-25T22:35:59.579Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:01.123Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5509"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5509"
```

# coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted PSD fil...

coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted PSD file, which triggers an out-of-bounds write.

