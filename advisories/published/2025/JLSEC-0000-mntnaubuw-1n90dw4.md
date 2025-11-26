```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuw-1n90dw4"
modified = 2025-11-25T22:35:59.240Z
upstream = ["CVE-2016-10063"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95210", "https://bugzilla.redhat.com/show_bug.cgi?id=1410476", "https://github.com/ImageMagick/ImageMagick/commit/2bb6941a2d557f26a2f2049ade466e118eeaab91", "https://github.com/ImageMagick/ImageMagick/commit/94936efda8aa63563211eda07a5ade92abb32f7a", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95210", "https://bugzilla.redhat.com/show_bug.cgi?id=1410476", "https://github.com/ImageMagick/ImageMagick/commit/2bb6941a2d557f26a2f2049ade466e118eeaab91", "https://github.com/ImageMagick/ImageMagick/commit/94936efda8aa63563211eda07a5ade92abb32f7a"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10063"
imported = 2025-11-25T22:35:59.240Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.333Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10063"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10063"
```

# Buffer overflow in coders/tiff.c in ImageMagick before 6.9.5-1 allows remote attackers to cause a de...

Buffer overflow in coders/tiff.c in ImageMagick before 6.9.5-1 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file, related to extend validity.

