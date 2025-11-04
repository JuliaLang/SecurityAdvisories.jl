```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6u6is-cwvd1l"
modified = 2025-11-04T04:03:02.404Z
upstream = ["CVE-2024-56378"]
references = ["https://gitlab.freedesktop.org/poppler/poppler/-/blob/30eada0d2bceb42c2d2a87361339063e0b9bea50/CMakeLists.txt#L621", "https://gitlab.freedesktop.org/poppler/poppler/-/commit/ade9b5ebed44b0c15522c27669ef6cdf93eff84e", "https://gitlab.freedesktop.org/poppler/poppler/-/issues/1553", "https://lists.debian.org/debian-lts-announce/2025/04/msg00037.html"]

[[affected]]
pkg = "Poppler_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-56378"
imported = 2025-11-04T04:03:02.404Z
modified = 2025-11-03T20:16:51.900Z
published = 2024-12-23T00:15:05.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-56378"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-56378"
```

# libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read vulnerability within the JBIG2Bit...

libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read vulnerability within the JBIG2Bitmap::combine function in JBIG2Stream.cc.

