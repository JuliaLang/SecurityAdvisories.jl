```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapuu6e-gkaivc"
modified = 2025-10-22T22:35:34.598Z
upstream = ["CVE-2025-52497"]
references = ["https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-2.md"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-52497"
imported = 2025-10-22T22:35:34.598Z
modified = 2025-07-17T16:00:42.443Z
published = 2025-07-04T15:15:22.787Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-52497"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-52497"
```

# Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer underflow, in mbedtls_pem_read_bu...

Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer underflow, in mbedtls_pem_read_buffer and two mbedtls_pk_parse functions, via untrusted PEM input.

