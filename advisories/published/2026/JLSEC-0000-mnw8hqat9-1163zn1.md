```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hqat9-1163zn1"
modified = 2026-01-30T03:51:22.941Z
upstream = ["CVE-2026-24061"]
references = ["https://codeberg.org/inetutils/inetutils/commit/ccba9f748aa8d50a38d7748e2e60362edd6a32cc", "https://codeberg.org/inetutils/inetutils/commit/fd702c02497b2f398e739e3119bed0b23dd7aa7b", "https://lists.gnu.org/archive/html/bug-inetutils/2026-01/msg00004.html", "https://www.gnu.org/software/inetutils/", "https://www.openwall.com/lists/oss-security/2026/01/20/2", "https://www.openwall.com/lists/oss-security/2026/01/20/8", "http://www.openwall.com/lists/oss-security/2026/01/22/1", "https://lists.debian.org/debian-lts-announce/2026/01/msg00025.html", "https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2026-24061", "https://www.labs.greynoise.io/grimoire/2026-01-22-f-around-and-find-out-18-hours-of-unsolicited-houseguests/index.html", "https://www.openwall.com/lists/oss-security/2026/01/20/2#:~:text=root@...a%3A~%20USER='"]

[[affected]]
pkg = "telnet_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-24061"
imported = 2026-01-30T03:51:22.941Z
modified = 2026-01-29T19:16:19.890Z
published = 2026-01-21T07:16:01.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-24061"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-24061"
```

# telnetd in GNU Inetutils through 2.7 allows remote authentication bypass via a "-f root" value for t...

telnetd in GNU Inetutils through 2.7 allows remote authentication bypass via a "-f root" value for the USER environment variable.

