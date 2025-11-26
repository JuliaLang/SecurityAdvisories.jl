```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9y2-133zvj4"
modified = 2025-11-25T22:35:56.762Z
upstream = ["CVE-2004-0827"]
references = ["http://secunia.com/advisories/28800", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201006-1", "http://www.debian.org/security/2004/dsa-547", "http://www.redhat.com/support/errata/RHSA-2004-480.html", "http://www.redhat.com/support/errata/RHSA-2004-494.html", "http://www.vupen.com/english/advisories/2008/0412", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17173", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11123", "http://secunia.com/advisories/28800", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://sunsolve.sun.com/search/document.do?assetkey=1-66-201006-1", "http://www.debian.org/security/2004/dsa-547", "http://www.redhat.com/support/errata/RHSA-2004-480.html", "http://www.redhat.com/support/errata/RHSA-2004-494.html", "http://www.vupen.com/english/advisories/2008/0412", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17173", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11123"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2004-0827"
imported = 2025-11-25T22:35:56.762Z
modified = 2025-04-03T01:03:51.193Z
published = 2004-09-16T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-0827"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-0827"
```

# Multiple buffer overflows in the ImageMagick graphics library 5.x before 5.4.4, and 6.x before 6.0.6...

Multiple buffer overflows in the ImageMagick graphics library 5.x before 5.4.4, and 6.x before 6.0.6.2, allow remote attackers to cause a denial of service (application crash) and possibly execute arbitrary code via malformed (1) AVI, (2) BMP, or (3) DIB files.

