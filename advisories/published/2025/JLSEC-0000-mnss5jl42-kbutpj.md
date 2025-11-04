```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jl42-kbutpj"
modified = 2025-11-04T03:26:48.482Z
upstream = ["CVE-2023-6693"]
references = ["https://access.redhat.com/errata/RHSA-2024:2962", "https://access.redhat.com/errata/RHSA-2025:4492", "https://access.redhat.com/security/cve/CVE-2023-6693", "https://bugzilla.redhat.com/show_bug.cgi?id=2254580", "https://access.redhat.com/errata/RHSA-2024:2962", "https://access.redhat.com/security/cve/CVE-2023-6693", "https://bugzilla.redhat.com/show_bug.cgi?id=2254580", "https://lists.debian.org/debian-lts-announce/2025/04/msg00042.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/OYGUN5HVOXESW7MSNM44E4AE2VNXQB6Y/", "https://security.netapp.com/advisory/ntap-20240208-0004/"]

[[affected]]
pkg = "Qemu_jll"
ranges = ["*"]
[[affected]]
pkg = "Qemu_static_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-6693"
imported = 2025-11-04T03:26:48.482Z
modified = 2025-11-03T20:16:07.487Z
published = 2024-01-02T10:15:08.930Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6693"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6693"
```

# A stack based buffer overflow was found in the virtio-net device of QEMU

A stack based buffer overflow was found in the virtio-net device of QEMU. This issue occurs when flushing TX in the virtio_net_flush_tx function if guest features VIRTIO_NET_F_HASH_REPORT, VIRTIO_F_VERSION_1 and VIRTIO_NET_F_MRG_RXBUF are enabled. This could allow a malicious user to overwrite local variables allocated on the stack. Specifically, the `out_sg` variable could be used to read a part of process memory and send it to the wire, causing an information leak.

