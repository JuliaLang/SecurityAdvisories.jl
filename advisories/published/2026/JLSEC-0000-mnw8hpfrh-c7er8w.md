```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpfrh-c7er8w"
modified = 2026-01-30T03:50:42.701Z
upstream = ["CVE-2025-27796"]
references = ["http://www.graphicsmagick.org/NEWS.html", "https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3f9f", "https://sourceforge.net/p/graphicsmagick/bugs/750/"]

[[affected]]
pkg = "GraphicsMagick_jll"
ranges = ["< 1.3.47+0"]

[[jlsec_sources]]
id = "CVE-2025-27796"
imported = 2026-01-30T03:50:42.682Z
modified = 2026-01-29T20:56:31.340Z
published = 2025-03-07T06:15:35.620Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27796"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27796"
```

# ReadWPGImage in WPG in GraphicsMagick before 1.3.46 mishandles palette buffer allocation, resulting ...

ReadWPGImage in WPG in GraphicsMagick before 1.3.46 mishandles palette buffer allocation, resulting in out-of-bounds access to heap memory in ReadBlob.

