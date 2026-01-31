```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw9x3gbk-1u8csfe"
modified = 2026-01-31T03:49:17.024Z
upstream = ["CVE-2026-21637"]
references = ["https://nodejs.org/en/blog/vulnerability/december-2025-security-releases"]

[[affected]]
pkg = "libnode_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-21637"
imported = 2026-01-31T03:49:17.024Z
modified = 2026-01-30T20:18:32.377Z
published = 2026-01-20T21:16:05.950Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-21637"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-21637"
```

# A flaw in Node.js TLS error handling allows remote attackers to crash or exhaust resources of a TLS ...

A flaw in Node.js TLS error handling allows remote attackers to crash or exhaust resources of a TLS server when `pskCallback` or `ALPNCallback` are in use. Synchronous exceptions thrown during these callbacks bypass standard TLS error handling paths (tlsClientError and error), causing either immediate process termination or silent file descriptor leaks that eventually lead to denial of service. Because these callbacks process attacker-controlled input during the TLS handshake, a remote client can repeatedly trigger the issue. This vulnerability affects TLS servers using PSK or ALPN callbacks across Node.js versions where these callbacks throw without being safely wrapped.

