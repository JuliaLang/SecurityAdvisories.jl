```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnv31k4kq-ln7ip7"
modified = 2026-01-01T03:40:07.850Z
upstream = ["CVE-2025-43965"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/bac413a26073923d3ffb258adaab07fb3fe8fdc9", "https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#711-44---2025-02-22", "https://lists.debian.org/debian-lts-announce/2025/04/msg00035.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1047+0"]

[[jlsec_sources]]
id = "CVE-2025-43965"
imported = 2026-01-01T03:40:07.832Z
modified = 2025-12-31T15:41:59.560Z
published = 2025-04-23T15:16:00.733Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43965"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43965"
```

# In MIFF image processing in ImageMagick before 7.1.1-44, image depth is mishandled after SetQuantumF...

In MIFF image processing in ImageMagick before 7.1.1-44, image depth is mishandled after SetQuantumFormat is used.

