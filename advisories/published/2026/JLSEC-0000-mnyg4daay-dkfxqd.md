```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4daay-dkfxqd"
modified = 2026-03-26T21:18:54.826Z
upstream = ["CVE-2014-2532"]
references = ["http://advisories.mageia.org/MGASA-2014-0143.html", "http://aix.software.ibm.com/aix/efixes/security/openssh_advisory4.asc", "http://lists.apple.com/archives/security-announce/2015/Sep/msg00008.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-June/134026.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-May/133537.html", "http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://marc.info/?l=openbsd-security-announce&m=139492048027313&w=2", "http://rhn.redhat.com/errata/RHSA-2014-1552.html", "http://secunia.com/advisories/57488", "http://secunia.com/advisories/57574", "http://secunia.com/advisories/59313", "http://secunia.com/advisories/59855", "http://www.debian.org/security/2014/dsa-2894", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:068", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:095", "http://www.oracle.com/technetwork/security-advisory/cpuapr2016v3-2985753.html", "http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2016-2881722.html", "http://www.securityfocus.com/bid/66355", "http://www.securitytracker.com/id/1029925", "http://www.ubuntu.com/usn/USN-2155-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/91986", "https://support.apple.com/HT205267", "http://advisories.mageia.org/MGASA-2014-0143.html", "http://aix.software.ibm.com/aix/efixes/security/openssh_advisory4.asc", "http://lists.apple.com/archives/security-announce/2015/Sep/msg00008.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-June/134026.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-May/133537.html", "http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://marc.info/?l=openbsd-security-announce&m=139492048027313&w=2", "http://rhn.redhat.com/errata/RHSA-2014-1552.html", "http://secunia.com/advisories/57488", "http://secunia.com/advisories/57574", "http://secunia.com/advisories/59313", "http://secunia.com/advisories/59855", "http://www.debian.org/security/2014/dsa-2894", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:068", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:095", "http://www.oracle.com/technetwork/security-advisory/cpuapr2016v3-2985753.html", "http://www.oracle.com/technetwork/security-advisory/cpujul2018-4258247.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2016-2881722.html", "http://www.securityfocus.com/bid/66355", "http://www.securitytracker.com/id/1029925", "http://www.ubuntu.com/usn/USN-2155-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/91986", "https://support.apple.com/HT205267"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2014-2532"
imported = 2026-03-26T21:18:54.826Z
modified = 2025-04-12T10:46:40.837Z
published = 2014-03-18T05:18:19.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-2532"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-2532"
```

# sshd in OpenSSH before 6.6 does not properly support wildcards on AcceptEnv lines in sshd_config, wh...

sshd in OpenSSH before 6.6 does not properly support wildcards on AcceptEnv lines in sshd_config, which allows remote attackers to bypass intended environment restrictions by using a substring located before a wildcard character.

