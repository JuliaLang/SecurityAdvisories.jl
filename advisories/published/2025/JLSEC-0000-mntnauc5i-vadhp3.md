```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5i-vadhp3"
modified = 2025-11-25T22:35:59.622Z
upstream = ["CVE-2016-7516"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93129", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533452", "https://bugzilla.redhat.com/show_bug.cgi?id=1378743", "https://github.com/ImageMagick/ImageMagick/issues/77", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93129", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533452", "https://bugzilla.redhat.com/show_bug.cgi?id=1378743", "https://github.com/ImageMagick/ImageMagick/issues/77"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7516"
imported = 2025-11-25T22:35:59.622Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.937Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7516"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7516"
```

# The ReadVIFFImage function in coders/viff.c in ImageMagick allows remote attackers to cause a denial...

The ReadVIFFImage function in coders/viff.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted VIFF file.

