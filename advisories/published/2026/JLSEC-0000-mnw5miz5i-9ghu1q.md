```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw5miz5i-9ghu1q"
modified = 2026-01-28T03:42:20.790Z
upstream = ["CVE-2026-24061"]
references = ["https://www.gnu.org/software/inetutils/", "https://www.openwall.com/lists/oss-security/2026/01/20/2", "https://www.openwall.com/lists/oss-security/2026/01/20/8", "http://www.openwall.com/lists/oss-security/2026/01/22/1", "https://lists.debian.org/debian-lts-announce/2026/01/msg00025.html", "https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2026-24061", "https://www.labs.greynoise.io/grimoire/2026-01-22-f-around-and-find-out-18-hours-of-unsolicited-houseguests/index.html", "https://www.openwall.com/lists/oss-security/2026/01/20/2#:~:text=root@...a%3A~%20USER='"]

[[affected]]
pkg = "telnet_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-24061"
imported = 2026-01-28T03:42:20.790Z
modified = 2026-01-27T16:17:18.170Z
published = 2026-01-21T07:16:01.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-24061"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-24061"
```

# telnetd in GNU Inetutils through 2.7 allows remote authentication bypass via a "-f root" value for t...

telnetd in GNU Inetutils through 2.7 allows remote authentication bypass via a "-f root" value for the USER environment variable.

