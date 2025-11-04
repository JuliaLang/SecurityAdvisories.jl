```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jh3n-1rn6any"
modified = 2025-11-04T03:26:43.283Z
upstream = ["CVE-2023-5088"]
references = ["https://access.redhat.com/errata/RHSA-2024:2135", "https://access.redhat.com/errata/RHSA-2024:2962", "https://access.redhat.com/security/cve/CVE-2023-5088", "https://bugzilla.redhat.com/show_bug.cgi?id=2247283", "https://lore.kernel.org/all/20230921160712.99521-1-simon.rowe@nutanix.com/T/", "https://access.redhat.com/errata/RHSA-2024:2135", "https://access.redhat.com/errata/RHSA-2024:2962", "https://access.redhat.com/security/cve/CVE-2023-5088", "https://bugzilla.redhat.com/show_bug.cgi?id=2247283", "https://lists.debian.org/debian-lts-announce/2024/03/msg00012.html", "https://lists.debian.org/debian-lts-announce/2025/04/msg00042.html", "https://lore.kernel.org/all/20230921160712.99521-1-simon.rowe@nutanix.com/T/", "https://security.netapp.com/advisory/ntap-20231208-0005/"]

[[affected]]
pkg = "Qemu_jll"
ranges = ["*"]
[[affected]]
pkg = "Qemu_static_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-5088"
imported = 2025-11-04T03:26:43.283Z
modified = 2025-11-03T20:16:06.617Z
published = 2023-11-03T14:15:08.560Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5088"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5088"
```

# A bug in QEMU could cause a guest I/O operation otherwise addressed to an arbitrary disk offset to b...

A bug in QEMU could cause a guest I/O operation otherwise addressed to an arbitrary disk offset to be targeted to offset 0 instead (potentially overwriting the VM's boot code). This could be used, for example, by L2 guests with a virtual disk (vdiskL2) stored on a virtual disk of an L1 (vdiskL1) hypervisor to read and/or write data to LBA 0 of vdiskL1, potentially gaining control of L1 at its next reboot.

