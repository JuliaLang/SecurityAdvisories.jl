```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucue-zt9ggz"
modified = 2025-11-25T22:36:00.518Z
upstream = ["CVE-2019-7175"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "https://github.com/ImageMagick/ImageMagick/commit/1e6a3ace073c9ec9c71e439c111d23c6e66cb6ae", "https://github.com/ImageMagick/ImageMagick/issues/1450", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "https://github.com/ImageMagick/ImageMagick/commit/1e6a3ace073c9ec9c71e439c111d23c6e66cb6ae", "https://github.com/ImageMagick/ImageMagick/issues/1450", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-7175"
imported = 2025-11-25T22:36:00.518Z
modified = 2024-11-21T04:47:43.430Z
published = 2019-03-07T23:29:01.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7175"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7175"
```

# In ImageMagick before 7.0.8-25, some memory leaks exist in DecodeImage in coders/pcd.c.

In ImageMagick before 7.0.8-25, some memory leaks exist in DecodeImage in coders/pcd.c.

