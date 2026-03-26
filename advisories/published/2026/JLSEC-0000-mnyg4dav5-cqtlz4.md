```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dav5-cqtlz4"
modified = 2026-03-26T21:18:55.553Z
upstream = ["CVE-2016-10011"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94977", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://github.com/openbsd/src/commit/ac8147a06ed2e2403fb6b9a0c03e618a9333c0e9", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.openssh.com/txt/release-7.4", "http://www.openwall.com/lists/oss-security/2016/12/19/2", "http://www.securityfocus.com/bid/94977", "http://www.securitytracker.com/id/1037490", "http://www.slackware.com/security/viewer.php?l=slackware-security&y=2016&m=slackware-security.647637", "https://access.redhat.com/errata/RHSA-2017:2029", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://github.com/openbsd/src/commit/ac8147a06ed2e2403fb6b9a0c03e618a9333c0e9", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20171130-0002/", "https://support.hpe.com/hpsc/doc/public/display?docLocale=en_US&docId=emr_na-hpesbux03818en_us", "https://www.openssh.com/txt/release-7.4"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-10011"
imported = 2026-03-26T21:18:55.553Z
modified = 2025-04-12T10:46:40.837Z
published = 2017-01-05T02:59:03.120Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10011"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10011"
```

# authfile.c in sshd in OpenSSH before 7.4 does not properly consider the effects of realloc on buffer...

authfile.c in sshd in OpenSSH before 7.4 does not properly consider the effects of realloc on buffer contents, which might allow local users to obtain sensitive private-key information by leveraging access to a privilege-separated child process.

