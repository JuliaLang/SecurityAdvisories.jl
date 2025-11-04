```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62h02-ym9d3e"
modified = 2025-11-04T03:41:29.618Z
upstream = ["CVE-2024-46953"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=707793", "https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=1f21a45df0fa3abec4cff12951022b192dda3c00", "https://github.com/ArtifexSoftware/ghostpdl/blob/master/doc/News.html", "https://www.suse.com/support/update/announcement/2024/suse-su-20243942-1/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00023.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-46953"
imported = 2025-11-04T03:41:29.618Z
modified = 2025-11-03T23:16:11.553Z
published = 2024-11-10T22:15:12.750Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-46953"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-46953"
```

# An issue was discovered in base/gsdevice.c in Artifex Ghostscript before 10.04.0

An issue was discovered in base/gsdevice.c in Artifex Ghostscript before 10.04.0. An integer overflow when parsing the filename format string (for the output filename) results in path truncation, and possible path traversal and code execution.

