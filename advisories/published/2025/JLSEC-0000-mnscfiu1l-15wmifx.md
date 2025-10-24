```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnscfiu1l-15wmifx"
modified = 2025-10-24T03:21:50.745Z
upstream = ["CVE-2025-26465"]
references = ["https://access.redhat.com/errata/RHSA-2025:16823", "https://access.redhat.com/errata/RHSA-2025:3837", "https://access.redhat.com/errata/RHSA-2025:6993", "https://access.redhat.com/errata/RHSA-2025:8385", "https://access.redhat.com/security/cve/CVE-2025-26465", "https://access.redhat.com/solutions/7109879", "https://bugzilla.redhat.com/show_bug.cgi?id=2344780", "https://seclists.org/oss-sec/2025/q1/144", "https://blog.qualys.com/vulnerabilities-threat-research/2025/02/18/qualys-tru-discovers-two-vulnerabilities-in-openssh-cve-2025-26465-cve-2025-26466", "https://bugzilla.suse.com/show_bug.cgi?id=1237040", "https://ftp.openbsd.org/pub/OpenBSD/patches/7.6/common/008_ssh.patch.sig", "https://lists.debian.org/debian-lts-announce/2025/02/msg00020.html", "https://lists.mindrot.org/pipermail/openssh-unix-announce/2025-February/000161.html", "https://security-tracker.debian.org/tracker/CVE-2025-26465", "https://security.netapp.com/advisory/ntap-20250228-0003/", "https://ubuntu.com/security/CVE-2025-26465", "https://www.openssh.com/releasenotes.html#9.9p2", "https://www.openwall.com/lists/oss-security/2025/02/18/1", "https://www.openwall.com/lists/oss-security/2025/02/18/4", "https://www.theregister.com/2025/02/18/openssh_vulnerabilities_mitm_dos/", "https://www.vicarius.io/vsociety/posts/cve-2025-26465-detect-vulnerable-openssh", "https://www.vicarius.io/vsociety/posts/cve-2025-26465-mitigate-vulnerable-openssh", "https://seclists.org/oss-sec/2025/q1/144"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = [">= 9.3.2+0, < 9.9.1+0"]

[[jlsec_sources]]
id = "CVE-2025-26465"
imported = 2025-10-24T03:21:50.727Z
modified = 2025-10-23T03:15:30.320Z
published = 2025-02-18T19:15:29.230Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-26465"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-26465"
```

# A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is enabled

A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is enabled. A machine-in-the-middle attack can be performed by a malicious machine impersonating a legit server. This issue occurs due to how OpenSSH mishandles error codes in specific conditions when verifying the host key. For an attack to be considered successful, the attacker needs to manage to exhaust the client's memory resource first, turning the attack complexity high.

