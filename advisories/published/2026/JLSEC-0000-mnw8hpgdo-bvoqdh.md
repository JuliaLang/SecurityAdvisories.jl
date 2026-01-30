```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpgdo-bvoqdh"
modified = 2026-01-30T03:50:43.500Z
upstream = ["CVE-2025-32460"]
references = ["https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb", "https://issues.oss-fuzz.com/issues/406320404", "https://tracker.debian.org/news/1636753/accepted-graphicsmagick-14really1345hg17696-1-source-into-unstable/"]

[[affected]]
pkg = "GraphicsMagick_jll"
ranges = ["< 1.3.47+0"]

[[jlsec_sources]]
id = "CVE-2025-32460"
imported = 2026-01-30T03:50:43.500Z
modified = 2026-01-29T20:34:53.740Z
published = 2025-04-09T02:15:15.137Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32460"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32460"
```

# GraphicsMagick before 8e56520 has a heap-based buffer over-read in ReadJXLImage in coders/jxl.c, rel...

GraphicsMagick before 8e56520 has a heap-based buffer over-read in ReadJXLImage in coders/jxl.c, related to an ImportViewPixelArea call.

