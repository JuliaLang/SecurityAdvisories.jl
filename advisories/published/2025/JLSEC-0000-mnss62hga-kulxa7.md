```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62hga-kulxa7"
modified = 2025-11-04T03:41:30.202Z
upstream = ["CVE-2024-46956"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=707895", "https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f4151f12db32cd3ed26c24327de714bf2c3ed6ca", "https://github.com/ArtifexSoftware/ghostpdl/blob/master/doc/News.html", "https://www.suse.com/support/update/announcement/2024/suse-su-20243942-1/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00023.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-46956"
imported = 2025-11-04T03:41:30.202Z
modified = 2025-11-03T23:16:12.043Z
published = 2024-11-10T22:15:12.943Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-46956"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-46956"
```

# An issue was discovered in psi/zfile.c in Artifex Ghostscript before 10.04.0

An issue was discovered in psi/zfile.c in Artifex Ghostscript before 10.04.0. Out-of-bounds data access in filenameforall can lead to arbitrary code execution.

