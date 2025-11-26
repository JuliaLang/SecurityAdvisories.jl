```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucuu-1k83cbb"
modified = 2025-11-25T22:36:00.534Z
upstream = ["CVE-2019-13135"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/cdb383749ef7b68a38891440af8cc23e0115306d", "https://github.com/ImageMagick/ImageMagick/issues/1599", "https://github.com/ImageMagick/ImageMagick6/commit/1e59b29e520d2beab73e8c78aacd5f1c0d76196d", "https://lists.debian.org/debian-lts-announce/2019/08/msg00021.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://support.f5.com/csp/article/K20336394", "https://support.f5.com/csp/article/K20336394?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/cdb383749ef7b68a38891440af8cc23e0115306d", "https://github.com/ImageMagick/ImageMagick/issues/1599", "https://github.com/ImageMagick/ImageMagick6/commit/1e59b29e520d2beab73e8c78aacd5f1c0d76196d", "https://lists.debian.org/debian-lts-announce/2019/08/msg00021.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://support.f5.com/csp/article/K20336394", "https://support.f5.com/csp/article/K20336394?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/4192-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-13135"
imported = 2025-11-25T22:36:00.534Z
modified = 2024-11-21T04:24:16.150Z
published = 2019-07-01T20:15:11.337Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-13135"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-13135"
```

# ImageMagick before 7.0.8-50 has a "use of uninitialized value" vulnerability in the function ReadCUT...

ImageMagick before 7.0.8-50 has a "use of uninitialized value" vulnerability in the function ReadCUTImage in coders/cut.c.

