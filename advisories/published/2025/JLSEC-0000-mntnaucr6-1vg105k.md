```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucr6-1vg105k"
modified = 2025-11-25T22:36:00.402Z
upstream = ["CVE-2017-17504"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/872", "https://lists.debian.org/debian-lts-announce/2018/01/msg00000.html", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4074", "https://www.debian.org/security/2018/dsa-4204", "https://github.com/ImageMagick/ImageMagick/issues/872", "https://lists.debian.org/debian-lts-announce/2018/01/msg00000.html", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4074", "https://www.debian.org/security/2018/dsa-4204"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-17504"
imported = 2025-11-25T22:36:00.402Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-12-11T02:29:00.840Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-17504"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-17504"
```

# ImageMagick before 7.0.7-12 has a coders/png.c Magick_png_read_raw_profile heap-based buffer over-re...

ImageMagick before 7.0.7-12 has a coders/png.c Magick_png_read_raw_profile heap-based buffer over-read via a crafted file, related to ReadOneMNGImage.

