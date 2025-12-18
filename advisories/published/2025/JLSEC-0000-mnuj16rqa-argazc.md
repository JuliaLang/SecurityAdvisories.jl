```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnuj16rqa-argazc"
modified = 2025-12-18T03:34:21.154Z
upstream = ["CVE-2021-4189"]
references = ["https://access.redhat.com/security/cve/CVE-2021-4189", "https://bugs.python.org/issue43285", "https://bugzilla.redhat.com/show_bug.cgi?id=2036020", "https://github.com/python/cpython/commit/0ab152c6b5d95caa2dc1a30fa96e10258b5f188e", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://python-security.readthedocs.io/vuln/ftplib-pasv.html", "https://security-tracker.debian.org/tracker/CVE-2021-4189", "https://security.netapp.com/advisory/ntap-20221104-0004/", "https://access.redhat.com/security/cve/CVE-2021-4189", "https://bugs.python.org/issue43285", "https://bugzilla.redhat.com/show_bug.cgi?id=2036020", "https://github.com/python/cpython/commit/0ab152c6b5d95caa2dc1a30fa96e10258b5f188e", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://python-security.readthedocs.io/vuln/ftplib-pasv.html", "https://security-tracker.debian.org/tracker/CVE-2021-4189", "https://security.netapp.com/advisory/ntap-20221104-0004/"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]

[[jlsec_sources]]
id = "CVE-2021-4189"
imported = 2025-12-18T03:34:21.154Z
modified = 2025-12-17T22:15:57.243Z
published = 2022-08-24T16:15:09.827Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-4189"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-4189"
```

# A flaw was found in Python, specifically in the FTP (File Transfer Protocol) client library in PASV ...

A flaw was found in Python, specifically in the FTP (File Transfer Protocol) client library in PASV (passive) mode. The issue is how the FTP client trusts the host from the PASV response by default. This flaw allows an attacker to set up a malicious FTP server that can trick FTP clients into connecting back to a given IP address and port. This vulnerability could lead to FTP client scanning ports, which otherwise would not have been possible.

