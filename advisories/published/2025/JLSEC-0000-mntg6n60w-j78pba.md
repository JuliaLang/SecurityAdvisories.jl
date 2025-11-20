```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntg6n60w-j78pba"
modified = 2025-11-20T23:04:03.392Z
upstream = ["CVE-2025-54764"]
references = ["https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-ssbleed-mstep/", "https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-54764"
imported = 2025-11-20T23:04:03.392Z
modified = 2025-10-31T15:09:59.620Z
published = 2025-10-20T22:15:37.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-54764"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-54764"
```

# Mbed TLS before 3.6.5 allows a local timing attack against certain RSA operations, and direct calls ...

Mbed TLS before 3.6.5 allows a local timing attack against certain RSA operations, and direct calls to mbedtls_mpi_mod_inv or mbedtls_mpi_gcd.

