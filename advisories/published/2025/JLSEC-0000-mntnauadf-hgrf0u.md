```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauadf-hgrf0u"
modified = 2025-11-25T22:35:57.315Z
upstream = ["CVE-2005-1739"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=90423", "http://secunia.com/advisories/15429", "http://secunia.com/advisories/15446", "http://secunia.com/advisories/15453", "http://security.gentoo.org/glsa/glsa-200505-16.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2005:107", "http://www.osvdb.org/16774", "http://www.osvdb.org/16775", "http://www.redhat.com/support/errata/RHSA-2005-480.html", "http://www.securityfocus.com/bid/13705", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11667", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A960", "https://usn.ubuntu.com/132-1/", "http://bugs.gentoo.org/show_bug.cgi?id=90423", "http://secunia.com/advisories/15429", "http://secunia.com/advisories/15446", "http://secunia.com/advisories/15453", "http://security.gentoo.org/glsa/glsa-200505-16.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2005:107", "http://www.osvdb.org/16774", "http://www.osvdb.org/16775", "http://www.redhat.com/support/errata/RHSA-2005-480.html", "http://www.securityfocus.com/bid/13705", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11667", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A960", "https://usn.ubuntu.com/132-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-1739"
imported = 2025-11-25T22:35:57.315Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-05-24T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-1739"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-1739"
```

# The XWD Decoder in ImageMagick before 6.2.2.3, and GraphicsMagick before 1.1.6-r1, allows remote att...

The XWD Decoder in ImageMagick before 6.2.2.3, and GraphicsMagick before 1.1.6-r1, allows remote attackers to cause a denial of service (infinite loop) via an image with a zero color mask.

