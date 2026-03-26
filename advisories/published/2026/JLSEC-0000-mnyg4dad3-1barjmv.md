```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dad3-1barjmv"
modified = 2026-03-26T21:18:54.903Z
upstream = ["CVE-2015-6564"]
references = ["http://lists.fedoraproject.org/pipermail/package-announce/2015-August/165170.html", "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://seclists.org/fulldisclosure/2015/Aug/54", "http://www.openssh.com/txt/release-7.0", "http://www.openwall.com/lists/oss-security/2015/08/22/1", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinoct2015-2719645.html", "http://www.securityfocus.com/bid/76317", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openssh/openssh-portable/commit/5e75f5198769056089fb06c4d738ab0e5abc66f7", "https://kc.mcafee.com/corporate/index?page=content&id=SB10136", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://www.broadcom.com/support/fibre-channel-networking/security-advisories/brocade-security-advisory-2019-764", "http://lists.fedoraproject.org/pipermail/package-announce/2015-August/165170.html", "http://lists.opensuse.org/opensuse-security-announce/2015-09/msg00017.html", "http://rhn.redhat.com/errata/RHSA-2016-0741.html", "http://seclists.org/fulldisclosure/2015/Aug/54", "http://www.openssh.com/txt/release-7.0", "http://www.openwall.com/lists/oss-security/2015/08/22/1", "http://www.oracle.com/technetwork/topics/security/bulletinjan2016-2867206.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.oracle.com/technetwork/topics/security/linuxbulletinoct2015-2719645.html", "http://www.securityfocus.com/bid/76317", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openssh/openssh-portable/commit/5e75f5198769056089fb06c4d738ab0e5abc66f7", "https://kc.mcafee.com/corporate/index?page=content&id=SB10136", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201512-04", "https://www.broadcom.com/support/fibre-channel-networking/security-advisories/brocade-security-advisory-2019-764"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2015-6564"
imported = 2026-03-26T21:18:54.903Z
modified = 2025-04-12T10:46:40.837Z
published = 2015-08-24T01:59:01.657Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-6564"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-6564"
```

# Use-after-free vulnerability in the mm_answer_pam_free_ctx function in monitor.c in sshd in OpenSSH ...

Use-after-free vulnerability in the mm_answer_pam_free_ctx function in monitor.c in sshd in OpenSSH before 7.0 on non-OpenBSD platforms might allow local users to gain privileges by leveraging control of the sshd uid to send an unexpectedly early MONITOR_REQ_PAM_FREE_CTX request.

