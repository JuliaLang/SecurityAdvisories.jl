```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauagw-rbukai"
modified = 2025-11-25T22:35:57.440Z
upstream = ["CVE-2007-0770"]
references = ["http://secunia.com/advisories/24167", "http://secunia.com/advisories/24196", "http://www.debian.org/security/2007/dsa-1260", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:041", "http://www.novell.com/linux/security/advisories/2007_3_sr.html", "http://www.osvdb.org/31911", "http://www.securityfocus.com/archive/1/459507/100/0/threaded", "http://www.ubuntu.com/usn/usn-422-1", "https://issues.rpath.com/browse/RPL-1034", "http://secunia.com/advisories/24167", "http://secunia.com/advisories/24196", "http://www.debian.org/security/2007/dsa-1260", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:041", "http://www.novell.com/linux/security/advisories/2007_3_sr.html", "http://www.osvdb.org/31911", "http://www.securityfocus.com/archive/1/459507/100/0/threaded", "http://www.ubuntu.com/usn/usn-422-1", "https://issues.rpath.com/browse/RPL-1034"]

[[affected]]
pkg = "GraphicsMagick_jll"
ranges = ["*"]
[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2007-0770"
imported = 2025-11-25T22:35:57.440Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-02-12T20:28:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-0770"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-0770"
```

# Buffer overflow in GraphicsMagick and ImageMagick allows user-assisted remote attackers to cause a d...

Buffer overflow in GraphicsMagick and ImageMagick allows user-assisted remote attackers to cause a denial of service and possibly execute arbitrary code via a PALM image that is not properly handled by the ReadPALMImage function in coders/palm.c. NOTE: this issue is due to an incomplete patch for CVE-2006-5456.

