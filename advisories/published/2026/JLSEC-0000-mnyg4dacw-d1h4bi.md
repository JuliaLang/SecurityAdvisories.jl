```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dacw-d1h4bi"
modified = 2026-03-26T21:18:54.896Z
upstream = ["CVE-2015-6563"]
references = ["http://lists.apple.com/archives/security-announce/2015/Oct/msg00005.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-August/165170.html", "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://seclists.org/fulldisclosure/2015/Aug/54", "http://www.openssh.com/txt/release-7.0", "http://www.openwall.com/lists/oss-security/2015/08/22/1", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinoct2015-2719645.html", "http://www.securityfocus.com/bid/76317", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openssh/openssh-portable/commit/d4697fe9a28dab7255c60433e4dd23cf7fce8a8b", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://security.netapp.com/advisory/ntap-20180201-0002/", "https://support.apple.com/HT205375", "https://www.broadcom.com/support/fibre-channel-networking/security-advisories/brocade-security-advisory-2019-766", "http://lists.apple.com/archives/security-announce/2015/Oct/msg00005.html", "http://lists.fedoraproject.org/pipermail/package-announce/2015-August/165170.html", "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://seclists.org/fulldisclosure/2015/Aug/54", "http://www.openssh.com/txt/release-7.0", "http://www.openwall.com/lists/oss-security/2015/08/22/1", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinoct2015-2719645.html", "http://www.securityfocus.com/bid/76317", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openssh/openssh-portable/commit/d4697fe9a28dab7255c60433e4dd23cf7fce8a8b", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://security.netapp.com/advisory/ntap-20180201-0002/", "https://support.apple.com/HT205375", "https://www.broadcom.com/support/fibre-channel-networking/security-advisories/brocade-security-advisory-2019-766"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2015-6563"
imported = 2026-03-26T21:18:54.896Z
modified = 2025-04-12T10:46:40.837Z
published = 2015-08-24T01:59:00.127Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-6563"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-6563"
```

# The monitor component in sshd in OpenSSH before 7.0 on non-OpenBSD platforms accepts extraneous user...

The monitor component in sshd in OpenSSH before 7.0 on non-OpenBSD platforms accepts extraneous username data in MONITOR_REQ_PAM_INIT_CTX requests, which allows local users to conduct impersonation attacks by leveraging any SSH login access in conjunction with control of the sshd uid to send a crafted MONITOR_REQ_PWNAM request, related to monitor.c and monitor_wrap.c.

