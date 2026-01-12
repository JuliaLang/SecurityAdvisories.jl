```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5k-1ta0"
modified = 2025-11-25T22:35:59.624Z
upstream = ["CVE-2016-7518"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93130", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533447", "https://bugzilla.redhat.com/show_bug.cgi?id=1378745", "https://github.com/ImageMagick/ImageMagick/issues/81", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93130", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533447", "https://bugzilla.redhat.com/show_bug.cgi?id=1378745", "https://github.com/ImageMagick/ImageMagick/issues/81"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7518"
imported = 2025-11-25T22:35:59.624Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.013Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7518"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7518"
```

# The ReadSUNImage function in coders/sun.c in ImageMagick allows remote attackers to cause a denial o...

The ReadSUNImage function in coders/sun.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted SUN file.

