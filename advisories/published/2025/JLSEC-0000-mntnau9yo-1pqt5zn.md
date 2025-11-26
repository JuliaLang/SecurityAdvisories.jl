```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnau9yo-1pqt5zn"
modified = 2025-11-25T22:35:56.784Z
upstream = ["CVE-2004-0981"]
references = ["http://secunia.com/advisories/12995/", "http://security.gentoo.org/glsa/glsa-200411-11.xml", "http://www.imagemagick.org/www/Changelog.html", "http://www.securityfocus.org/bid/11548", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17903", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10472", "https://www.ubuntu.com/usn/usn-7-1/", "http://secunia.com/advisories/12995/", "http://security.gentoo.org/glsa/glsa-200411-11.xml", "http://www.imagemagick.org/www/Changelog.html", "http://www.securityfocus.org/bid/11548", "https://exchange.xforce.ibmcloud.com/vulnerabilities/17903", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10472", "https://www.ubuntu.com/usn/usn-7-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2004-0981"
imported = 2025-11-25T22:35:56.784Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-02-09T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2004-0981"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2004-0981"
```

# Buffer overflow in the EXIF parsing routine in ImageMagick before 6.1.0 allows remote attackers to e...

Buffer overflow in the EXIF parsing routine in ImageMagick before 6.1.0 allows remote attackers to execute arbitrary code via a certain image file.

