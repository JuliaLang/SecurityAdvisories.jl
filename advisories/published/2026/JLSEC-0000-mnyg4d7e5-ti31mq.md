```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d7e5-ti31mq"
modified = 2026-03-26T21:18:51.053Z
upstream = ["CVE-2007-4752"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=191321", "http://docs.info.apple.com/article.html?artnum=307562", "http://h20000.www2.hp.com/bizsupport/TechSupport/Document.jsp?objectID=c01271085", "http://lists.apple.com/archives/security-announce/2008/Mar/msg00001.html", "http://lists.opensuse.org/opensuse-security-announce/2007-10/msg00008.html", "http://secunia.com/advisories/27399", "http://secunia.com/advisories/29420", "http://secunia.com/advisories/30249", "http://secunia.com/advisories/31575", "http://secunia.com/advisories/32241", "http://security.gentoo.org/glsa/glsa-200711-02.xml", "http://securityreason.com/securityalert/3126", "http://support.avaya.com/elmodocs2/security/ASA-2008-399.htm", "http://www.debian.org/security/2008/dsa-1576", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:236", "http://www.openssh.com/txt/release-4.7", "http://www.redhat.com/support/errata/RHSA-2008-0855.html", "http://www.securityfocus.com/archive/1/479760/100/0/threaded", "http://www.securityfocus.com/archive/1/483748/100/200/threaded", "http://www.securityfocus.com/bid/25628", "http://www.ubuntu.com/usn/usn-566-1", "http://www.vupen.com/english/advisories/2007/3156", "http://www.vupen.com/english/advisories/2008/0924/references", "http://www.vupen.com/english/advisories/2008/2821", "https://bugzilla.redhat.com/show_bug.cgi?id=280471", "https://exchange.xforce.ibmcloud.com/vulnerabilities/36637", "https://issues.rpath.com/browse/RPL-1706", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10809", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A5599", "https://www.redhat.com/archives/fedora-package-announce/2007-October/msg00214.html", "http://bugs.gentoo.org/show_bug.cgi?id=191321", "http://docs.info.apple.com/article.html?artnum=307562", "http://h20000.www2.hp.com/bizsupport/TechSupport/Document.jsp?objectID=c01271085", "http://lists.apple.com/archives/security-announce/2008/Mar/msg00001.html", "http://lists.opensuse.org/opensuse-security-announce/2007-10/msg00008.html", "http://secunia.com/advisories/27399", "http://secunia.com/advisories/29420", "http://secunia.com/advisories/30249", "http://secunia.com/advisories/31575", "http://secunia.com/advisories/32241", "http://security.gentoo.org/glsa/glsa-200711-02.xml", "http://securityreason.com/securityalert/3126", "http://support.avaya.com/elmodocs2/security/ASA-2008-399.htm", "http://www.debian.org/security/2008/dsa-1576", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:236", "http://www.openssh.com/txt/release-4.7", "http://www.redhat.com/support/errata/RHSA-2008-0855.html", "http://www.securityfocus.com/archive/1/479760/100/0/threaded", "http://www.securityfocus.com/archive/1/483748/100/200/threaded", "http://www.securityfocus.com/bid/25628", "http://www.ubuntu.com/usn/usn-566-1", "http://www.vupen.com/english/advisories/2007/3156", "http://www.vupen.com/english/advisories/2008/0924/references", "http://www.vupen.com/english/advisories/2008/2821", "https://bugzilla.redhat.com/show_bug.cgi?id=280471", "https://exchange.xforce.ibmcloud.com/vulnerabilities/36637", "https://issues.rpath.com/browse/RPL-1706", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10809", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A5599", "https://www.redhat.com/archives/fedora-package-announce/2007-October/msg00214.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2007-4752"
imported = 2026-03-26T21:18:51.053Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-09-12T01:17:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-4752"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-4752"
```

# ssh in OpenSSH before 4.7 does not properly handle when an untrusted cookie cannot be created and us...

ssh in OpenSSH before 4.7 does not properly handle when an untrusted cookie cannot be created and uses a trusted X11 cookie instead, which allows attackers to violate intended policy and gain privileges by causing an X client to be treated as trusted.

