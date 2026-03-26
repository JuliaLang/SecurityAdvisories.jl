```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d83a-1nodgwq"
modified = 2026-03-26T21:18:51.958Z
upstream = ["CVE-2008-4109"]
references = ["http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=498678", "http://lists.opensuse.org/opensuse-security-announce/2008-10/msg00004.html", "http://secunia.com/advisories/31885", "http://secunia.com/advisories/32080", "http://secunia.com/advisories/32181", "http://www.debian.org/security/2008/dsa-1638", "http://www.openwall.com/lists/oss-security/2024/07/01/3", "http://www.securitytracker.com/id?1020891", "http://www.ubuntu.com/usn/usn-649-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/45202", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=498678", "http://lists.opensuse.org/opensuse-security-announce/2008-10/msg00004.html", "http://secunia.com/advisories/31885", "http://secunia.com/advisories/32080", "http://secunia.com/advisories/32181", "http://www.debian.org/security/2008/dsa-1638", "http://www.openwall.com/lists/oss-security/2024/07/01/3", "http://www.securitytracker.com/id?1020891", "http://www.ubuntu.com/usn/usn-649-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/45202"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2008-4109"
imported = 2026-03-26T21:18:51.958Z
modified = 2025-04-09T00:30:58.490Z
published = 2008-09-18T15:04:27.437Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2008-4109"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2008-4109"
```

# A certain Debian patch for OpenSSH before 4.3p2-9etch3 on etch; before 4.6p1-1 on sid and lenny; and...

A certain Debian patch for OpenSSH before 4.3p2-9etch3 on etch; before 4.6p1-1 on sid and lenny; and on other distributions such as SUSE uses functions that are not async-signal-safe in the signal handler for login timeouts, which allows remote attackers to cause a denial of service (connection slot exhaustion) via multiple login attempts. NOTE: this issue exists because of an incorrect fix for CVE-2006-5051.

