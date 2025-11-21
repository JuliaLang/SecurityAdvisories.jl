```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73fw3-dhrt3z"
modified = 2025-11-04T04:10:14.451Z
upstream = ["CVE-2025-27836"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=708192", "https://lists.debian.org/debian-lts-announce/2025/04/msg00014.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27836"
imported = 2025-11-04T04:10:14.451Z
modified = 2025-11-03T20:18:08.220Z
published = 2025-03-25T21:15:43.137Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27836"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27836"
```

# An issue was discovered in Artifex Ghostscript before 10.05.0

An issue was discovered in Artifex Ghostscript before 10.05.0. The BJ10V device has a Print buffer overflow in contrib/japanese/gdev10v.c.

