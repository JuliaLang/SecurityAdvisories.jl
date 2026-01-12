```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubux-9msnvf"
modified = 2025-11-25T22:35:59.241Z
upstream = ["CVE-2016-10064"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95211", "https://bugzilla.redhat.com/show_bug.cgi?id=1410478", "https://github.com/ImageMagick/ImageMagick/commit/63302366a63602acbaad5c8223a105811b2adddd", "https://github.com/ImageMagick/ImageMagick/commit/f8877abac8e568b2f339cca70c2c3c1b6eaec288", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95211", "https://bugzilla.redhat.com/show_bug.cgi?id=1410478", "https://github.com/ImageMagick/ImageMagick/commit/63302366a63602acbaad5c8223a105811b2adddd", "https://github.com/ImageMagick/ImageMagick/commit/f8877abac8e568b2f339cca70c2c3c1b6eaec288"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10064"
imported = 2025-11-25T22:35:59.241Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.380Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10064"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10064"
```

# Buffer overflow in coders/tiff.c in ImageMagick before 6.9.5-1 allows remote attackers to cause a de...

Buffer overflow in coders/tiff.c in ImageMagick before 6.9.5-1 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file.

