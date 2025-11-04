```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss782rh-1lyvfoe"
modified = 2025-11-04T04:13:50.717Z
upstream = ["CVE-2025-43961"]
references = ["https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2", "https://github.com/LibRaw/LibRaw/compare/0.21.3...0.21.4", "https://www.libraw.org/news/libraw-0-21-4-release", "https://lists.debian.org/debian-lts-announce/2025/04/msg00038.html"]

[[affected]]
pkg = "LibRaw_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-43961"
imported = 2025-11-04T04:13:50.717Z
modified = 2025-11-03T20:19:02.013Z
published = 2025-04-21T00:15:32.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43961"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43961"
```

# In LibRaw before 0.21.4, metadata/tiff.cpp has an out-of-bounds read in the Fujifilm 0xf00c tag pars...

In LibRaw before 0.21.4, metadata/tiff.cpp has an out-of-bounds read in the Fujifilm 0xf00c tag parser.

