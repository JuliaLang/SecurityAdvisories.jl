```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6um0-4243jv"
modified = 2025-10-21T17:21:19.224Z
upstream = ["CVE-2004-0080"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20040201-01-U.asc", "ftp://patches.sgi.com/support/free/security/advisories/20040406-01-U", "http://marc.info/?l=bugtraq&m=108077689801698&w=2", "http://marc.info/?l=bugtraq&m=108144719532385&w=2", "http://secunia.com/advisories/10773", "http://security.gentoo.org/glsa/glsa-200404-06.xml", "http://www.kb.cert.org/vuls/id/801526", "http://www.osvdb.org/3796", "http://www.redhat.com/support/errata/RHSA-2004-056.html", "http://www.securityfocus.com/bid/9558", "https://exchange.xforce.ibmcloud.com/vulnerabilities/15016", "ftp://patches.sgi.com/support/free/security/advisories/20040201-01-U.asc", "ftp://patches.sgi.com/support/free/security/advisories/20040406-01-U", "http://marc.info/?l=bugtraq&m=108077689801698&w=2", "http://marc.info/?l=bugtraq&m=108144719532385&w=2", "http://secunia.com/advisories/10773", "http://security.gentoo.org/glsa/glsa-200404-06.xml", "http://www.kb.cert.org/vuls/id/801526", "http://www.osvdb.org/3796", "http://www.redhat.com/support/errata/RHSA-2004-056.html", "http://www.securityfocus.com/bid/9558", "https://exchange.xforce.ibmcloud.com/vulnerabilities/15016"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2004-0080"
imported = 2025-10-21T17:21:19.224Z
modified = 2025-04-03T01:03:51.193Z
published = 2004-03-03T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-0080"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-0080"
```

# The login program in util-linux 2.11 and earlier uses a pointer after it has been freed and realloca...

The login program in util-linux 2.11 and earlier uses a pointer after it has been freed and reallocated, which could cause login to leak sensitive data.

