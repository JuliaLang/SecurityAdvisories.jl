```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyu-z8qu2"
modified = 2025-11-25T22:35:59.382Z
upstream = ["CVE-2016-10057"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95192", "https://bugzilla.redhat.com/show_bug.cgi?id=1410466", "https://github.com/ImageMagick/ImageMagick/commit/10b3823a7619ed22d42764733eb052c4159bc8c1", "https://github.com/ImageMagick/ImageMagick/commit/eedd0c35bb2d8af7aa05f215689fdebd11633fa1", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95192", "https://bugzilla.redhat.com/show_bug.cgi?id=1410466", "https://github.com/ImageMagick/ImageMagick/commit/10b3823a7619ed22d42764733eb052c4159bc8c1", "https://github.com/ImageMagick/ImageMagick/commit/eedd0c35bb2d8af7aa05f215689fdebd11633fa1"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10057"
imported = 2025-11-25T22:35:59.382Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.737Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10057"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10057"
```

# Buffer overflow in the WriteGROUP4Image function in coders/tiff.c in ImageMagick before 6.9.5-8 allo...

Buffer overflow in the WriteGROUP4Image function in coders/tiff.c in ImageMagick before 6.9.5-8 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file.

