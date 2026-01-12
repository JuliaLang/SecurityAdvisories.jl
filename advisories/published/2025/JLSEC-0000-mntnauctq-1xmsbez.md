```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauctq-1xmsbez"
modified = 2025-11-25T22:36:00.494Z
upstream = ["CVE-2018-16328"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/1224", "https://github.com/ImageMagick/ImageMagick/issues/1224"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2018-16328"
imported = 2025-11-25T22:36:00.494Z
modified = 2024-11-21T03:52:31.837Z
published = 2018-09-01T22:29:00.500Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-16328"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-16328"
```

# In ImageMagick before 7.0.8-8, a NULL pointer dereference exists in the CheckEventLogging function i...

In ImageMagick before 7.0.8-8, a NULL pointer dereference exists in the CheckEventLogging function in MagickCore/log.c.

