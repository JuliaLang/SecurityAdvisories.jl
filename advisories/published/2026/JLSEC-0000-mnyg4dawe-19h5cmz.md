```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4dawe-19h5cmz"
modified = 2026-03-26T21:18:55.598Z
upstream = ["CVE-2016-10708"]
references = ["http://blog.swiecki.net/2018/01/fuzzing-tcp-servers.html", "http://www.securityfocus.com/bid/102780", "https://anongit.mindrot.org/openssh.git/commit/?id=28652bca29046f62c7045e933e6b931de1d16737", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://kc.mcafee.com/corporate/index?page=content&id=SB10284", "https://lists.debian.org/debian-lts-announce/2018/01/msg00031.html", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20180423-0003/", "https://support.f5.com/csp/article/K32485746?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/3809-1/", "https://www.openssh.com/releasenotes.html", "http://blog.swiecki.net/2018/01/fuzzing-tcp-servers.html", "http://www.securityfocus.com/bid/102780", "https://anongit.mindrot.org/openssh.git/commit/?id=28652bca29046f62c7045e933e6b931de1d16737", "https://cert-portal.siemens.com/productcert/pdf/ssa-676336.pdf", "https://kc.mcafee.com/corporate/index?page=content&id=SB10284", "https://lists.debian.org/debian-lts-announce/2018/01/msg00031.html", "https://lists.debian.org/debian-lts-announce/2018/09/msg00010.html", "https://security.netapp.com/advisory/ntap-20180423-0003/", "https://support.f5.com/csp/article/K32485746?utm_source=f5support&amp%3Butm_medium=RSS", "https://usn.ubuntu.com/3809-1/", "https://www.openssh.com/releasenotes.html"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2016-10708"
imported = 2026-03-26T21:18:55.598Z
modified = 2024-11-21T02:44:33.607Z
published = 2018-01-21T22:29:00.227Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10708"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10708"
```

# sshd in OpenSSH before 7.4 allows remote attackers to cause a denial of service (NULL pointer derefe...

sshd in OpenSSH before 7.4 allows remote attackers to cause a denial of service (NULL pointer dereference and daemon crash) via an out-of-sequence NEWKEYS message, as demonstrated by Honggfuzz, related to kex.c and packet.c.

