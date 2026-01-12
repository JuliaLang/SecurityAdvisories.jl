```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx1-798vl9"
modified = 2025-11-25T22:35:59.317Z
upstream = ["CVE-2015-8895"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91025", "https://access.redhat.com/errata/RHSA-2016:1237", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1459747", "https://github.com/ImageMagick/ImageMagick/commit/0f6fc2d5bf8f500820c3dbcf0d23ee14f2d9f734", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91025", "https://access.redhat.com/errata/RHSA-2016:1237", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1459747", "https://github.com/ImageMagick/ImageMagick/commit/0f6fc2d5bf8f500820c3dbcf0d23ee14f2d9f734"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8895"
imported = 2025-11-25T22:35:59.317Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-15T19:59:00.203Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8895"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8895"
```

# Integer overflow in coders/icon.c in ImageMagick 6.9.1-3 and later allows remote attackers to cause ...

Integer overflow in coders/icon.c in ImageMagick 6.9.1-3 and later allows remote attackers to cause a denial of service (application crash) via a crafted length value, which triggers a buffer overflow.

