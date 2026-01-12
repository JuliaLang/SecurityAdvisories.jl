```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc6q-6vancm"
modified = 2025-11-25T22:35:59.666Z
upstream = ["CVE-2017-11352"]
references = ["http://www.securityfocus.com/bid/99600", "https://bugs.debian.org/868469", "https://github.com/ImageMagick/ImageMagick/issues/502", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4040", "http://www.securityfocus.com/bid/99600", "https://bugs.debian.org/868469", "https://github.com/ImageMagick/ImageMagick/issues/502", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4040"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11352"
imported = 2025-11-25T22:35:59.666Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-17T13:18:21.267Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11352"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11352"
```

# In ImageMagick before 7.0.5-10, a crafted RLE image can trigger a crash because of incorrect EOF han...

In ImageMagick before 7.0.5-10, a crafted RLE image can trigger a crash because of incorrect EOF handling in coders/rle.c. NOTE: this vulnerability exists because of an incomplete fix for CVE-2017-9144.

