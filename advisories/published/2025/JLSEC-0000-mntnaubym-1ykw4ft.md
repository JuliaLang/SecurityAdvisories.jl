```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubym-1ykw4ft"
modified = 2025-11-25T22:35:59.374Z
upstream = ["CVE-2016-10046"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95183", "https://bugzilla.redhat.com/show_bug.cgi?id=1410448", "https://github.com/ImageMagick/ImageMagick/commit/989f9f88ea6db09b99d25586e912c921c0da8d3f", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95183", "https://bugzilla.redhat.com/show_bug.cgi?id=1410448", "https://github.com/ImageMagick/ImageMagick/commit/989f9f88ea6db09b99d25586e912c921c0da8d3f"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10046"
imported = 2025-11-25T22:35:59.374Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.283Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10046"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10046"
```

# Heap-based buffer overflow in the DrawImage function in magick/draw.c in ImageMagick before 6.9.5-5 ...

Heap-based buffer overflow in the DrawImage function in magick/draw.c in ImageMagick before 6.9.5-5 allows remote attackers to cause a denial of service (application crash) via a crafted image file.

