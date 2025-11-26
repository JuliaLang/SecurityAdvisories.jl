```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucuw-2sypee"
modified = 2025-11-25T22:36:00.536Z
upstream = ["CVE-2019-13137"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/35ccb468ee2dcbe8ce9cf1e2f1957acc27f54c34", "https://github.com/ImageMagick/ImageMagick/issues/1601", "https://github.com/ImageMagick/ImageMagick6/commit/7d11230060fa9c8f67e53c85224daf6648805c7b", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/35ccb468ee2dcbe8ce9cf1e2f1957acc27f54c34", "https://github.com/ImageMagick/ImageMagick/issues/1601", "https://github.com/ImageMagick/ImageMagick6/commit/7d11230060fa9c8f67e53c85224daf6648805c7b", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-13137"
imported = 2025-11-25T22:36:00.536Z
modified = 2024-11-21T04:24:16.507Z
published = 2019-07-01T20:15:11.493Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-13137"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-13137"
```

# ImageMagick before 7.0.8-50 has a memory leak vulnerability in the function ReadPSImage in coders/ps...

ImageMagick before 7.0.8-50 has a memory leak vulnerability in the function ReadPSImage in coders/ps.c.

