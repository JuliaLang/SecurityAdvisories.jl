```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d5h7-34swgs"
modified = 2026-03-26T21:18:48.571Z
upstream = ["CVE-2003-0190"]
references = ["http://lab.mediaservice.net/advisory/2003-01-openssh.txt", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-April/004815.html", "http://marc.info/?l=bugtraq&m=105172058404810&w=2", "http://marc.info/?l=bugtraq&m=106018677302607&w=2", "http://www.redhat.com/support/errata/RHSA-2003-222.html", "http://www.redhat.com/support/errata/RHSA-2003-224.html", "http://www.securityfocus.com/bid/7467", "http://www.turbolinux.com/security/TLSA-2003-31.txt", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A445", "http://lab.mediaservice.net/advisory/2003-01-openssh.txt", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-April/004815.html", "http://marc.info/?l=bugtraq&m=105172058404810&w=2", "http://marc.info/?l=bugtraq&m=106018677302607&w=2", "http://www.redhat.com/support/errata/RHSA-2003-222.html", "http://www.redhat.com/support/errata/RHSA-2003-224.html", "http://www.securityfocus.com/bid/7467", "http://www.turbolinux.com/security/TLSA-2003-31.txt", "https://cert-portal.siemens.com/productcert/pdf/ssa-412672.pdf", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A445"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2003-0190"
imported = 2026-03-26T21:18:48.571Z
modified = 2025-04-03T01:03:51.193Z
published = 2003-05-12T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2003-0190"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2003-0190"
```

# OpenSSH-portable (OpenSSH) 3.6.1p1 and earlier with PAM support enabled immediately sends an error m...

OpenSSH-portable (OpenSSH) 3.6.1p1 and earlier with PAM support enabled immediately sends an error message when a user does not exist, which allows remote attackers to determine valid usernames via a timing attack.

