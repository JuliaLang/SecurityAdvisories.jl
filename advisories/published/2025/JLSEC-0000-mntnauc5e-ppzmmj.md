```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5e-ppzmmj"
modified = 2025-11-25T22:35:59.618Z
upstream = ["CVE-2015-8958"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26857", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93124", "https://bugzilla.redhat.com/show_bug.cgi?id=1378736", "https://github.com/ImageMagick/ImageMagick/commit/1aa0c6dab6dcef4d9bc3571866ae1c1ddbec7d8f", "https://github.com/ImageMagick/ImageMagick/commit/6b4aff0f117b978502ee5bcd6e753c17aec5a961", "https://github.com/ImageMagick/ImageMagick/commit/8ea44b48a182dd46d018f4b4f09a5e2ee9638105", "https://github.com/ImageMagick/ImageMagick/commit/b8f17d08b7418204bf8a05a5c24e87b2fc395b75", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26857", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93124", "https://bugzilla.redhat.com/show_bug.cgi?id=1378736", "https://github.com/ImageMagick/ImageMagick/commit/1aa0c6dab6dcef4d9bc3571866ae1c1ddbec7d8f", "https://github.com/ImageMagick/ImageMagick/commit/6b4aff0f117b978502ee5bcd6e753c17aec5a961", "https://github.com/ImageMagick/ImageMagick/commit/8ea44b48a182dd46d018f4b4f09a5e2ee9638105", "https://github.com/ImageMagick/ImageMagick/commit/b8f17d08b7418204bf8a05a5c24e87b2fc395b75"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8958"
imported = 2025-11-25T22:35:59.618Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8958"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8958"
```

# coders/sun.c in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of service...

coders/sun.c in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of service (out-of-bounds read and application crash) via a crafted SUN file.

