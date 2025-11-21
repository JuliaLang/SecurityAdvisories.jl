```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6xnfw-t16kf9"
modified = 2025-11-04T04:05:44.300Z
upstream = ["CVE-2024-12086"]
references = ["https://access.redhat.com/security/cve/CVE-2024-12086", "https://bugzilla.redhat.com/show_bug.cgi?id=2330577", "https://kb.cert.org/vuls/id/952657", "https://lists.debian.org/debian-lts-announce/2025/01/msg00008.html", "https://security.netapp.com/advisory/ntap-20250131-0002/", "https://www.kb.cert.org/vuls/id/952657", "https://github.com/google/security-research/security/advisories/GHSA-p5pg-x43v-mvqj"]

[[affected]]
pkg = "rsync_jll"
ranges = ["< 3.4.0+0"]

[[jlsec_sources]]
id = "CVE-2024-12086"
imported = 2025-11-04T04:05:44.300Z
modified = 2025-11-03T22:16:39.200Z
published = 2025-01-14T18:15:25.297Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-12086"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-12086"
```

# A flaw was found in rsync

A flaw was found in rsync. It could allow a server to enumerate the contents of an arbitrary file from the client's machine. This issue occurs when files are being copied from a client to a server. During this process, the rsync server will send checksums of local data to the client to compare with in order to determine what data needs to be sent to the server. By sending specially constructed checksum values for arbitrary files, an attacker may be able to reconstruct the data of those files byte-by-byte based on the responses from the client.

