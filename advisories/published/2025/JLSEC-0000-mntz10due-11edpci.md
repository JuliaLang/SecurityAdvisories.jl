```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntz10due-11edpci"
modified = 2025-12-04T03:33:59.702Z
upstream = ["CVE-2025-4598"]
references = ["https://access.redhat.com/errata/RHSA-2025:22660", "https://access.redhat.com/security/cve/CVE-2025-4598", "https://bugzilla.redhat.com/show_bug.cgi?id=2369242", "https://www.openwall.com/lists/oss-security/2025/05/29/3", "http://seclists.org/fulldisclosure/2025/Jun/9", "http://www.openwall.com/lists/oss-security/2025/06/05/1", "http://www.openwall.com/lists/oss-security/2025/06/05/3", "http://www.openwall.com/lists/oss-security/2025/08/18/3", "https://blogs.oracle.com/linux/post/analysis-of-cve-2025-4598", "https://ciq.com/blog/the-real-danger-of-systemd-coredump-cve-2025-4598/", "https://lists.debian.org/debian-lts-announce/2025/07/msg00022.html", "https://www.openwall.com/lists/oss-security/2025/08/18/3"]

[[affected]]
pkg = "systemd_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-4598"
imported = 2025-12-04T03:33:59.702Z
modified = 2025-12-03T12:15:49.507Z
published = 2025-05-30T14:15:23.557Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-4598"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-4598"
```

# A vulnerability was found in systemd-coredump

A vulnerability was found in systemd-coredump. This flaw allows an attacker to force a SUID process to crash and replace it with a non-SUID binary to access the original's privileged process coredump, allowing the attacker to read sensitive data, such as /etc/shadow content, loaded by the original process.

A SUID binary or process has a special type of permission, which allows the process to run with the file owner's permissions, regardless of the user executing the binary. This allows the process to access more restricted data than unprivileged users or processes would be able to. An attacker can leverage this flaw by forcing a SUID process to crash and force the Linux kernel to recycle the process PID before systemd-coredump can analyze the /proc/pid/auxv file. If the attacker wins the race condition, they gain access to the original's SUID process coredump file. They can read sensitive content loaded into memory by the original binary, affecting data confidentiality.

