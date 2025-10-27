```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s11d-wqwurz"
modified = 2025-10-19T19:26:25.345Z
upstream = ["CVE-2021-23177"]
references = ["https://access.redhat.com/security/cve/CVE-2021-23177", "https://bugzilla.redhat.com/show_bug.cgi?id=2024245", "https://github.com/libarchive/libarchive/commit/fba4f123cc456d2b2538f811bb831483bf336bad", "https://github.com/libarchive/libarchive/issues/1565", "https://lists.debian.org/debian-lts-announce/2022/11/msg00030.html", "https://access.redhat.com/security/cve/CVE-2021-23177", "https://bugzilla.redhat.com/show_bug.cgi?id=2024245", "https://github.com/libarchive/libarchive/commit/fba4f123cc456d2b2538f811bb831483bf336bad", "https://github.com/libarchive/libarchive/issues/1565", "https://lists.debian.org/debian-lts-announce/2022/11/msg00030.html"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.5.2+0"]

[[jlsec_sources]]
id = "CVE-2021-23177"
imported = 2025-10-19T19:26:25.345Z
modified = 2024-11-21T05:51:19.970Z
published = 2022-08-23T16:15:09.280Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-23177"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-23177"
```

# An improper link resolution flaw while extracting an archive can lead to changing the access control...

An improper link resolution flaw while extracting an archive can lead to changing the access control list (ACL) of the target of the link. An attacker may provide a malicious archive to a victim user, who would trigger this flaw when trying to extract the archive. A local attacker may use this flaw to change the ACL of a file on the system and gain more privileges.

