```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dac5-16adx1y"
modified = 2026-03-26T21:18:54.869Z
upstream = ["CVE-2014-2653"]
references = ["http://advisories.mageia.org/MGASA-2014-0166.html", "http://aix.software.ibm.com/aix/efixes/security/openssh_advisory4.asc", "http://lists.fedoraproject.org/pipermail/package-announce/2014-June/134026.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-May/133537.html", "http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://openwall.com/lists/oss-security/2014/03/26/7", "http://rhn.redhat.com/errata/RHSA-2014-1552.html", "http://rhn.redhat.com/errata/RHSA-2015-0425.html", "http://secunia.com/advisories/59855", "http://www.debian.org/security/2014/dsa-2894", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:068", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:095", "http://www.oracle.com/technetwork/topics/security/bulletinoct2015-2511968.html", "http://www.securityfocus.com/bid/66459", "http://www.ubuntu.com/usn/USN-2164-1", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=742513", "http://advisories.mageia.org/MGASA-2014-0166.html", "http://aix.software.ibm.com/aix/efixes/security/openssh_advisory4.asc", "http://lists.fedoraproject.org/pipermail/package-announce/2014-June/134026.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-May/133537.html", "http://marc.info/?l=bugtraq&m=141576985122836&w=2", "http://openwall.com/lists/oss-security/2014/03/26/7", "http://rhn.redhat.com/errata/RHSA-2014-1552.html", "http://rhn.redhat.com/errata/RHSA-2015-0425.html", "http://secunia.com/advisories/59855", "http://www.debian.org/security/2014/dsa-2894", "http://www.mandriva.com/security/advisories?name=MDVSA-2014:068", "http://www.mandriva.com/security/advisories?name=MDVSA-2015:095", "http://www.oracle.com/technetwork/topics/security/bulletinoct2015-2511968.html", "http://www.securityfocus.com/bid/66459", "http://www.ubuntu.com/usn/USN-2164-1", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=742513"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2014-2653"
imported = 2026-03-26T21:18:54.869Z
modified = 2025-04-12T10:46:40.837Z
published = 2014-03-27T10:55:04.513Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-2653"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-2653"
```

# The verify_host_key function in sshconnect.c in the client in OpenSSH 6.6 and earlier allows remote ...

The verify_host_key function in sshconnect.c in the client in OpenSSH 6.6 and earlier allows remote servers to trigger the skipping of SSHFP DNS RR checking by presenting an unacceptable HostCertificate.

