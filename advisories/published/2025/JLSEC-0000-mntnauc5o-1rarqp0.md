```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5o-1rarqp0"
modified = 2025-11-25T22:35:59.628Z
upstream = ["CVE-2016-7527"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93220", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542115", "https://bugzilla.redhat.com/show_bug.cgi?id=1378759", "https://github.com/ImageMagick/ImageMagick/commit/a251039393f423c7858e63cab6aa98d17b8b7a41", "https://github.com/ImageMagick/ImageMagick/commit/b3dd69b23e9338806891c708a0cc8a82c0d1872a", "https://github.com/ImageMagick/ImageMagick/issues/122", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93220", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542115", "https://bugzilla.redhat.com/show_bug.cgi?id=1378759", "https://github.com/ImageMagick/ImageMagick/commit/a251039393f423c7858e63cab6aa98d17b8b7a41", "https://github.com/ImageMagick/ImageMagick/commit/b3dd69b23e9338806891c708a0cc8a82c0d1872a", "https://github.com/ImageMagick/ImageMagick/issues/122"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7527"
imported = 2025-11-25T22:35:59.628Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7527"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7527"
```

# coders/wpg.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read...

coders/wpg.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted file.

