```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5l-wz9cwf"
modified = 2025-11-25T22:35:59.625Z
upstream = ["CVE-2016-7521"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537418", "https://bugzilla.redhat.com/show_bug.cgi?id=1378748", "https://github.com/ImageMagick/ImageMagick/commit/30eec879c8b446b0ea9a3bb0da1a441cc8482bc4", "https://github.com/ImageMagick/ImageMagick/issues/92", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537418", "https://bugzilla.redhat.com/show_bug.cgi?id=1378748", "https://github.com/ImageMagick/ImageMagick/commit/30eec879c8b446b0ea9a3bb0da1a441cc8482bc4", "https://github.com/ImageMagick/ImageMagick/issues/92"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7521"
imported = 2025-11-25T22:35:59.625Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.093Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7521"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7521"
```

# Heap-based buffer overflow in coders/psd.c in ImageMagick allows remote attackers to cause a denial ...

Heap-based buffer overflow in coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PSD file.

