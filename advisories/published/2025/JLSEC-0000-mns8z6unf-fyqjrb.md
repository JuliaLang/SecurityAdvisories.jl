```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6unf-fyqjrb"
modified = 2025-10-21T17:21:19.275Z
upstream = ["CVE-2014-9114"]
references = ["http://lists.fedoraproject.org/pipermail/package-announce/2014-December/145188.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-December/146229.html", "http://lists.opensuse.org/opensuse-updates/2015-01/msg00035.html", "http://www.openwall.com/lists/oss-security/2014/11/26/21", "http://www.securityfocus.com/bid/71327", "https://bugzilla.redhat.com/show_bug.cgi?id=1168485", "https://exchange.xforce.ibmcloud.com/vulnerabilities/98993", "https://github.com/karelzak/util-linux/commit/89e90ae7b2826110ea28c1c0eb8e7c56c3907bdc", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/201612-14", "http://lists.fedoraproject.org/pipermail/package-announce/2014-December/145188.html", "http://lists.fedoraproject.org/pipermail/package-announce/2014-December/146229.html", "http://lists.opensuse.org/opensuse-updates/2015-01/msg00035.html", "http://www.openwall.com/lists/oss-security/2014/11/26/21", "http://www.securityfocus.com/bid/71327", "https://bugzilla.redhat.com/show_bug.cgi?id=1168485", "https://exchange.xforce.ibmcloud.com/vulnerabilities/98993", "https://github.com/karelzak/util-linux/commit/89e90ae7b2826110ea28c1c0eb8e7c56c3907bdc", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://security.gentoo.org/glsa/201612-14"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2014-9114"
imported = 2025-10-21T17:21:19.249Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-31T16:59:00.397Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9114"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9114"
```

# Blkid in util-linux before 2.26rc-1 allows local users to execute arbitrary code.

Blkid in util-linux before 2.26rc-1 allows local users to execute arbitrary code.

