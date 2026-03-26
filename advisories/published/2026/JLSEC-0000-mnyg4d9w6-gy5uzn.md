```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d9w6-gy5uzn"
modified = 2026-03-26T21:18:54.294Z
upstream = ["CVE-2010-5107"]
references = ["http://marc.info/?l=bugtraq&m=144050155601375&w=2", "http://rhn.redhat.com/errata/RHSA-2013-1591.html", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/servconf.c?r1=1.234#rev1.234", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/sshd_config.5?r1=1.156#rev1.156", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/sshd_config?r1=1.89#rev1.89", "http://www.openwall.com/lists/oss-security/2013/02/07/3", "http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinjan2016-2867209.html", "http://www.securityfocus.com/bid/58162", "https://bugzilla.redhat.com/show_bug.cgi?id=908707", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19515", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19595", "http://marc.info/?l=bugtraq&m=144050155601375&w=2", "http://rhn.redhat.com/errata/RHSA-2013-1591.html", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/servconf.c?r1=1.234#rev1.234", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/sshd_config.5?r1=1.156#rev1.156", "http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/sshd_config?r1=1.89#rev1.89", "http://www.openwall.com/lists/oss-security/2013/02/07/3", "http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinjan2016-2867209.html", "http://www.securityfocus.com/bid/58162", "https://bugzilla.redhat.com/show_bug.cgi?id=908707", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19515", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19595"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2010-5107"
imported = 2026-03-26T21:18:54.294Z
modified = 2025-04-11T00:51:21.963Z
published = 2013-03-07T20:55:01.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2010-5107"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2010-5107"
```

# The default configuration of OpenSSH through 6.1 enforces a fixed time limit between establishing a ...

The default configuration of OpenSSH through 6.1 enforces a fixed time limit between establishing a TCP connection and completing a login, which makes it easier for remote attackers to cause a denial of service (connection-slot exhaustion) by periodically making many new TCP connections.

