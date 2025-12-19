```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgokn8-1vrrk3z"
modified = 2025-12-19T03:35:52.196Z
upstream = ["CVE-2019-6111"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-06/msg00058.html", "http://www.openwall.com/lists/oss-security/2019/04/18/1", "http://www.openwall.com/lists/oss-security/2022/08/02/1", "http://www.securityfocus.com/bid/106741", "https://access.redhat.com/errata/RHSA-2019:3702", "https://bugzilla.redhat.com/show_bug.cgi?id=1677794", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://lists.apache.org/thread.html/c45d9bc90700354b58fb7455962873c44229841880dcb64842fa7d23%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/c7301cab36a86825359e1b725fc40304d1df56dc6d107c1fe885148b%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/d540139359de999b0f1c87d05b715be4d7d4bec771e1ae55153c5c7a%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/e47597433b351d6e01a5d68d610b4ba195743def9730e49561e8cf3f%40%3Cdev.mina.apache.org%3E", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3YVQ2BPTOVDCFDVNC2GGF5P5ISFG37G/", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://usn.ubuntu.com/3885-2/", "https://www.debian.org/security/2019/dsa-4387", "https://www.exploit-db.com/exploits/46193/", "https://www.freebsd.org/security/advisories/FreeBSD-EN-19:10.scp.asc", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html", "http://lists.opensuse.org/opensuse-security-announce/2019-06/msg00058.html", "http://www.openwall.com/lists/oss-security/2019/04/18/1", "http://www.openwall.com/lists/oss-security/2022/08/02/1", "http://www.securityfocus.com/bid/106741", "https://access.redhat.com/errata/RHSA-2019:3702", "https://bugzilla.redhat.com/show_bug.cgi?id=1677794", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/src/usr.bin/ssh/scp.c", "https://lists.apache.org/thread.html/c45d9bc90700354b58fb7455962873c44229841880dcb64842fa7d23%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/c7301cab36a86825359e1b725fc40304d1df56dc6d107c1fe885148b%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/d540139359de999b0f1c87d05b715be4d7d4bec771e1ae55153c5c7a%40%3Cdev.mina.apache.org%3E", "https://lists.apache.org/thread.html/e47597433b351d6e01a5d68d610b4ba195743def9730e49561e8cf3f%40%3Cdev.mina.apache.org%3E", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/W3YVQ2BPTOVDCFDVNC2GGF5P5ISFG37G/", "https://security.gentoo.org/glsa/201903-16", "https://security.netapp.com/advisory/ntap-20190213-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://usn.ubuntu.com/3885-2/", "https://www.debian.org/security/2019/dsa-4387", "https://www.exploit-db.com/exploits/46193/", "https://www.freebsd.org/security/advisories/FreeBSD-EN-19:10.scp.asc", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2019-6111"
imported = 2025-12-19T03:35:52.196Z
modified = 2025-12-18T15:15:48.147Z
published = 2019-01-31T18:29:00.867Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-6111"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-6111"
```

# An issue was discovered in OpenSSH 7.9

An issue was discovered in OpenSSH 7.9. Due to the scp implementation being derived from 1983 rcp, the server chooses which files/directories are sent to the client. However, the scp client only performs cursory validation of the object name returned (only directory traversal attacks are prevented). A malicious scp server (or Man-in-The-Middle attacker) can overwrite arbitrary files in the scp client target directory. If recursive operation (-r) is performed, the server can manipulate subdirectories as well (for example, to overwrite the .ssh/authorized_keys file).

