```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauduv-14rmdt0"
modified = 2025-11-25T22:36:01.831Z
upstream = ["CVE-2025-62594"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/7b47fe369eda90483402fcd3d78fa4167d3bb129", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-wpp4-vqfq-v4hp"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-62594"
imported = 2025-11-25T22:36:01.831Z
modified = 2025-11-03T19:42:36.100Z
published = 2025-10-27T20:15:54.893Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-62594"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-62594"
```

# ImageMagick is a software suite to create, edit, compose, or convert bitmap images

ImageMagick is a software suite to create, edit, compose, or convert bitmap images. ImageMagick versions prior to 7.1.2-8 are vulnerable to denial-of-service due to unsigned integer underflow and division-by-zero in the CLAHEImage function. When tile width or height is zero, unsigned underflow occurs in pointer arithmetic, leading to out-of-bounds memory access, and division-by-zero causes immediate crashes. This issue has been patched in version 7.1.2-8.

