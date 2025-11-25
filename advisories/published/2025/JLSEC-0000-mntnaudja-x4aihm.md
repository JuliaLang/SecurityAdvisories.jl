```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudja-x4aihm"
modified = 2025-11-25T22:36:01.414Z
upstream = ["CVE-2025-55004"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cjc8-g9w8-chfw", "https://goo.gle/bigsleep", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cjc8-g9w8-chfw"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-55004"
imported = 2025-11-25T22:36:01.414Z
modified = 2025-08-15T19:31:52.070Z
published = 2025-08-13T14:15:32.733Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55004"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55004"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.2-1, ImageMagick is vulnerable to heap-buffer overflow read around the handling of images with separate alpha channels when performing image magnification in ReadOneMNGIMage. This can likely be used to leak subsequent memory contents into the output image. This issue has been patched in version 7.1.2-1.

