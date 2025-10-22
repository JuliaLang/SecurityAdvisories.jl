```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6ulf-1ml5sl3"
modified = 2025-10-21T17:21:19.203Z
upstream = ["CVE-2001-1175"]
references = ["http://www.redhat.com/support/errata/RHSA-2001-095.html", "http://www.redhat.com/support/errata/RHSA-2001-132.html", "http://www.securityfocus.com/bid/3036", "https://exchange.xforce.ibmcloud.com/vulnerabilities/6851", "http://www.redhat.com/support/errata/RHSA-2001-095.html", "http://www.redhat.com/support/errata/RHSA-2001-132.html", "http://www.securityfocus.com/bid/3036", "https://exchange.xforce.ibmcloud.com/vulnerabilities/6851"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2001-1175"
imported = 2025-10-21T17:21:19.203Z
modified = 2025-04-03T01:03:51.193Z
published = 2002-04-01T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2001-1175"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2001-1175"
```

# vipw in the util-linux package before 2.10 causes /etc/shadow to be world-readable in some cases, wh...

vipw in the util-linux package before 2.10 causes /etc/shadow to be world-readable in some cases, which would make it easier for local users to perform brute force password guessing.

