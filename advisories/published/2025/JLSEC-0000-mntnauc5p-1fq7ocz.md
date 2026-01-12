```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5p-1fq7ocz"
modified = 2025-11-25T22:35:59.629Z
upstream = ["CVE-2016-7532"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539066", "https://bugzilla.redhat.com/show_bug.cgi?id=1378764", "https://github.com/ImageMagick/ImageMagick/commit/4f2c04ea6673863b87ac7f186cbb0d911f74085c", "https://github.com/ImageMagick/ImageMagick/issues/109", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1539066", "https://bugzilla.redhat.com/show_bug.cgi?id=1378764", "https://github.com/ImageMagick/ImageMagick/commit/4f2c04ea6673863b87ac7f186cbb0d911f74085c", "https://github.com/ImageMagick/ImageMagick/issues/109"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7532"
imported = 2025-11-25T22:35:59.629Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.310Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7532"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7532"
```

# coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read...

coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PSD file.

