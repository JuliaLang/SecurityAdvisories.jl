```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73fo9-16e4wio"
modified = 2025-11-04T04:10:14.169Z
upstream = ["CVE-2025-27832"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=708133", "https://lists.debian.org/debian-lts-announce/2025/04/msg00014.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27832"
imported = 2025-11-04T04:10:14.169Z
modified = 2025-11-03T20:18:07.937Z
published = 2025-03-25T21:15:42.570Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27832"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27832"
```

# An issue was discovered in Artifex Ghostscript before 10.05.0

An issue was discovered in Artifex Ghostscript before 10.05.0. The NPDL device has a Compression buffer overflow for contrib/japanese/gdevnpdl.c.

