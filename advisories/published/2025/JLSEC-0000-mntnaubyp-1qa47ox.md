```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyp-1qa47ox"
modified = 2025-11-25T22:35:59.377Z
upstream = ["CVE-2016-10050"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95185", "https://bugzilla.redhat.com/show_bug.cgi?id=1410454", "https://github.com/ImageMagick/ImageMagick/commit/139d4323c40d7363bfdd2382c3821a6f76d69430", "https://github.com/ImageMagick/ImageMagick/commit/73fb0aac5b958521e1511e179ecc0ad49f70ebaf", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95185", "https://bugzilla.redhat.com/show_bug.cgi?id=1410454", "https://github.com/ImageMagick/ImageMagick/commit/139d4323c40d7363bfdd2382c3821a6f76d69430", "https://github.com/ImageMagick/ImageMagick/commit/73fb0aac5b958521e1511e179ecc0ad49f70ebaf"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10050"
imported = 2025-11-25T22:35:59.377Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.437Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10050"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10050"
```

# Heap-based buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick 6.9.4-8 allow...

Heap-based buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick 6.9.4-8 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted RLE file.

