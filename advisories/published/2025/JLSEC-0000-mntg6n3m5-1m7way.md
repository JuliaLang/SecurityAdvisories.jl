```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntg6n3m5-1m7way"
modified = 2025-11-20T23:04:00.269Z
upstream = ["CVE-2021-24119"]
references = ["https://github.com/ARMmbed/mbedtls/releases", "https://github.com/UzL-ITS/util-lookup/blob/main/cve-vulnerability-publication.md", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DRRVY7DMTX3ECFNZKDYTSFEG5AI2HBC6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EYJW7HAW3TDV2YMDFYXP3HD6WRQRTLJW/", "https://github.com/ARMmbed/mbedtls/releases", "https://github.com/UzL-ITS/util-lookup/blob/main/cve-vulnerability-publication.md", "https://lists.debian.org/debian-lts-announce/2021/11/msg00021.html", "https://lists.debian.org/debian-lts-announce/2022/12/msg00036.html", "https://lists.debian.org/debian-lts-announce/2025/06/msg00034.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DRRVY7DMTX3ECFNZKDYTSFEG5AI2HBC6/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EYJW7HAW3TDV2YMDFYXP3HD6WRQRTLJW/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.26.0+0"]

[[jlsec_sources]]
id = "CVE-2021-24119"
imported = 2025-11-20T23:04:00.269Z
modified = 2025-11-03T20:15:45.783Z
published = 2021-07-14T13:15:08.100Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-24119"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-24119"
```

# In Trusted Firmware Mbed TLS 2.24.0, a side-channel vulnerability in base64 PEM file decoding allows...

In Trusted Firmware Mbed TLS 2.24.0, a side-channel vulnerability in base64 PEM file decoding allows system-level (administrator) attackers to obtain information about secret RSA keys via a controlled-channel and side-channel attack on software running in isolated environments that can be single stepped, especially Intel SGX.

