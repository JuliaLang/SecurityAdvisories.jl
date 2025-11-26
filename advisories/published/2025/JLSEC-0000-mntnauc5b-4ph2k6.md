```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5b-4ph2k6"
modified = 2025-11-25T22:35:59.615Z
upstream = ["CVE-2016-7531"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539061", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542112", "https://bugzilla.redhat.com/show_bug.cgi?id=1378763", "https://github.com/ImageMagick/ImageMagick/issues/107", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539061", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542112", "https://bugzilla.redhat.com/show_bug.cgi?id=1378763", "https://github.com/ImageMagick/ImageMagick/issues/107"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2016-7531"
imported = 2025-11-25T22:35:59.615Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.473Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7531"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7531"
```

# MagickCore/memory.c in ImageMagick allows remote attackers to cause a denial of service (out-of-boun...

MagickCore/memory.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds write) via a crafted PDB file.

