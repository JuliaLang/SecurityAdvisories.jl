```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5d-1dojumd"
modified = 2025-11-25T22:35:59.617Z
upstream = ["CVE-2016-7537"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1553366", "https://bugzilla.redhat.com/show_bug.cgi?id=1378773", "https://github.com/ImageMagick/ImageMagick/commit/424d40ebfcde48bb872eba75179d3d73704fdf1f", "https://github.com/ImageMagick/ImageMagick/commit/6d202a0514fb6a406456b8b728cde776becb25f8", "https://github.com/ImageMagick/ImageMagick/issues/143", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1553366", "https://bugzilla.redhat.com/show_bug.cgi?id=1378773", "https://github.com/ImageMagick/ImageMagick/commit/424d40ebfcde48bb872eba75179d3d73704fdf1f", "https://github.com/ImageMagick/ImageMagick/commit/6d202a0514fb6a406456b8b728cde776becb25f8", "https://github.com/ImageMagick/ImageMagick/issues/143"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7537"
imported = 2025-11-25T22:35:59.617Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.553Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7537"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7537"
```

# MagickCore/memory.c in ImageMagick allows remote attackers to cause a denial of service (out-of-boun...

MagickCore/memory.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds access) via a crafted PDB file.

