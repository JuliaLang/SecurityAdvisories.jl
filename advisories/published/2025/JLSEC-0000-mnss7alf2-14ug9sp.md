```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7alf2-14ug9sp"
modified = 2025-11-04T04:15:48.206Z
upstream = ["CVE-2025-48174"]
references = ["https://github.com/AOMediaCodec/libavif/commit/50a743062938a3828581d725facc9c2b92a1d109", "https://github.com/AOMediaCodec/libavif/commit/c9f1bea437f21cb78f9919c332922a3b0ba65e11", "https://github.com/AOMediaCodec/libavif/commit/e5fdefe7d1776e6c4cf1703c163a8c0535599029", "https://github.com/AOMediaCodec/libavif/pull/2768", "https://lists.debian.org/debian-lts-announce/2025/05/msg00031.html"]

[[affected]]
pkg = "libavif_jll"
ranges = ["< 1.3.0+0"]

[[jlsec_sources]]
id = "CVE-2025-48174"
imported = 2025-11-04T04:15:48.206Z
modified = 2025-11-03T20:19:05.993Z
published = 2025-05-16T05:15:37.213Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48174"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48174"
```

# In libavif before 1.3.0, makeRoom in stream.c has an integer overflow and resultant buffer overflow ...

In libavif before 1.3.0, makeRoom in stream.c has an integer overflow and resultant buffer overflow in stream->offset+size.

