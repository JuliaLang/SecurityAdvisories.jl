```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapusap-y0cczb"
modified = 2025-10-22T22:35:32.161Z
upstream = ["CVE-2020-16150"]
references = ["https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5OSOFUD6UTGTDDSQRS62BPXDU52I6PUA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IRPBHCQKZXHVKOP5O5EWE7P76AWGUXQJ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OD3NM6GD73CTFFRBKG5G2ACXGG7QQHCC/", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-1", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/5OSOFUD6UTGTDDSQRS62BPXDU52I6PUA/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IRPBHCQKZXHVKOP5O5EWE7P76AWGUXQJ/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OD3NM6GD73CTFFRBKG5G2ACXGG7QQHCC/", "https://tls.mbed.org/tech-updates/security-advisories", "https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2020-09-1"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-16150"
imported = 2025-10-22T22:35:32.161Z
modified = 2024-11-21T05:06:51.490Z
published = 2020-09-02T16:15:12.363Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-16150"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-16150"
```

# A Lucky 13 timing side channel in mbedtls_ssl_decrypt_buf in library/ssl_msg.c in Trusted Firmware M...

A Lucky 13 timing side channel in mbedtls_ssl_decrypt_buf in library/ssl_msg.c in Trusted Firmware Mbed TLS through 2.23.0 allows an attacker to recover secret key information. This affects CBC mode because of a computed time difference based on a padding length.

