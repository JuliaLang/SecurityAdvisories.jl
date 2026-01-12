```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauaed-luh44l"
modified = 2025-11-25T22:35:57.349Z
upstream = ["CVE-2006-2440"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20070201-01-P.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345595", "http://secunia.com/advisories/21719", "http://secunia.com/advisories/24186", "http://secunia.com/advisories/24284", "http://www.debian.org/security/2006/dsa-1168", "http://www.redhat.com/support/errata/RHSA-2007-0015.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9481", "ftp://patches.sgi.com/support/free/security/advisories/20070201-01-P.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345595", "http://secunia.com/advisories/21719", "http://secunia.com/advisories/24186", "http://secunia.com/advisories/24284", "http://www.debian.org/security/2006/dsa-1168", "http://www.redhat.com/support/errata/RHSA-2007-0015.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9481"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2006-2440"
imported = 2025-11-25T22:35:57.349Z
modified = 2025-04-03T01:03:51.193Z
published = 2006-05-18T10:02:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-2440"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-2440"
```

# Heap-based buffer overflow in the libMagick component of ImageMagick 6.0.6.2 might allow attackers t...

Heap-based buffer overflow in the libMagick component of ImageMagick 6.0.6.2 might allow attackers to execute arbitrary code via an image index array that triggers the overflow during filename glob expansion by the ExpandFilenames function.

