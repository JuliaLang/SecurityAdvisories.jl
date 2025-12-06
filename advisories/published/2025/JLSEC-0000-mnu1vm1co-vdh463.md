```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnu1vm1co-vdh463"
modified = 2025-12-06T03:26:10.776Z
upstream = ["CVE-2024-5814"]
references = ["https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md#add_later"]

[[affected]]
pkg = "wolfSSL_jll"
ranges = ["< 5.7.2+0"]

[[jlsec_sources]]
id = "CVE-2024-5814"
imported = 2025-12-06T03:26:10.776Z
modified = 2025-12-06T00:54:13.963Z
published = 2024-08-27T19:15:17.980Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-5814"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-5814"
```

# A malicious TLS1.2 server can force a TLS1.3 client with downgrade capability to use a ciphersuite t...

A malicious TLS1.2 server can force a TLS1.3 client with downgrade capability to use a ciphersuite that it did not agree to and achieve a successful connection. This is because, aside from the extensions, the client was skipping fully parsing the server hello.  https://doi.org/10.46586/tches.v2024.i1.457-500

