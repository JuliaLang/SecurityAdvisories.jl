```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudjd-1kkvoq8"
modified = 2025-11-25T22:36:01.417Z
upstream = ["CVE-2025-55154"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qp29-wxp5-wh82", "https://goo.gle/bigsleep", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-55154"
imported = 2025-11-25T22:36:01.417Z
modified = 2025-11-03T19:16:12.043Z
published = 2025-08-13T14:15:33.030Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55154"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55154"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1, the magnified size calculations in ReadOneMNGIMage (in coders/png.c) are unsafe and can overflow, leading to memory corruption. This issue has been patched in versions 6.9.13-27 and 7.1.2-1.

