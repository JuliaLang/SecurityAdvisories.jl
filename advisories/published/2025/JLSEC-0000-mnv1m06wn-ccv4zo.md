```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnv1m06wn-ccv4zo"
modified = 2025-12-31T03:36:57.335Z
upstream = ["CVE-2025-68469"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fff3-4rp7-px97"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+1"]

[[jlsec_sources]]
id = "CVE-2025-68469"
imported = 2025-12-31T03:36:57.335Z
modified = 2025-12-30T19:56:36.630Z
published = 2025-12-18T16:15:57.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68469"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68469"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.1-14, ImageMagick crashes when processing a crafted TIFF file. Version 7.1.1-14 fixes the issue.

