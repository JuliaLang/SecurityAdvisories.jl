```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudje-1geiyqp"
modified = 2025-11-25T22:36:01.418Z
upstream = ["CVE-2025-55160"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hgw-6x87-578x"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-55160"
imported = 2025-11-25T22:36:01.418Z
modified = 2025-08-15T19:25:21.890Z
published = 2025-08-13T14:15:33.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55160"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55160"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1, there is undefined behavior (function-type-mismatch) in splay tree cloning callback. This results in a deterministic abort under UBSan (DoS in sanitizer builds), with no crash in a non-sanitized build. This issue has been patched in versions 6.9.13-27 and 7.1.2-1.

