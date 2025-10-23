```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsbs2usc-1qpkm5u"
modified = 2025-10-23T16:25:34.044Z
aliases = ["EUVD-2025-14831", "CVE-2025-27810"]
severity = ["CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:C/C:L/I:L/A:N"]
references = ["https://github.com/Mbed-TLS/mbedtls/releases", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-2/"]

[[jlsec_sources]]
id = "EUVD-2025-14831"
imported = 2025-10-23T16:25:34.016Z
modified = 2025-03-25T14:37:14.000Z
published = 2025-03-25T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-14831"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-14831"
```

# Mbed TLS before 2.28.10 and 3.x before 3.6.3, in some cases of failed memory allocation or hardware ...

Mbed TLS before 2.28.10 and 3.x before 3.6.3, in some cases of failed memory allocation or hardware errors, uses uninitialized stack memory to compose the TLS Finished message, potentially leading to authentication bypasses such as replays.

