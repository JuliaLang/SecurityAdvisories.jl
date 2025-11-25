```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5j-rci8v0"
modified = 2025-11-25T22:35:59.623Z
upstream = ["CVE-2016-7517"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93128", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533449", "https://bugzilla.redhat.com/show_bug.cgi?id=1378744", "https://github.com/ImageMagick/ImageMagick/issues/80", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93128", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533449", "https://bugzilla.redhat.com/show_bug.cgi?id=1378744", "https://github.com/ImageMagick/ImageMagick/issues/80"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7517"
imported = 2025-11-25T22:35:59.623Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.967Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7517"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7517"
```

# The EncodeImage function in coders/pict.c in ImageMagick allows remote attackers to cause a denial o...

The EncodeImage function in coders/pict.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PICT file.

