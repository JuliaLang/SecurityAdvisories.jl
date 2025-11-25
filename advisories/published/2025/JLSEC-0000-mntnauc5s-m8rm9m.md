```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5s-m8rm9m"
modified = 2025-11-25T22:35:59.632Z
upstream = ["CVE-2016-7538"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1556273", "https://bugzilla.redhat.com/show_bug.cgi?id=1378775", "https://github.com/ImageMagick/ImageMagick/commit/82e2049862a8b8a999e160734ad64fb6cc3b145f", "https://github.com/ImageMagick/ImageMagick/issues/148", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1556273", "https://bugzilla.redhat.com/show_bug.cgi?id=1378775", "https://github.com/ImageMagick/ImageMagick/commit/82e2049862a8b8a999e160734ad64fb6cc3b145f", "https://github.com/ImageMagick/ImageMagick/issues/148"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7538"
imported = 2025-11-25T22:35:59.632Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.483Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7538"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7538"
```

# coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds writ...

coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds write) via a crafted file.

