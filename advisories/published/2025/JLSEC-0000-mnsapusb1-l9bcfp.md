```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapusb1-l9bcfp"
modified = 2025-10-22T22:35:32.173Z
upstream = ["CVE-2020-36426"]
references = ["https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/740108", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36426"
imported = 2025-10-22T22:35:32.173Z
modified = 2024-11-21T05:29:28.957Z
published = 2021-07-19T17:15:11.367Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36426"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36426"
```

# An issue was discovered in Arm Mbed TLS before 2.24.0

An issue was discovered in Arm Mbed TLS before 2.24.0. mbedtls_x509_crl_parse_der has a buffer over-read (of one byte).

