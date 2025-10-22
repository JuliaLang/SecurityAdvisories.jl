```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapusc8-wu0hs7"
modified = 2025-10-22T22:35:32.216Z
upstream = ["CVE-2020-36476"]
references = ["https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.8", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.24.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.17", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36476"
imported = 2025-10-22T22:35:32.216Z
modified = 2024-11-21T05:29:37.843Z
published = 2021-08-23T02:15:06.987Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36476"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36476"
```

# An issue was discovered in Mbed TLS before 2.24.0 (and before 2.16.8 LTS and before 2.7.17 LTS)

An issue was discovered in Mbed TLS before 2.24.0 (and before 2.16.8 LTS and before 2.7.17 LTS). There is missing zeroization of plaintext buffers in mbedtls_ssl_read to erase unused application data from memory.

