```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4a-v80kis"
modified = 2025-11-25T22:35:59.578Z
upstream = ["CVE-2017-5508"]
references = ["http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95748", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851381", "https://github.com/ImageMagick/ImageMagick/blob/6.9.7-3/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.4-3/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/c073a7712d82476b5fbee74856c46b88af9c3175", "https://security.gentoo.org/glsa/201702-09", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31161", "http://www.debian.org/security/2017/dsa-3799", "http://www.openwall.com/lists/oss-security/2017/01/16/6", "http://www.openwall.com/lists/oss-security/2017/01/17/5", "http://www.securityfocus.com/bid/95748", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851381", "https://github.com/ImageMagick/ImageMagick/blob/6.9.7-3/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.4-3/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/c073a7712d82476b5fbee74856c46b88af9c3175", "https://security.gentoo.org/glsa/201702-09", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31161"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-5508"
imported = 2025-11-25T22:35:59.578Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-24T15:59:01.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-5508"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-5508"
```

# Heap-based buffer overflow in the PushQuantumPixel function in ImageMagick before 6.9.7-3 and 7.x be...

Heap-based buffer overflow in the PushQuantumPixel function in ImageMagick before 6.9.7-3 and 7.x before 7.0.4-3 allows remote attackers to cause a denial of service (application crash) via a crafted TIFF file.

