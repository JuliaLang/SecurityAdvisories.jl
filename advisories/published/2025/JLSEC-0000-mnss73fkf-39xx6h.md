```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73fkf-39xx6h"
modified = 2025-11-04T04:10:14.031Z
upstream = ["CVE-2025-27831"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=708132", "https://lists.debian.org/debian-lts-announce/2025/04/msg00014.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-27831"
imported = 2025-11-04T04:10:14.031Z
modified = 2025-11-03T20:18:07.790Z
published = 2025-03-25T21:15:42.467Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-27831"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-27831"
```

# An issue was discovered in Artifex Ghostscript before 10.05.0

An issue was discovered in Artifex Ghostscript before 10.05.0. The DOCXWRITE TXTWRITE device has a text buffer overflow via long characters to devices/vector/doc_common.c.

