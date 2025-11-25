```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc58-s5coyu"
modified = 2025-11-25T22:35:59.612Z
upstream = ["CVE-2016-7519"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533445", "https://bugzilla.redhat.com/show_bug.cgi?id=1378746", "https://github.com/ImageMagick/ImageMagick/issues/82", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533445", "https://bugzilla.redhat.com/show_bug.cgi?id=1378746", "https://github.com/ImageMagick/ImageMagick/issues/82"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7519"
imported = 2025-11-25T22:35:59.612Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.317Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7519"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7519"
```

# The ReadRLEImage function in coders/rle.c in ImageMagick allows remote attackers to cause a denial o...

The ReadRLEImage function in coders/rle.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted file.

