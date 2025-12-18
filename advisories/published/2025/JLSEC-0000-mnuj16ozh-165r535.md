```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnuj16ozh-165r535"
modified = 2025-12-18T03:34:17.597Z
upstream = ["CVE-2018-15473"]
references = ["http://www.openwall.com/lists/oss-security/2018/08/15/5", "http://www.securityfocus.com/bid/105140", "http://www.securitytracker.com/id/1041487", "https://access.redhat.com/errata/RHSA-2019:0711", "https://access.redhat.com/errata/RHSA-2019:2143", "https://bugs.debian.org/906236", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/779974d35b4859c07bc3cb8a12c74b43b0a7d1e0", "https://lists.debian.org/debian-lts-announce/2018/08/msg00022.html", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2018-0011", "https://security.gentoo.org/glsa/201810-03", "https://security.netapp.com/advisory/ntap-20181101-0001/", "https://usn.ubuntu.com/3809-1/", "https://www.debian.org/security/2018/dsa-4280", "https://www.exploit-db.com/exploits/45210/", "https://www.exploit-db.com/exploits/45233/", "https://www.exploit-db.com/exploits/45939/", "https://www.oracle.com/security-alerts/cpujan2020.html", "http://www.openwall.com/lists/oss-security/2018/08/15/5", "http://www.securityfocus.com/bid/105140", "http://www.securitytracker.com/id/1041487", "https://access.redhat.com/errata/RHSA-2019:0711", "https://access.redhat.com/errata/RHSA-2019:2143", "https://bugs.debian.org/906236", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/779974d35b4859c07bc3cb8a12c74b43b0a7d1e0", "https://lists.debian.org/debian-lts-announce/2018/08/msg00022.html", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2018-0011", "https://security.gentoo.org/glsa/201810-03", "https://security.netapp.com/advisory/ntap-20181101-0001/", "https://usn.ubuntu.com/3809-1/", "https://www.debian.org/security/2018/dsa-4280", "https://www.exploit-db.com/exploits/45210/", "https://www.exploit-db.com/exploits/45233/", "https://www.exploit-db.com/exploits/45939/", "https://www.oracle.com/security-alerts/cpujan2020.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2018-15473"
imported = 2025-12-18T03:34:17.597Z
modified = 2025-12-17T22:15:54.557Z
published = 2018-08-17T19:29:00.223Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-15473"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-15473"
```

# OpenSSH through 7.7 is prone to a user enumeration vulnerability due to not delaying bailout for an ...

OpenSSH through 7.7 is prone to a user enumeration vulnerability due to not delaying bailout for an invalid authenticating user until after the packet containing the request has been fully parsed, related to auth2-gss.c, auth2-hostbased.c, and auth2-pubkey.c.

