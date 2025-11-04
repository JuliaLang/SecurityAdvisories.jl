```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss78388-uu94lb"
modified = 2025-11-04T04:13:51.320Z
upstream = ["CVE-2025-43963"]
references = ["https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964", "https://github.com/LibRaw/LibRaw/compare/0.21.3...0.21.4", "https://www.libraw.org/news/libraw-0-21-4-release", "https://lists.debian.org/debian-lts-announce/2025/04/msg00038.html"]

[[affected]]
pkg = "LibRaw_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-43963"
imported = 2025-11-04T04:13:51.320Z
modified = 2025-11-03T20:19:02.580Z
published = 2025-04-21T00:15:33.173Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43963"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43963"
```

# In LibRaw before 0.21.4, phase_one_correct in decoders/load_mfbacks.cpp allows out-of-buffer access ...

In LibRaw before 0.21.4, phase_one_correct in decoders/load_mfbacks.cpp allows out-of-buffer access because split_col and split_row values are not checked in 0x041f tag processing.

