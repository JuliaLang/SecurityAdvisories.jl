```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl1dw6-1z0lfl9"
modified = 2025-11-05T03:28:19.350Z
upstream = ["CVE-2023-43786"]
references = ["https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43786", "https://bugzilla.redhat.com/show_bug.cgi?id=2242253", "http://www.openwall.com/lists/oss-security/2024/01/24/9", "https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43786", "https://bugzilla.redhat.com/show_bug.cgi?id=2242253", "https://lists.debian.org/debian-lts-announce/2023/10/msg00005.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/63IBRFLQVZSMOAZBZOBKFWJP26ILRAGQ/", "https://security.netapp.com/advisory/ntap-20231103-0006/"]

[[affected]]
pkg = "Xorg_libX11_jll"
ranges = ["< 1.8.12+0"]

[[jlsec_sources]]
id = "CVE-2023-43786"
imported = 2025-11-05T03:28:19.350Z
modified = 2025-11-04T20:17:07.390Z
published = 2023-10-10T13:15:22.023Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-43786"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-43786"
```

# A vulnerability was found in libX11 due to an infinite loop within the PutSubImage() function

A vulnerability was found in libX11 due to an infinite loop within the PutSubImage() function. This flaw allows a local user to consume all available system resources and cause a denial of service condition.

