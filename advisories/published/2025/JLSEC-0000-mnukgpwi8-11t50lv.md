```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgpwi8-11t50lv"
modified = 2025-12-19T03:36:54.224Z
aliases = ["CVE-2025-68469"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fff3-4rp7-px97"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+1"]

[[jlsec_sources]]
id = "CVE-2025-68469"
imported = 2025-12-19T03:36:54.224Z
modified = 2025-12-18T16:15:57.700Z
published = 2025-12-18T16:15:57.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68469"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68469"
[[jlsec_sources]]
id = "EUVD-2025-204303"
imported = 2025-12-19T03:36:54.226Z
modified = 2025-12-18T15:52:40.000Z
published = 2025-12-18T15:36:28.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-204303"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-204303"
fields = ["affected"]
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.1-14, ImageMagick crashes when processing a crafted TIFF file. Version 7.1.1-14 fixes the issue.

