```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62h3v-2trjw2"
modified = 2025-11-04T03:41:29.755Z
upstream = ["CVE-2024-46955"]
references = ["https://bugs.ghostscript.com/show_bug.cgi?id=707990", "https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=85bd9d2f4b792fe67aef22f1a4117457461b8ba6", "https://github.com/ArtifexSoftware/ghostpdl/blob/master/doc/News.html", "https://www.suse.com/support/update/announcement/2024/suse-su-20243942-1/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00023.html"]

[[affected]]
pkg = "Ghostscript_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-46955"
imported = 2025-11-04T03:41:29.755Z
modified = 2025-11-03T23:16:11.800Z
published = 2024-11-10T22:15:12.887Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-46955"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-46955"
```

# An issue was discovered in psi/zcolor.c in Artifex Ghostscript before 10.04.0

An issue was discovered in psi/zcolor.c in Artifex Ghostscript before 10.04.0. There is an out-of-bounds read when reading color in Indexed color space.

