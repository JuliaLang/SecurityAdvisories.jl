```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx2-1mgp6nh"
modified = 2025-11-25T22:35:59.318Z
upstream = ["CVE-2015-8896"]
references = ["http://www.openwall.com/lists/oss-security/2015/10/07/2", "http://www.openwall.com/lists/oss-security/2015/10/08/3", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91027", "https://access.redhat.com/errata/RHSA-2016:1237", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1448803", "https://github.com/ImageMagick/ImageMagick/commit/0f6fc2d5bf8f500820c3dbcf0d23ee14f2d9f734", "http://www.openwall.com/lists/oss-security/2015/10/07/2", "http://www.openwall.com/lists/oss-security/2015/10/08/3", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91027", "https://access.redhat.com/errata/RHSA-2016:1237", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1448803", "https://github.com/ImageMagick/ImageMagick/commit/0f6fc2d5bf8f500820c3dbcf0d23ee14f2d9f734"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8896"
imported = 2025-11-25T22:35:59.318Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-15T19:59:00.237Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8896"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8896"
```

# Integer truncation issue in coders/pict.c in ImageMagick before 7.0.5-0 allows remote attackers to c...

Integer truncation issue in coders/pict.c in ImageMagick before 7.0.5-0 allows remote attackers to cause a denial of service (application crash) via a crafted .pict file.

