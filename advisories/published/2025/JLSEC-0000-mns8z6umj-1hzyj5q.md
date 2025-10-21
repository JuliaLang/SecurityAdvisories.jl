```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6umj-1hzyj5q"
modified = 2025-10-21T17:21:19.243Z
upstream = ["CVE-2006-7108"]
references = ["http://secunia.com/advisories/25098", "http://secunia.com/advisories/25530", "http://secunia.com/advisories/25692", "http://secunia.com/advisories/25935", "http://support.avaya.com/elmodocs2/security/ASA-2007-252.htm", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:111", "http://www.redhat.com/support/errata/RHSA-2007-0235.html", "http://www.securityfocus.com/bid/24321", "https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=177331", "https://issues.rpath.com/browse/RPL-1359", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9689", "http://secunia.com/advisories/25098", "http://secunia.com/advisories/25530", "http://secunia.com/advisories/25692", "http://secunia.com/advisories/25935", "http://support.avaya.com/elmodocs2/security/ASA-2007-252.htm", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:111", "http://www.redhat.com/support/errata/RHSA-2007-0235.html", "http://www.securityfocus.com/bid/24321", "https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=177331", "https://issues.rpath.com/browse/RPL-1359", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9689"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2006-7108"
imported = 2025-10-21T17:21:19.243Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-03-04T22:19:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-7108"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-7108"
```

# login in util-linux-2.12a skips pam_acct_mgmt and chauth_tok when authentication is skipped, such as...

login in util-linux-2.12a skips pam_acct_mgmt and chauth_tok when authentication is skipped, such as when a Kerberos krlogin session has been established, which might allow users to bypass intended access policies that would be enforced by pam_acct_mgmt and chauth_tok.

