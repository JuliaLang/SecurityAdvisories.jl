```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73fs7-6bvygy"
modified = 2025-11-04T04:10:14.311Z
upstream = ["CVE-2025-27835"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=708131", "https://lists.debian.org/debian-lts-announce/2025/04/msg00014.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27835"
imported = 2025-11-04T04:10:14.311Z
modified = 2025-11-03T20:18:08.073Z
published = 2025-03-25T21:15:43.013Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27835"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27835"
```

# An issue was discovered in Artifex Ghostscript before 10.05.0

An issue was discovered in Artifex Ghostscript before 10.05.0. A buffer overflow occurs when converting glyphs to Unicode in psi/zbfont.c.

