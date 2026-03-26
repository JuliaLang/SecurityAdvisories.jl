```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4davn-ltidj2"
modified = 2026-03-26T21:18:55.571Z
upstream = ["CVE-2016-1908"]
references = ["http://openwall.com/lists/oss-security/2016/01/15/13", "http://rhn.redhat.com/errata/RHSA-2016-0465.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://www.openssh.com/txt/release-7.2", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/84427", "http://www.securitytracker.com/id/1034705", "https://anongit.mindrot.org/openssh.git/commit/?id=ed4ce82dbfa8a3a3c8ea6fa0db113c71e234416c", "https://bugzilla.redhat.com/show_bug.cgi?id=1298741", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201612-18", "http://openwall.com/lists/oss-security/2016/01/15/13", "http://rhn.redhat.com/errata/RHSA-2016-0465.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://www.openssh.com/txt/release-7.2", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/84427", "http://www.securitytracker.com/id/1034705", "https://anongit.mindrot.org/openssh.git/commit/?id=ed4ce82dbfa8a3a3c8ea6fa0db113c71e234416c", "https://bugzilla.redhat.com/show_bug.cgi?id=1298741", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201612-18"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-1908"
imported = 2026-03-26T21:18:55.571Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T18:59:00.167Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-1908"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-1908"
```

# The client in OpenSSH before 7.2 mishandles failed cookie generation for untrusted X11 forwarding an...

The client in OpenSSH before 7.2 mishandles failed cookie generation for untrusted X11 forwarding and relies on the local X11 server for access-control decisions, which allows remote X11 clients to trigger a fallback and obtain trusted X11 forwarding privileges by leveraging configuration issues on this X11 server, as demonstrated by lack of the SECURITY extension on this X11 server.

