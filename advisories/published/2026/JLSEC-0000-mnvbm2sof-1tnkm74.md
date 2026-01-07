```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvbm2sof-1tnkm74"
modified = 2026-01-07T03:36:40.623Z
upstream = ["CVE-2025-68618"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/6f431d445f3ddd609c004a1dde617b0a73e60beb", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p27m-hp98-6637"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-68618"
imported = 2026-01-07T03:36:40.623Z
modified = 2026-01-06T18:16:21.860Z
published = 2025-12-30T17:15:43.463Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68618"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68618"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.2-12, using Magick to read a malicious SVG file resulted in a DoS attack. Version 7.1.2-12 fixes the issue.

