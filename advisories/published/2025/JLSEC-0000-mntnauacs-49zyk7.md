```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauacs-49zyk7"
modified = 2025-11-25T22:35:57.292Z
upstream = ["CVE-2005-0762"]
references = ["http://rhn.redhat.com/errata/RHSA-2005-070.html", "http://securitytracker.com/id?1013550", "http://www.debian.org/security/2005/dsa-702", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9736", "http://rhn.redhat.com/errata/RHSA-2005-070.html", "http://securitytracker.com/id?1013550", "http://www.debian.org/security/2005/dsa-702", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9736"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-0762"
imported = 2025-11-25T22:35:57.292Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-05-02T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-0762"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-0762"
```

# Heap-based buffer overflow in the SGI parser in ImageMagick before 6.0 allows remote attackers to ex...

Heap-based buffer overflow in the SGI parser in ImageMagick before 6.0 allows remote attackers to execute arbitrary code via a crafted SGI image file.

