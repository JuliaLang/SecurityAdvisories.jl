```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jb18-16u1kov"
modified = 2025-11-04T03:26:35.420Z
upstream = ["CVE-2023-3019"]
references = ["https://access.redhat.com/errata/RHSA-2024:0135", "https://access.redhat.com/errata/RHSA-2024:0404", "https://access.redhat.com/errata/RHSA-2024:0569", "https://access.redhat.com/errata/RHSA-2024:2135", "https://access.redhat.com/security/cve/CVE-2023-3019", "https://bugzilla.redhat.com/show_bug.cgi?id=2222351", "https://access.redhat.com/errata/RHSA-2024:0135", "https://access.redhat.com/errata/RHSA-2024:0404", "https://access.redhat.com/errata/RHSA-2024:0569", "https://access.redhat.com/errata/RHSA-2024:2135", "https://access.redhat.com/security/cve/CVE-2023-3019", "https://bugzilla.redhat.com/show_bug.cgi?id=2222351", "https://lists.debian.org/debian-lts-announce/2025/04/msg00042.html", "https://security.netapp.com/advisory/ntap-20230831-0005/"]

[[affected]]
pkg = "Qemu_jll"
ranges = ["*"]
[[affected]]
pkg = "Qemu_static_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-3019"
imported = 2025-11-04T03:26:35.420Z
modified = 2025-11-03T20:16:01.753Z
published = 2023-07-24T16:15:12.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3019"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3019"
```

# A DMA reentrancy issue leading to a use-after-free error was found in the e1000e NIC emulation code ...

A DMA reentrancy issue leading to a use-after-free error was found in the e1000e NIC emulation code in QEMU. This issue could allow a privileged guest user to crash the QEMU process on the host, resulting in a denial of service.

