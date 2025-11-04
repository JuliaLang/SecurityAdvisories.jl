```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7esz4-a2b6ou"
modified = 2025-11-04T04:19:04.624Z
upstream = ["CVE-2025-53014"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-hm4x-r5hc-794f", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-53014"
imported = 2025-11-04T04:19:04.624Z
modified = 2025-11-03T19:16:07.910Z
published = 2025-07-14T18:15:23.620Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53014"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53014"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Versions prior to 7.1.2-0 and 6.9.13-26 have a heap buffer overflow in the `InterpretImageFilename` function. The issue stems from an off-by-one error that causes out-of-bounds memory access when processing format strings containing consecutive percent signs (`%%`). Versions 7.1.2-0 and 6.9.13-26 fix the issue.

