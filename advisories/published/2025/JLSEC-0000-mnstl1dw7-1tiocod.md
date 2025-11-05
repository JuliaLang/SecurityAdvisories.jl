```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl1dw7-1tiocod"
modified = 2025-11-05T03:28:19.351Z
upstream = ["CVE-2023-43787"]
references = ["https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43787", "https://bugzilla.redhat.com/show_bug.cgi?id=2242254", "http://www.openwall.com/lists/oss-security/2024/01/24/9", "https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43787", "https://bugzilla.redhat.com/show_bug.cgi?id=2242254", "https://jfrog.com/blog/xorg-libx11-vulns-cve-2023-43786-cve-2023-43787-part-two/", "https://lists.debian.org/debian-lts-announce/2023/10/msg00005.html", "https://security.netapp.com/advisory/ntap-20231103-0006/"]

[[affected]]
pkg = "Xorg_libX11_jll"
ranges = ["< 1.8.12+0"]

[[jlsec_sources]]
id = "CVE-2023-43787"
imported = 2025-11-05T03:28:19.351Z
modified = 2025-11-04T20:17:07.523Z
published = 2023-10-10T13:15:22.083Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-43787"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-43787"
```

# A vulnerability was found in libX11 due to an integer overflow within the XCreateImage() function

A vulnerability was found in libX11 due to an integer overflow within the XCreateImage() function. This flaw allows a local user to trigger an integer overflow and execute arbitrary code with elevated privileges.

