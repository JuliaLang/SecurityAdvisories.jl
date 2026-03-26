```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4datm-6baruq"
modified = 2026-03-26T21:18:55.498Z
upstream = ["CVE-2016-6515"]
references = ["http://openwall.com/lists/oss-security/2016/08/01/2", "http://packetstormsecurity.com/files/140070/OpenSSH-7.2-Denial-Of-Service.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html", "http://www.securityfocus.com/bid/92212", "http://www.securitytracker.com/id/1036487", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://github.com/openssh/openssh-portable/commit/fcd135c9df440bcd2d5870405ad3311743d78d97", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X2L6RW34VFNXYNVVN2CN73YAGJ5VMTFU/", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:06.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0003/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbhf03779en_us", "https://www.exploit-db.com/exploits/40888/", "http://openwall.com/lists/oss-security/2016/08/01/2", "http://packetstormsecurity.com/files/140070/OpenSSH-7.2-Denial-Of-Service.html", "http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html", "http://www.securityfocus.com/bid/92212", "http://www.securitytracker.com/id/1036487", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://github.com/openssh/openssh-portable/commit/fcd135c9df440bcd2d5870405ad3311743d78d97", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/X2L6RW34VFNXYNVVN2CN73YAGJ5VMTFU/", "https://security.FreeBSD.org/advisories/FreeBSD-SA-17:06.openssh.asc", "https://security.netapp.com/advisory/ntap-20171130-0003/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbhf03779en_us", "https://www.exploit-db.com/exploits/40888/"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-6515"
imported = 2026-03-26T21:18:55.498Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-08-07T21:59:09.943Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-6515"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-6515"
```

# The auth_password function in auth-passwd.c in sshd in OpenSSH before 7.3 does not limit password le...

The auth_password function in auth-passwd.c in sshd in OpenSSH before 7.3 does not limit password lengths for password authentication, which allows remote attackers to cause a denial of service (crypt CPU consumption) via a long string.

