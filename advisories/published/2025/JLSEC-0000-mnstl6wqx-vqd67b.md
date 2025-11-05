```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl6wqx-vqd67b"
modified = 2025-11-05T03:32:37.065Z
upstream = ["CVE-2024-22019"]
references = ["http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://hackerone.com/reports/2233486", "https://security.netapp.com/advisory/ntap-20240315-0004/", "http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://hackerone.com/reports/2233486", "https://lists.debian.org/debian-lts-announce/2024/09/msg00029.html", "https://security.netapp.com/advisory/ntap-20240315-0004/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 18.12.1+0"]

[[jlsec_sources]]
id = "CVE-2024-22019"
imported = 2025-11-05T03:32:37.065Z
modified = 2025-11-04T17:15:45.907Z
published = 2024-02-20T02:15:50.983Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-22019"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-22019"
```

# A vulnerability in Node.js HTTP servers allows an attacker to send a specially crafted HTTP request ...

A vulnerability in Node.js HTTP servers allows an attacker to send a specially crafted HTTP request with chunked encoding, leading to resource exhaustion and denial of service (DoS). The server reads an unbounded number of bytes from a single connection, exploiting the lack of limitations on chunk extension bytes. The issue can cause CPU and network bandwidth exhaustion, bypassing standard safeguards like timeouts and body size limits.

