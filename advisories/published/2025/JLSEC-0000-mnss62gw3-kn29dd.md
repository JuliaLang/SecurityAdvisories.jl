```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62gw3-kn29dd"
modified = 2025-11-04T03:41:29.475Z
upstream = ["CVE-2024-46951"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=707991", "https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f49812186baa7d1362880673408a6fbe8719b4f8", "https://github.com/ArtifexSoftware/ghostpdl/blob/master/doc/News.html", "https://www.suse.com/support/update/announcement/2024/suse-su-20243942-1/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00023.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-46951"
imported = 2025-11-04T03:41:29.475Z
modified = 2025-11-03T23:16:11.283Z
published = 2024-11-10T21:15:14.880Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-46951"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-46951"
```

# An issue was discovered in psi/zcolor.c in Artifex Ghostscript before 10.04.0

An issue was discovered in psi/zcolor.c in Artifex Ghostscript before 10.04.0. An unchecked Implementation pointer in Pattern color space could lead to arbitrary code execution.

