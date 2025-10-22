```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8yw7me-1ry022h"
modified = 2025-10-21T17:13:02.870Z
upstream = ["CVE-2020-22218"]
references = ["https://github.com/libssh2/libssh2/pull/476", "https://lists.debian.org/debian-lts-announce/2023/09/msg00006.html", "https://security.netapp.com/advisory/ntap-20231006-0002/", "https://github.com/libssh2/libssh2/pull/476", "https://lists.debian.org/debian-lts-announce/2023/09/msg00006.html", "https://security.netapp.com/advisory/ntap-20231006-0002/"]

[[affected]]
pkg = "LibSSH2_jll"
ranges = [">= 1.10.1+0, < 1.11.0+0"]

[[jlsec_sources]]
id = "CVE-2020-22218"
imported = 2025-10-21T17:13:02.870Z
modified = 2024-11-21T05:13:11.797Z
published = 2023-08-22T19:16:19.120Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-22218"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-22218"
```

# An issue was discovered in function _libssh2_packet_add in libssh2 1.10.0 allows attackers to access...

An issue was discovered in function _libssh2_packet_add in libssh2 1.10.0 allows attackers to access out of bounds memory.

