```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntxlh18v-1k4mtfv"
modified = 2025-12-03T03:31:16.495Z
upstream = ["CVE-2022-2509"]
references = ["https://access.redhat.com/security/cve/CVE-2022-2509", "https://lists.debian.org/debian-lts-announce/2022/08/msg00002.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6FL27JS3VM74YEQU7PGB62USO3KSBYZX/", "https://lists.gnupg.org/pipermail/gnutls-help/2022-July/004746.html", "https://www.debian.org/security/2022/dsa-5203", "https://access.redhat.com/security/cve/CVE-2022-2509", "https://lists.debian.org/debian-lts-announce/2022/08/msg00002.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6FL27JS3VM74YEQU7PGB62USO3KSBYZX/", "https://lists.gnupg.org/pipermail/gnutls-help/2022-July/004746.html", "https://www.debian.org/security/2022/dsa-5203"]

[[affected]]
pkg = "GnuTLS_jll"
ranges = ["< 3.7.8+0"]

[[jlsec_sources]]
id = "CVE-2022-2509"
imported = 2025-12-03T03:31:16.495Z
modified = 2025-12-02T21:15:49.750Z
published = 2022-08-01T14:15:09.890Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-2509"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-2509"
```

# A vulnerability found in gnutls

A vulnerability found in gnutls. This security flaw happens because of a double free error occurs during verification of pkcs7 signatures in gnutls_pkcs7_verify function.

