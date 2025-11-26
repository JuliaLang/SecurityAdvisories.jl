```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5l-1aro2hc"
modified = 2025-11-25T22:35:59.625Z
upstream = ["CVE-2016-7520"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537213", "https://bugzilla.redhat.com/show_bug.cgi?id=1378747", "https://github.com/ImageMagick/ImageMagick/commit/14e606db148d6ebcaae20f1e1d6d71903ca4a556", "https://github.com/ImageMagick/ImageMagick/issues/90", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537213", "https://bugzilla.redhat.com/show_bug.cgi?id=1378747", "https://github.com/ImageMagick/ImageMagick/commit/14e606db148d6ebcaae20f1e1d6d71903ca4a556", "https://github.com/ImageMagick/ImageMagick/issues/90"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7520"
imported = 2025-11-25T22:35:59.625Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7520"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7520"
```

# Heap-based buffer overflow in coders/hdr.c in ImageMagick allows remote attackers to cause a denial ...

Heap-based buffer overflow in coders/hdr.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted HDR file.

