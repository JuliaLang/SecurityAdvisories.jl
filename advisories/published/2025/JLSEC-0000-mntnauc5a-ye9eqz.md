```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5a-ye9eqz"
modified = 2025-11-25T22:35:59.614Z
upstream = ["CVE-2016-7528"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93226", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537425", "https://bugzilla.redhat.com/show_bug.cgi?id=1378760", "https://github.com/ImageMagick/ImageMagick/commit/7be16a280014f895a951db4948df316a23dabc09", "https://github.com/ImageMagick/ImageMagick/commit/ca0c886abd6d3ef335eb74150cd23b89ebd17135", "https://github.com/ImageMagick/ImageMagick/issues/99", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93226", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537425", "https://bugzilla.redhat.com/show_bug.cgi?id=1378760", "https://github.com/ImageMagick/ImageMagick/commit/7be16a280014f895a951db4948df316a23dabc09", "https://github.com/ImageMagick/ImageMagick/commit/ca0c886abd6d3ef335eb74150cd23b89ebd17135", "https://github.com/ImageMagick/ImageMagick/issues/99"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7528"
imported = 2025-11-25T22:35:59.614Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-19T14:59:00.397Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7528"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7528"
```

# The ReadVIFFImage function in coders/viff.c in ImageMagick allows remote attackers to cause a denial...

The ReadVIFFImage function in coders/viff.c in ImageMagick allows remote attackers to cause a denial of service (segmentation fault) via a crafted VIFF file.

