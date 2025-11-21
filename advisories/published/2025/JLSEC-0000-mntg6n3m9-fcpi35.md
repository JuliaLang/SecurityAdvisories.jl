```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntg6n3m9-fcpi35"
modified = 2025-11-20T23:04:00.273Z
upstream = ["CVE-2020-36423"]
references = ["https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://bugs.gentoo.org/730752", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.7", "https://github.com/ARMmbed/mbedtls/releases/tag/v2.23.0", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.16.8+0"]

[[jlsec_sources]]
id = "CVE-2020-36423"
imported = 2025-11-20T23:04:00.273Z
modified = 2024-11-21T05:29:28.403Z
published = 2021-07-19T17:15:11.223Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-36423"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-36423"
```

# An issue was discovered in Arm Mbed TLS before 2.23.0

An issue was discovered in Arm Mbed TLS before 2.23.0. A remote attacker can recover plaintext because a certain Lucky 13 countermeasure doesn't properly consider the case of a hardware accelerator.

