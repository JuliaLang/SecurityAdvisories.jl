```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpyg7-hfiyql"
modified = 2026-01-30T03:51:06.919Z
upstream = ["CVE-2026-22770"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/3e0330721020e0c5bb52e4b77c347527dd71658e", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-39h3-g67r-7g3c"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-22770"
imported = 2026-01-30T03:51:06.919Z
modified = 2026-01-29T14:56:04.840Z
published = 2026-01-20T01:15:57.153Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22770"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22770"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. The BilateralBlurImage method will allocate a set of double buffers inside AcquireBilateralTLS. But, in versions prior to 7.1.2-13, the last element in the set is not properly initialized. This will result in a release of an invalid pointer inside DestroyBilateralTLS when the memory allocation fails. Version 7.1.2-13 contains a patch for the issue.

