```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s11e-1m7ej8m"
modified = 2025-10-19T19:26:25.346Z
upstream = ["CVE-2021-31566"]
references = ["https://access.redhat.com/security/cve/CVE-2021-31566", "https://bugzilla.redhat.com/show_bug.cgi?id=2024237", "https://github.com/libarchive/libarchive/commit/b41daecb5ccb4c8e3b2c53fd6147109fc12c3043", "https://github.com/libarchive/libarchive/issues/1566", "https://lists.debian.org/debian-lts-announce/2022/11/msg00030.html", "https://access.redhat.com/security/cve/CVE-2021-31566", "https://bugzilla.redhat.com/show_bug.cgi?id=2024237", "https://github.com/libarchive/libarchive/commit/b41daecb5ccb4c8e3b2c53fd6147109fc12c3043", "https://github.com/libarchive/libarchive/issues/1566", "https://lists.debian.org/debian-lts-announce/2022/11/msg00030.html"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.5.2+0"]

[[jlsec_sources]]
id = "CVE-2021-31566"
imported = 2025-10-19T19:26:25.346Z
modified = 2024-11-21T06:05:55.217Z
published = 2022-08-23T16:15:09.337Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-31566"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-31566"
```

# An improper link resolution flaw can occur while extracting an archive leading to changing modes, ti...

An improper link resolution flaw can occur while extracting an archive leading to changing modes, times, access control lists, and flags of a file outside of the archive. An attacker may provide a malicious archive to a victim user, who would trigger this flaw when trying to extract the archive. A local attacker may use this flaw to gain more privileges in a system.

