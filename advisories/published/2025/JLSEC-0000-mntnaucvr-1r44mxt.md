```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvr-1r44mxt"
modified = 2025-11-25T22:36:00.567Z
upstream = ["CVE-2019-19949"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2020-02/msg00006.html", "https://github.com/ImageMagick/ImageMagick/issues/1561", "https://lists.debian.org/debian-lts-announce/2019/12/msg00033.html", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4549-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2020-02/msg00006.html", "https://github.com/ImageMagick/ImageMagick/issues/1561", "https://lists.debian.org/debian-lts-announce/2019/12/msg00033.html", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4549-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-19949"
imported = 2025-11-25T22:36:00.567Z
modified = 2024-11-21T04:35:43.490Z
published = 2019-12-24T01:15:11.327Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-19949"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-19949"
```

# In ImageMagick 7.0.8-43 Q16, there is a heap-based buffer over-read in the function WritePNGImage of...

In ImageMagick 7.0.8-43 Q16, there is a heap-based buffer over-read in the function WritePNGImage of coders/png.c, related to Magick_png_write_raw_profile and LocaleNCompare.

