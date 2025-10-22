```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6uml-q6df8j"
modified = 2025-10-21T17:21:19.245Z
upstream = ["CVE-2007-5191"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=195390", "http://frontal2.mandriva.com/en/security/advisories?name=MDKSA-2007:198", "http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git%3Ba=commit%3Bh=ebbeb2c7ac1b00b6083905957837a271e80b187e", "http://lists.opensuse.org/opensuse-security-announce/2007-10/msg00008.html", "http://lists.vmware.com/pipermail/security-announce/2008/000002.html", "http://secunia.com/advisories/27104", "http://secunia.com/advisories/27122", "http://secunia.com/advisories/27145", "http://secunia.com/advisories/27188", "http://secunia.com/advisories/27283", "http://secunia.com/advisories/27354", "http://secunia.com/advisories/27399", "http://secunia.com/advisories/27687", "http://secunia.com/advisories/28348", "http://secunia.com/advisories/28349", "http://secunia.com/advisories/28368", "http://secunia.com/advisories/28469", "http://security.gentoo.org/glsa/glsa-200710-18.xml", "http://support.avaya.com/elmodocs2/security/ASA-2008-023.htm", "http://www.debian.org/security/2008/dsa-1449", "http://www.debian.org/security/2008/dsa-1450", "http://www.redhat.com/support/errata/RHSA-2007-0969.html", "http://www.securityfocus.com/archive/1/485936/100/0/threaded", "http://www.securityfocus.com/archive/1/486859/100/0/threaded", "http://www.securityfocus.com/bid/25973", "http://www.securitytracker.com/id?1018782", "http://www.ubuntu.com/usn/usn-533-1", "http://www.vmware.com/security/advisories/VMSA-2008-0001.html", "http://www.vupen.com/english/advisories/2007/3417", "http://www.vupen.com/english/advisories/2008/0064", "https://bugzilla.redhat.com/show_bug.cgi?id=320041", "https://issues.rpath.com/browse/RPL-1757", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10101", "https://www.redhat.com/archives/fedora-package-announce/2007-October/msg00144.html", "http://bugs.gentoo.org/show_bug.cgi?id=195390", "http://frontal2.mandriva.com/en/security/advisories?name=MDKSA-2007:198", "http://git.kernel.org/?p=utils/util-linux-ng/util-linux-ng.git%3Ba=commit%3Bh=ebbeb2c7ac1b00b6083905957837a271e80b187e", "http://lists.opensuse.org/opensuse-security-announce/2007-10/msg00008.html", "http://lists.vmware.com/pipermail/security-announce/2008/000002.html", "http://secunia.com/advisories/27104", "http://secunia.com/advisories/27122", "http://secunia.com/advisories/27145", "http://secunia.com/advisories/27188", "http://secunia.com/advisories/27283", "http://secunia.com/advisories/27354", "http://secunia.com/advisories/27399", "http://secunia.com/advisories/27687", "http://secunia.com/advisories/28348", "http://secunia.com/advisories/28349", "http://secunia.com/advisories/28368", "http://secunia.com/advisories/28469", "http://security.gentoo.org/glsa/glsa-200710-18.xml", "http://support.avaya.com/elmodocs2/security/ASA-2008-023.htm", "http://www.debian.org/security/2008/dsa-1449", "http://www.debian.org/security/2008/dsa-1450", "http://www.redhat.com/support/errata/RHSA-2007-0969.html", "http://www.securityfocus.com/archive/1/485936/100/0/threaded", "http://www.securityfocus.com/archive/1/486859/100/0/threaded", "http://www.securityfocus.com/bid/25973", "http://www.securitytracker.com/id?1018782", "http://www.ubuntu.com/usn/usn-533-1", "http://www.vmware.com/security/advisories/VMSA-2008-0001.html", "http://www.vupen.com/english/advisories/2007/3417", "http://www.vupen.com/english/advisories/2008/0064", "https://bugzilla.redhat.com/show_bug.cgi?id=320041", "https://issues.rpath.com/browse/RPL-1757", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10101", "https://www.redhat.com/archives/fedora-package-announce/2007-October/msg00144.html"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2007-5191"
imported = 2025-10-21T17:21:19.245Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-10-04T16:17:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-5191"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-5191"
```

# mount and umount in util-linux and loop-aes-utils call the setuid and setgid functions in the wrong ...

mount and umount in util-linux and loop-aes-utils call the setuid and setgid functions in the wrong order and do not check the return values, which might allow attackers to gain privileges via helpers such as mount.nfs.

