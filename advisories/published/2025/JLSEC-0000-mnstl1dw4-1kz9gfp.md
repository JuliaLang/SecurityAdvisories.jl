```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl1dw4-1kz9gfp"
modified = 2025-11-05T03:28:19.348Z
upstream = ["CVE-2023-43785"]
references = ["https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43785", "https://bugzilla.redhat.com/show_bug.cgi?id=2242252", "https://access.redhat.com/errata/RHSA-2024:2145", "https://access.redhat.com/errata/RHSA-2024:2973", "https://access.redhat.com/security/cve/CVE-2023-43785", "https://bugzilla.redhat.com/show_bug.cgi?id=2242252", "https://lists.debian.org/debian-lts-announce/2023/10/msg00004.html", "https://security.netapp.com/advisory/ntap-20231103-0006/"]

[[affected]]
pkg = "Xorg_libX11_jll"
ranges = ["< 1.8.12+0"]

[[jlsec_sources]]
id = "CVE-2023-43785"
imported = 2025-11-05T03:28:19.348Z
modified = 2025-11-04T20:17:07.240Z
published = 2023-10-10T13:15:21.877Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-43785"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-43785"
```

# A vulnerability was found in libX11 due to a boundary condition within the _XkbReadKeySyms() functio...

A vulnerability was found in libX11 due to a boundary condition within the _XkbReadKeySyms() function. This flaw allows a local user to trigger an out-of-bounds read error and read the contents of memory on the system.

