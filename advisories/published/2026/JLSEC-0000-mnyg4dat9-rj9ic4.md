```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dat9-rj9ic4"
modified = 2026-03-26T21:18:55.485Z
upstream = ["CVE-2016-3115"]
references = ["http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/session.c", "http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/session.c.diff?r1=1.281&r2=1.282&f=h", "http://lists.fedoraproject.org/pipermail/package-announce/2016-April/183101.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-April/183122.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/178838.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/179924.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/180491.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-May/184264.html", "http://packetstormsecurity.com/files/136234/OpenSSH-7.2p1-xauth-Command-Injection-Bypass.html", "http://rhn.redhat.com/errata/RHSA-2016-0465.html", "http://rhn.redhat.com/errata/RHSA-2016-0466.html", "http://seclists.org/fulldisclosure/2016/Mar/46", "http://seclists.org/fulldisclosure/2016/Mar/47", "http://www.openssh.com/txt/x11fwd.adv", "http://www.oracle.com/technetwork/topics/security/bulletinapr2016-2952098.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/ovmbulletinjul2016-3090546.html", "http://www.securityfocus.com/bid/84314", "http://www.securitytracker.com/id/1035249", "https://bto.bluecoat.com/security-advisory/sa121", "https://github.com/tintinweb/pub/tree/master/pocs/cve-2016-3115", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201612-18", "https://www.exploit-db.com/exploits/39569/", "https://www.freebsd.org/security/advisories/FreeBSD-SA-16:14.openssh.asc", "http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/session.c", "http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/session.c.diff?r1=1.281&r2=1.282&f=h", "http://lists.fedoraproject.org/pipermail/package-announce/2016-April/183101.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-April/183122.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/178838.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/179924.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-March/180491.html", "http://lists.fedoraproject.org/pipermail/package-announce/2016-May/184264.html", "http://packetstormsecurity.com/files/136234/OpenSSH-7.2p1-xauth-Command-Injection-Bypass.html", "http://rhn.redhat.com/errata/RHSA-2016-0465.html", "http://rhn.redhat.com/errata/RHSA-2016-0466.html", "http://seclists.org/fulldisclosure/2016/Mar/46", "http://seclists.org/fulldisclosure/2016/Mar/47", "http://www.openssh.com/txt/x11fwd.adv", "http://www.oracle.com/technetwork/topics/security/bulletinapr2016-2952098.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/ovmbulletinjul2016-3090546.html", "http://www.securityfocus.com/bid/84314", "http://www.securitytracker.com/id/1035249", "https://bto.bluecoat.com/security-advisory/sa121", "https://github.com/tintinweb/pub/tree/master/pocs/cve-2016-3115", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201612-18", "https://www.exploit-db.com/exploits/39569/", "https://www.freebsd.org/security/advisories/FreeBSD-SA-16:14.openssh.asc"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-3115"
imported = 2026-03-26T21:18:55.485Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-03-22T10:59:02.917Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-3115"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-3115"
```

# Multiple CRLF injection vulnerabilities in session.c in sshd in OpenSSH before 7.2p2 allow remote au...

Multiple CRLF injection vulnerabilities in session.c in sshd in OpenSSH before 7.2p2 allow remote authenticated users to bypass intended shell-command restrictions via crafted X11 forwarding data, related to the (1) do_authenticated1 and (2) session_x11_req functions.

