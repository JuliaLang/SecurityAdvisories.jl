```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4daw6-dhsd1v"
modified = 2026-03-26T21:18:55.590Z
upstream = ["CVE-2017-15906"]
references = ["http://www.securityfocus.com/bid/101552", "https://access.redhat.com/errata/RHSA-2018:0980", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/a6981567e8e215acc1ef690c8dbb30f2d9b00a19", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201801-05", "https://security.netapp.com/advisory/ntap-20180423-0004/", "https://www.openssh.com/txt/release-7.6", "https://www.oracle.com/security-alerts/cpujan2020.html", "http://www.securityfocus.com/bid/101552", "https://access.redhat.com/errata/RHSA-2018:0980", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://github.com/openbsd/src/commit/a6981567e8e215acc1ef690c8dbb30f2d9b00a19", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.gentoo.org/glsa/201801-05", "https://security.netapp.com/advisory/ntap-20180423-0004/", "https://www.openssh.com/txt/release-7.6", "https://www.oracle.com/security-alerts/cpujan2020.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2017-15906"
imported = 2026-03-26T21:18:55.590Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-10-26T03:29:00.220Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-15906"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-15906"
```

# The process_open function in sftp-server.c in OpenSSH before 7.6 does not properly prevent write ope...

The process_open function in sftp-server.c in OpenSSH before 7.6 does not properly prevent write operations in readonly mode, which allows attackers to create zero-length files.

