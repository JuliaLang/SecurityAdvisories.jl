```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss78342-mftvws"
modified = 2025-11-04T04:13:51.170Z
upstream = ["CVE-2025-43962"]
references = ["https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2", "https://github.com/LibRaw/LibRaw/compare/0.21.3...0.21.4", "https://www.libraw.org/news/libraw-0-21-4-release", "https://lists.debian.org/debian-lts-announce/2025/04/msg00038.html"]

[[affected]]
pkg = "LibRaw_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-43962"
imported = 2025-11-04T04:13:51.170Z
modified = 2025-11-03T20:19:02.190Z
published = 2025-04-21T00:15:33.027Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43962"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43962"
```

# In LibRaw before 0.21.4, phase_one_correct in decoders/load_mfbacks.cpp has out-of-bounds reads for ...

In LibRaw before 0.21.4, phase_one_correct in decoders/load_mfbacks.cpp has out-of-bounds reads for tag 0x412 processing, related to large w0 or w1 values or the frac and mult calculations.

