```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dauy-1oz71ua"
modified = 2026-03-26T21:18:55.546Z
upstream = ["CVE-2016-10010"]
references = ["http://packetstormsecurity.com/files/140262/OpenSSH-Local-Privilege-Escalation.html", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94972", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://bugs.chromium.org/p/project-zero/issues/detail?id=1010", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/c76fac666ea038753294f2ac94d310f8adece9ce", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:01.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.exploit-db.com/exploits/40962/", "https://www.openssh.com/txt/release-7.4", "http://packetstormsecurity.com/files/140262/OpenSSH-Local-Privilege-Escalation.html", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94972", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://bugs.chromium.org/p/project-zero/issues/detail?id=1010", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/c76fac666ea038753294f2ac94d310f8adece9ce", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:01.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.exploit-db.com/exploits/40962/", "https://www.openssh.com/txt/release-7.4"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-10010"
imported = 2026-03-26T21:18:55.546Z
modified = 2025-04-12T10:46:40.837Z
published = 2017-01-05T02:59:03.087Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10010"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10010"
```

# sshd in OpenSSH before 7.4, when privilege separation is not used, creates forwarded Unix-domain soc...

sshd in OpenSSH before 7.4, when privilege separation is not used, creates forwarded Unix-domain sockets as root, which might allow local users to gain privileges via unspecified vectors, related to serverloop.c.

