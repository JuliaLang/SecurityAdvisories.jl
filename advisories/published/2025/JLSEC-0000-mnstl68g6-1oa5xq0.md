```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl68g6-1oa5xq0"
modified = 2025-11-05T03:32:05.574Z
upstream = ["CVE-2024-23775"]
references = ["https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/GP5UU7Z6LJNBLBT4SC5WWS2HDNMTFZH5/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IIBPEYSVRK4IFLBSYJAWKH33YBNH5HR2/", "https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/"]

[[affected]]
pkg = "MbedTLS_jll"
ranges = ["< 2.28.10+0"]

[[jlsec_sources]]
id = "CVE-2024-23775"
imported = 2025-11-05T03:32:05.574Z
modified = 2025-11-04T19:16:54.560Z
published = 2024-01-31T08:15:42.267Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-23775"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-23775"
```

# Integer Overflow vulnerability in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2, allows attackers ...

Integer Overflow vulnerability in Mbed TLS 2.x before 2.28.7 and 3.x before 3.5.2, allows attackers to cause a denial of service (DoS) via mbedtls_x509_set_extension().

