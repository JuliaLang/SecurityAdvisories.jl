```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpyl7-z99skm"
modified = 2026-01-30T03:51:07.099Z
upstream = ["CVE-2026-23874"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9vj4-wc7r-p844"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-23874"
imported = 2026-01-30T03:51:07.099Z
modified = 2026-01-29T13:57:07.867Z
published = 2026-01-20T01:15:57.300Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-23874"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-23874"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Versions prior to 7.1.2-13 have a stack overflow via infinite recursion in MSL (Magick Scripting Language) `<write>` command when writing to MSL format. Version 7.1.2-13 fixes the issue.

