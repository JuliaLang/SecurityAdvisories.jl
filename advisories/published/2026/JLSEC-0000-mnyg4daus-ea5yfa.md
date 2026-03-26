```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4daus-ea5yfa"
modified = 2026-03-26T21:18:55.540Z
upstream = ["CVE-2016-10009"]
references = ["http://packetstormsecurity.com/files/140261/OpenSSH-Arbitrary-Library-Loading.html", "http://packetstormsecurity.com/files/173661/OpenSSH-Forwarded-SSH-Agent-Remote-Code-Execution.html", "http://seclists.org/fulldisclosure/2023/Jul/31", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.openwall.com/lists/oss-security/2023/07/19/9", "http://www.openwall.com/lists/oss-security/2023/07/20/1", "http://www.securityfocus.com/bid/94968", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://bugs.chromium.org/p/project-zero/issues/detail?id=1009", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/9476ce1dd37d3c3218d5640b74c34c65e5f4efe5", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:01.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://usn.ubuntu.com/3538-1/", "https://www.exploit-db.com/exploits/40963/", "https://www.openssh.com/txt/release-7.4", "http://packetstormsecurity.com/files/140261/OpenSSH-Arbitrary-Library-Loading.html", "http://packetstormsecurity.com/files/173661/OpenSSH-Forwarded-SSH-Agent-Remote-Code-Execution.html", "http://seclists.org/fulldisclosure/2023/Jul/31", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.openwall.com/lists/oss-security/2023/07/19/9", "http://www.openwall.com/lists/oss-security/2023/07/20/1", "http://www.securityfocus.com/bid/94968", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://bugs.chromium.org/p/project-zero/issues/detail?id=1009", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/9476ce1dd37d3c3218d5640b74c34c65e5f4efe5", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:01.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://usn.ubuntu.com/3538-1/", "https://www.exploit-db.com/exploits/40963/", "https://www.openssh.com/txt/release-7.4"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-10009"
imported = 2026-03-26T21:18:55.540Z
modified = 2025-04-12T10:46:40.837Z
published = 2017-01-05T02:59:03.057Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10009"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10009"
```

# Untrusted search path vulnerability in ssh-agent.c in ssh-agent in OpenSSH before 7.4 allows remote ...

Untrusted search path vulnerability in ssh-agent.c in ssh-agent in OpenSSH before 7.4 allows remote attackers to execute arbitrary local PKCS#11 modules by leveraging control over a forwarded agent-socket.

