```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5q-1g08ek2"
modified = 2025-11-25T22:35:59.630Z
upstream = ["CVE-2016-7534"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542785", "https://bugzilla.redhat.com/show_bug.cgi?id=1378767", "https://github.com/ImageMagick/ImageMagick/commit/430403b0029b37decf216d57f810899cab2317dd", "https://github.com/ImageMagick/ImageMagick/issues/126", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1542785", "https://bugzilla.redhat.com/show_bug.cgi?id=1378767", "https://github.com/ImageMagick/ImageMagick/commit/430403b0029b37decf216d57f810899cab2317dd", "https://github.com/ImageMagick/ImageMagick/issues/126"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7534"
imported = 2025-11-25T22:35:59.630Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.357Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7534"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7534"
```

# The generic decoder in ImageMagick allows remote attackers to cause a denial of service (out-of-boun...

The generic decoder in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds access) via a crafted file.

