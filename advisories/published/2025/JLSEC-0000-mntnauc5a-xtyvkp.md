```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5a-xtyvkp"
modified = 2025-11-25T22:35:59.614Z
upstream = ["CVE-2016-7529"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539051", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539052", "https://bugzilla.redhat.com/show_bug.cgi?id=1378761", "https://github.com/ImageMagick/ImageMagick/commit/a2e1064f288a353bc5fef7f79ccb7683759e775c", "https://github.com/ImageMagick/ImageMagick/issues/103", "https://github.com/ImageMagick/ImageMagick/issues/104", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539051", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539052", "https://bugzilla.redhat.com/show_bug.cgi?id=1378761", "https://github.com/ImageMagick/ImageMagick/commit/a2e1064f288a353bc5fef7f79ccb7683759e775c", "https://github.com/ImageMagick/ImageMagick/issues/103", "https://github.com/ImageMagick/ImageMagick/issues/104"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7529"
imported = 2025-11-25T22:35:59.614Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.443Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7529"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7529"
```

# coders/xcf.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read...

coders/xcf.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted XCF file.

