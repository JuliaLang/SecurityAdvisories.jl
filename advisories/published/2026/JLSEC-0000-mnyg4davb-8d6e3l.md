```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4davb-8d6e3l"
modified = 2026-03-26T21:18:55.559Z
upstream = ["CVE-2016-10012"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94975", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/3095060f479b86288e31c79ecbc5131a66bcd2f9", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.f5.com/csp/article/K62201745?utm_source=f5support&amp%3Butm_medium=RSS", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.openssh.com/txt/release-7.4", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94975", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/3095060f479b86288e31c79ecbc5131a66bcd2f9", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.f5.com/csp/article/K62201745?utm_source=f5support&amp%3Butm_medium=RSS", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.openssh.com/txt/release-7.4"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-10012"
imported = 2026-03-26T21:18:55.559Z
modified = 2025-04-12T10:46:40.837Z
published = 2017-01-05T02:59:03.150Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10012"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10012"
```

# The shared memory manager (associated with pre-authentication compression) in sshd in OpenSSH before...

The shared memory manager (associated with pre-authentication compression) in sshd in OpenSSH before 7.4 does not ensure that a bounds check is enforced by all compilers, which might allows local users to gain privileges by leveraging access to a sandboxed privilege-separation process, related to the m_zback and m_zlib data structures.

