```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6xnfv-qrwrxj"
modified = 2025-11-04T04:05:44.299Z
upstream = ["CVE-2024-12085"]
references = ["https://access.redhat.com/errata/RHSA-2025:0324", "https://access.redhat.com/errata/RHSA-2025:0325", "https://access.redhat.com/errata/RHSA-2025:0637", "https://access.redhat.com/errata/RHSA-2025:0688", "https://access.redhat.com/errata/RHSA-2025:0714", "https://access.redhat.com/errata/RHSA-2025:0774", "https://access.redhat.com/errata/RHSA-2025:0787", "https://access.redhat.com/errata/RHSA-2025:0790", "https://access.redhat.com/errata/RHSA-2025:0849", "https://access.redhat.com/errata/RHSA-2025:0884", "https://access.redhat.com/errata/RHSA-2025:0885", "https://access.redhat.com/errata/RHSA-2025:1120", "https://access.redhat.com/errata/RHSA-2025:1123", "https://access.redhat.com/errata/RHSA-2025:1128", "https://access.redhat.com/errata/RHSA-2025:1225", "https://access.redhat.com/errata/RHSA-2025:1227", "https://access.redhat.com/errata/RHSA-2025:1242", "https://access.redhat.com/errata/RHSA-2025:1451", "https://access.redhat.com/errata/RHSA-2025:2701", "https://access.redhat.com/security/cve/CVE-2024-12085", "https://bugzilla.redhat.com/show_bug.cgi?id=2330539", "https://kb.cert.org/vuls/id/952657", "https://lists.debian.org/debian-lts-announce/2025/01/msg00008.html", "https://security.netapp.com/advisory/ntap-20250131-0002/", "https://www.kb.cert.org/vuls/id/952657", "https://github.com/google/security-research/security/advisories/GHSA-p5pg-x43v-mvqj"]

[[affected]]
pkg = "rsync_jll"
ranges = ["< 3.3.0+0"]

[[jlsec_sources]]
id = "CVE-2024-12085"
imported = 2025-11-04T04:05:44.299Z
modified = 2025-11-03T22:16:39.030Z
published = 2025-01-14T18:15:25.123Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-12085"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-12085"
```

# A flaw was found in rsync which could be triggered when rsync compares file checksums

A flaw was found in rsync which could be triggered when rsync compares file checksums. This flaw allows an attacker to manipulate the checksum length (s2length) to cause a comparison between a checksum and uninitialized memory and leak one byte of uninitialized stack data at a time.

