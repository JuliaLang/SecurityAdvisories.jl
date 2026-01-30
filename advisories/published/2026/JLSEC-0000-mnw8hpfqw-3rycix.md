```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hpfqw-3rycix"
modified = 2026-01-30T03:50:42.680Z
upstream = ["CVE-2025-27795"]
references = ["http://www.graphicsmagick.org/NEWS.html", "https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42", "https://github.com/libjxl/libjxl/issues/3792#issuecomment-2330978387", "https://github.com/libjxl/libjxl/issues/3793#issuecomment-2334843280", "https://issues.oss-fuzz.com/issues/42536330#comment6"]

[[affected]]
pkg = "GraphicsMagick_jll"
ranges = ["< 1.3.47+0"]

[[jlsec_sources]]
id = "CVE-2025-27795"
imported = 2026-01-30T03:50:42.658Z
modified = 2026-01-29T21:08:32.087Z
published = 2025-03-07T06:15:33.273Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27795"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27795"
```

# ReadJXLImage in JXL in GraphicsMagick before 1.3.46 lacks image dimension resource limits.

ReadJXLImage in JXL in GraphicsMagick before 1.3.46 lacks image dimension resource limits.

