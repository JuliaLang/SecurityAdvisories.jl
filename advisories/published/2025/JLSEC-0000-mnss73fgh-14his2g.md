```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73fgh-14his2g"
modified = 2025-11-04T04:10:13.889Z
upstream = ["CVE-2025-27830"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=708241", "https://lists.debian.org/debian-lts-announce/2025/04/msg00014.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27830"
imported = 2025-11-04T04:10:13.889Z
modified = 2025-11-03T20:18:07.643Z
published = 2025-03-25T21:15:42.353Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27830"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27830"
```

# An issue was discovered in Artifex Ghostscript before 10.05.0

An issue was discovered in Artifex Ghostscript before 10.05.0. A buffer overflow occurs during serialization of DollarBlend in a font, for base/write_t1.c and psi/zfapi.c.

