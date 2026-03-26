```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4davh-t15j8m"
modified = 2026-03-26T21:18:55.565Z
upstream = ["CVE-2016-6210"]
references = ["http://seclists.org/fulldisclosure/2016/Jul/51", "http://www.debian.org/security/2016/dsa-3626", "http://www.securityfocus.com/bid/91812", "http://www.securitytracker.com/id/1036319", "https://access.redhat.com/errata/RHSA-2017:2029", "https://access.redhat.com/errata/RHSA-2017:2563", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://security.gentoo.org/glsa/201612-18", "https://security.netapp.com/advisory/ntap-20190206-0001/", "https://www.exploit-db.com/exploits/40113/", "https://www.exploit-db.com/exploits/40136/", "https://www.openssh.com/txt/release-7.3", "http://seclists.org/fulldisclosure/2016/Jul/51", "http://www.debian.org/security/2016/dsa-3626", "http://www.securityfocus.com/bid/91812", "http://www.securitytracker.com/id/1036319", "https://access.redhat.com/errata/RHSA-2017:2029", "https://access.redhat.com/errata/RHSA-2017:2563", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://security.gentoo.org/glsa/201612-18", "https://security.netapp.com/advisory/ntap-20190206-0001/", "https://www.exploit-db.com/exploits/40113/", "https://www.exploit-db.com/exploits/40136/", "https://www.openssh.com/txt/release-7.3"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-6210"
imported = 2026-03-26T21:18:55.565Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-13T17:59:00.153Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-6210"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-6210"
```

# sshd in OpenSSH before 7.3, when SHA256 or SHA512 are used for user password hashing, uses BLOWFISH ...

sshd in OpenSSH before 7.3, when SHA256 or SHA512 are used for user password hashing, uses BLOWFISH hashing on a static password when the username does not exist, which allows remote attackers to enumerate users by leveraging the timing difference between responses when a large password is provided.

