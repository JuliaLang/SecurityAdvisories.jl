```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapusc6-16suhw9"
modified = 2025-10-22T22:35:32.214Z
upstream = ["CVE-2020-36475"]
references = ["https://cert-portal.siemens.com/productcert/pdf/ssa-756638.pdf", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.25.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.18", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://cert-portal.siemens.com/productcert/pdf/ssa-756638.pdf", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.25.0", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.7.18", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.25.0+0"]

[[jlsec_sources]]
id = "CVE-2020-36475"
imported = 2025-10-22T22:35:32.214Z
modified = 2024-11-21T05:29:37.603Z
published = 2021-08-23T02:15:06.930Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36475"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36475"
```

# An issue was discovered in Mbed TLS before 2.25.0 (and before 2.16.9 LTS and before 2.7.18 LTS)

An issue was discovered in Mbed TLS before 2.25.0 (and before 2.16.9 LTS and before 2.7.18 LTS). The calculations performed by mbedtls_mpi_exp_mod are not limited; thus, supplying overly large parameters could lead to denial of service when generating Diffie-Hellman key pairs.

