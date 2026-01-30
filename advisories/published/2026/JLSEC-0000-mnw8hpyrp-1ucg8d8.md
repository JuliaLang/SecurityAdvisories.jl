```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpyrp-1ucg8d8"
modified = 2026-01-30T03:51:07.333Z
upstream = ["CVE-2026-23876"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/2fae24192b78fdfdd27d766fd21d90aeac6ea8b8", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-r49w-jqq3-3gx8"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-23876"
imported = 2026-01-30T03:51:07.333Z
modified = 2026-01-29T13:54:14.303Z
published = 2026-01-20T01:15:57.440Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-23876"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-23876"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to versions 7.1.2-13 and 6.9.13-38, a heap buffer overflow vulnerability in the XBM image decoder (ReadXBMImage) allows an attacker to write controlled data past the allocated heap buffer when processing a maliciously crafted image file. Any operation that reads or identifies an image can trigger the overflow, making it exploitable via common image upload and processing pipelines. Versions 7.1.2-13 and 6.9.13-38 fix the issue.

