```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnuj16ozk-dqtaxc"
modified = 2025-12-18T03:34:17.600Z
upstream = ["CVE-2018-20685"]
references = ["http://www.securityfocus.com/bid/106531", "https://access.redhat.com/errata/RHSA-2019:3702", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/scp.c.diff?r1=1.197&r2=1.198&f=h", "https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa8860c061bf7105eb7f8b2", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://security.gentoo.org/glsa/201903-16", "https://security.gentoo.org/glsa/202007-53", "https://security.netapp.com/advisory/ntap-20190215-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://www.debian.org/security/2019/dsa-4387", "https://www.oracle.com/technetwork/security-advisory/cpuapr2019-5072813.html", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html", "http://www.securityfocus.com/bid/106531", "https://access.redhat.com/errata/RHSA-2019:3702", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/scp.c.diff?r1=1.197&r2=1.198&f=h", "https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa8860c061bf7105eb7f8b2", "https://lists.debian.org/debian-lts-announce/2019/03/msg00030.html", "https://security.gentoo.org/glsa/201903-16", "https://security.gentoo.org/glsa/202007-53", "https://security.netapp.com/advisory/ntap-20190215-0001/", "https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt", "https://usn.ubuntu.com/3885-1/", "https://www.debian.org/security/2019/dsa-4387", "https://www.oracle.com/technetwork/security-advisory/cpuapr2019-5072813.html", "https://www.oracle.com/technetwork/security-advisory/cpuoct2019-5072832.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2018-20685"
imported = 2025-12-18T03:34:17.600Z
modified = 2025-12-17T22:15:55.163Z
published = 2019-01-10T21:29:00.377Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-20685"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-20685"
```

# In OpenSSH 7.9, scp.c in the scp client allows remote SSH servers to bypass intended access restrict...

In OpenSSH 7.9, scp.c in the scp client allows remote SSH servers to bypass intended access restrictions via the filename of . or an empty filename. The impact is modifying the permissions of the target directory on the client side.

