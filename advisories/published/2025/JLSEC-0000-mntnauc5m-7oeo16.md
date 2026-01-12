```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5m-7oeo16"
modified = 2025-11-25T22:35:59.626Z
upstream = ["CVE-2016-7525"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537424", "https://bugzilla.redhat.com/show_bug.cgi?id=1378757", "https://github.com/ImageMagick/ImageMagick/commit/5f16640725b1225e6337c62526e6577f0f88edb8", "https://github.com/ImageMagick/ImageMagick/issues/98", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537424", "https://bugzilla.redhat.com/show_bug.cgi?id=1378757", "https://github.com/ImageMagick/ImageMagick/commit/5f16640725b1225e6337c62526e6577f0f88edb8", "https://github.com/ImageMagick/ImageMagick/issues/98"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7525"
imported = 2025-11-25T22:35:59.626Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.140Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7525"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7525"
```

# Heap-based buffer overflow in coders/psd.c in ImageMagick allows remote attackers to cause a denial ...

Heap-based buffer overflow in coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PSD file.

