```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc59-1ixbi1r"
modified = 2025-11-25T22:35:59.613Z
upstream = ["CVE-2016-7522"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537419", "https://bugzilla.redhat.com/show_bug.cgi?id=1378751", "https://github.com/ImageMagick/ImageMagick/commit/4b1b9c0522628887195bad3a6723f7000b0c9a58", "https://github.com/ImageMagick/ImageMagick/issues/93", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537419", "https://bugzilla.redhat.com/show_bug.cgi?id=1378751", "https://github.com/ImageMagick/ImageMagick/commit/4b1b9c0522628887195bad3a6723f7000b0c9a58", "https://github.com/ImageMagick/ImageMagick/issues/93"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7522"
imported = 2025-11-25T22:35:59.613Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.367Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7522"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7522"
```

# The ReadPSDImage function in MagickCore/locale.c in ImageMagick allows remote attackers to cause a d...

The ReadPSDImage function in MagickCore/locale.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PSD file.

