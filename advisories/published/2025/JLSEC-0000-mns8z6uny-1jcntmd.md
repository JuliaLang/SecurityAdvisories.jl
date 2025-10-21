```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6uny-1jcntmd"
modified = 2025-10-21T17:21:19.294Z
upstream = ["CVE-2020-21583"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=786804", "https://packetstormsecurity.com/files/132061/hwclock-Privilege-Escalation.html", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=786804", "https://packetstormsecurity.com/files/132061/hwclock-Privilege-Escalation.html", "https://security.netapp.com/advisory/ntap-20241220-0006/"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2020-21583"
imported = 2025-10-21T17:21:19.294Z
modified = 2024-12-20T13:15:18.357Z
published = 2023-08-22T19:16:13.890Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-21583"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-21583"
```

# An issue was discovered in hwclock.13-v2.27 allows attackers to gain escalated privlidges or execute...

An issue was discovered in hwclock.13-v2.27 allows attackers to gain escalated privlidges or execute arbitrary commands via the path parameter when setting the date.

