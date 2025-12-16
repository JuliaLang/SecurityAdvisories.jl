```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnug6cu27-n41iqy"
modified = 2025-12-16T03:35:43.663Z
upstream = ["CVE-2024-0901"]
references = ["https://github.com/wolfSSL/wolfssl/issues/7089", "https://github.com/wolfSSL/wolfssl/pull/7099", "https://github.com/wolfSSL/wolfssl/issues/7089", "https://github.com/wolfSSL/wolfssl/pull/7099"]

[[affected]]
pkg = "wolfSSL_jll"
ranges = ["< 5.7.2+0"]

[[jlsec_sources]]
id = "CVE-2024-0901"
imported = 2025-12-16T03:35:43.645Z
modified = 2025-12-15T21:42:52.097Z
published = 2024-03-25T23:15:51.250Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-0901"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-0901"
```

# Remotely executed SEGV and out of bounds read allows malicious packet sender to crash or cause an ou...

Remotely executed SEGV and out of bounds read allows malicious packet sender to crash or cause an out of bounds read via sending a malformed packet with the correct length.

