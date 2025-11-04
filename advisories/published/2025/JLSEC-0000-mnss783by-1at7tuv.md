```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss783by-1at7tuv"
modified = 2025-11-04T04:13:51.454Z
upstream = ["CVE-2025-43964"]
references = ["https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0", "https://github.com/LibRaw/LibRaw/compare/0.21.3...0.21.4", "https://www.libraw.org/news/libraw-0-21-4-release", "https://lists.debian.org/debian-lts-announce/2025/04/msg00038.html"]

[[affected]]
pkg = "LibRaw_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-43964"
imported = 2025-11-04T04:13:51.454Z
modified = 2025-11-03T20:19:02.750Z
published = 2025-04-21T00:15:33.310Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43964"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43964"
```

# In LibRaw before 0.21.4, tag 0x412 processing in phase_one_correct in decoders/load_mfbacks.cpp does...

In LibRaw before 0.21.4, tag 0x412 processing in phase_one_correct in decoders/load_mfbacks.cpp does not enforce minimum w0 and w1 values.

