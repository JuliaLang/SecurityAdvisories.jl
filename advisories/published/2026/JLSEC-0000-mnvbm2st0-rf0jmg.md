```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvbm2st0-rf0jmg"
modified = 2026-01-07T03:36:40.788Z
upstream = ["CVE-2025-68950"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/204718c2211903949dcfc0df8e65ed066b008dec", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-7rvh-xqp3-pr8j"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-68950"
imported = 2026-01-07T03:36:40.788Z
modified = 2026-01-06T18:13:53.607Z
published = 2025-12-30T17:15:43.770Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68950"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68950"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.2-12, Magick fails to check for circular references between two MVGs, leading to a stack overflow. This is a DoS vulnerability, and any situation that allows reading the mvg file will be affected. Version 7.1.2-12 fixes the issue.

