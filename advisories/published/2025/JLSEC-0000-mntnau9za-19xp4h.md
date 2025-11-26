```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9za-19xp4h"
modified = 2025-11-25T22:35:56.806Z
upstream = ["CVE-2005-0761"]
references = ["http://rhn.redhat.com/errata/RHSA-2005-070.html", "http://securitytracker.com/id?1013550", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "http://www.securityfocus.com/bid/12876", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11150", "http://rhn.redhat.com/errata/RHSA-2005-070.html", "http://securitytracker.com/id?1013550", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "http://www.securityfocus.com/bid/12876", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11150"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-0761"
imported = 2025-11-25T22:35:56.806Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-03-23T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-0761"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-0761"
```

# Unknown vulnerability in ImageMagick before 6.1.8 allows remote attackers to cause a denial of servi...

Unknown vulnerability in ImageMagick before 6.1.8 allows remote attackers to cause a denial of service (application crash) via a crafted PSD file.

