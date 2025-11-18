```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntc5tn2q-j6yvyo"
modified = 2025-11-18T03:30:01.106Z
upstream = ["CVE-2023-51767"]
references = ["https://access.redhat.com/security/cve/CVE-2023-51767", "https://arxiv.org/abs/2309.02545", "https://bugzilla.redhat.com/show_bug.cgi?id=2255850", "https://github.com/openssh/openssh-portable/blob/8241b9c0529228b4b86d88b1a6076fb9f97e4a99/auth-passwd.c#L77", "https://github.com/openssh/openssh-portable/blob/8241b9c0529228b4b86d88b1a6076fb9f97e4a99/monitor.c#L878", "https://security.netapp.com/advisory/ntap-20240125-0006/", "https://ubuntu.com/security/CVE-2023-51767", "https://www.openwall.com/lists/oss-security/2025/09/22/1", "http://www.openwall.com/lists/oss-security/2025/09/22/1", "http://www.openwall.com/lists/oss-security/2025/09/22/2", "http://www.openwall.com/lists/oss-security/2025/09/23/4", "http://www.openwall.com/lists/oss-security/2025/09/24/4", "http://www.openwall.com/lists/oss-security/2025/10/01/1", "http://www.openwall.com/lists/oss-security/2025/10/01/2", "https://access.redhat.com/security/cve/CVE-2023-51767", "https://arxiv.org/abs/2309.02545", "https://bugzilla.redhat.com/show_bug.cgi?id=2255850", "https://github.com/openssh/openssh-portable/blob/8241b9c0529228b4b86d88b1a6076fb9f97e4a99/auth-passwd.c#L77", "https://github.com/openssh/openssh-portable/blob/8241b9c0529228b4b86d88b1a6076fb9f97e4a99/monitor.c#L878", "https://security.netapp.com/advisory/ntap-20240125-0006/", "https://ubuntu.com/security/CVE-2023-51767"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-51767"
imported = 2025-11-18T03:30:01.088Z
modified = 2025-11-17T16:15:44.990Z
published = 2023-12-24T07:15:07.410Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51767"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51767"
```

# OpenSSH through 10.0, when common types of DRAM are used, might allow row hammer attacks (for authen...

OpenSSH through 10.0, when common types of DRAM are used, might allow row hammer attacks (for authentication bypass) because the integer value of authenticated in mm_answer_authpassword does not resist flips of a single bit. NOTE: this is applicable to a certain threat model of attacker-victim co-location in which the attacker has user privileges. NOTE: this is disputed by the Supplier, who states "we do not consider it to be the application's responsibility to defend against platform architectural weaknesses."

