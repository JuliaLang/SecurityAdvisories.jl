```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5j5h6-1y83csh"
modified = 2025-11-04T03:26:28.218Z
upstream = ["CVE-2023-1544"]
references = ["https://access.redhat.com/security/cve/CVE-2023-1544", "https://bugzilla.redhat.com/show_bug.cgi?id=2180364", "https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg00206.html", "https://security.netapp.com/advisory/ntap-20230511-0005/", "https://access.redhat.com/security/cve/CVE-2023-1544", "https://bugzilla.redhat.com/show_bug.cgi?id=2180364", "https://lists.debian.org/debian-lts-announce/2025/04/msg00042.html", "https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg00206.html", "https://security.netapp.com/advisory/ntap-20230511-0005/"]

[[affected]]
pkg = "Qemu_jll"
ranges = ["< 7.2.9+0"]
[[affected]]
pkg = "Qemu_static_jll"
ranges = ["< 7.2.9+0"]

[[jlsec_sources]]
id = "CVE-2023-1544"
imported = 2025-11-04T03:26:28.218Z
modified = 2025-11-03T20:15:59.780Z
published = 2023-03-23T20:15:14.497Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-1544"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-1544"
```

# A flaw was found in the QEMU implementation of VMWare's paravirtual RDMA device

A flaw was found in the QEMU implementation of VMWare's paravirtual RDMA device. This flaw allows a crafted guest driver to allocate and initialize a huge number of page tables to be used as a ring of descriptors for CQ and async events, potentially leading to an out-of-bounds read and crash of QEMU.

