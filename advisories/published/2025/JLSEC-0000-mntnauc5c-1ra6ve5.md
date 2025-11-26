```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5c-1ra6ve5"
modified = 2025-11-25T22:35:59.616Z
upstream = ["CVE-2016-7533"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542114", "https://bugzilla.redhat.com/show_bug.cgi?id=1378765", "https://github.com/ImageMagick/ImageMagick/commit/bef1e4f637d8f665bc133a9c6d30df08d983bc3a", "https://github.com/ImageMagick/ImageMagick/issues/120", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542114", "https://bugzilla.redhat.com/show_bug.cgi?id=1378765", "https://github.com/ImageMagick/ImageMagick/commit/bef1e4f637d8f665bc133a9c6d30df08d983bc3a", "https://github.com/ImageMagick/ImageMagick/issues/120"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7533"
imported = 2025-11-25T22:35:59.616Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.520Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7533"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7533"
```

# The ReadWPGImage function in coders/wpg.c in ImageMagick allows remote attackers to cause a denial o...

The ReadWPGImage function in coders/wpg.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted WPG file.

