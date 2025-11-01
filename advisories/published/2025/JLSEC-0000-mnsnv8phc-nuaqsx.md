```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnsnv8phc-nuaqsx"
modified = 2025-11-01T03:27:20.064Z
upstream = ["CVE-2025-54764"]
references = ["https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-ssbleed-mstep/", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-54764"
imported = 2025-11-01T03:27:20.064Z
modified = 2025-10-31T15:09:59.620Z
published = 2025-10-20T22:15:37.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-54764"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-54764"
```

# Mbed TLS before 3.6.5 allows a local timing attack against certain RSA operations, and direct calls ...

Mbed TLS before 3.6.5 allows a local timing attack against certain RSA operations, and direct calls to mbedtls_mpi_mod_inv or mbedtls_mpi_gcd.

