```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvbm2sww-1niyv3i"
modified = 2026-01-07T03:36:40.928Z
upstream = ["CVE-2025-69204"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/2c08c2311693759153c9aa99a6b2dcb5f985681e", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-hrh7-j8q2-4qcw"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-69204"
imported = 2026-01-07T03:36:40.928Z
modified = 2026-01-06T18:07:41.727Z
published = 2025-12-30T17:15:43.920Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-69204"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-69204"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to version 7.1.2-12, in the WriteSVGImage function, using an int variable to store number_attributes caused an integer overflow. This, in turn, triggered a buffer overflow and caused a DoS attack. Version 7.1.2-12 fixes the issue.

