```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauaes-rv20dr"
modified = 2025-11-25T22:35:57.364Z
upstream = ["CVE-2006-4144"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20060901-01-P.asc", "http://secunia.com/advisories/21462", "http://secunia.com/advisories/21525", "http://secunia.com/advisories/21621", "http://secunia.com/advisories/21671", "http://secunia.com/advisories/21679", "http://secunia.com/advisories/21832", "http://secunia.com/advisories/22036", "http://secunia.com/advisories/22096", "http://secunia.com/advisories/22998", "http://security.gentoo.org/glsa/glsa-200609-14.xml", "http://securityreason.com/securityalert/1385", "http://securitytracker.com/id?1016699", "http://www.debian.org/security/2006/dsa-1213", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:155", "http://www.novell.com/linux/security/advisories/2006_50_imagemagick.html", "http://www.overflow.pl/adv/imsgiheap.txt", "http://www.redhat.com/support/errata/RHSA-2006-0633.html", "http://www.securityfocus.com/archive/1/443208/100/0/threaded", "http://www.securityfocus.com/archive/1/443362/100/0/threaded", "http://www.securityfocus.com/bid/19507", "http://www.ubuntu.com/usn/usn-337-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/28372", "https://issues.rpath.com/browse/RPL-605", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11129", "ftp://patches.sgi.com/support/free/security/advisories/20060901-01-P.asc", "http://secunia.com/advisories/21462", "http://secunia.com/advisories/21525", "http://secunia.com/advisories/21621", "http://secunia.com/advisories/21671", "http://secunia.com/advisories/21679", "http://secunia.com/advisories/21832", "http://secunia.com/advisories/22036", "http://secunia.com/advisories/22096", "http://secunia.com/advisories/22998", "http://security.gentoo.org/glsa/glsa-200609-14.xml", "http://securityreason.com/securityalert/1385", "http://securitytracker.com/id?1016699", "http://www.debian.org/security/2006/dsa-1213", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:155", "http://www.novell.com/linux/security/advisories/2006_50_imagemagick.html", "http://www.overflow.pl/adv/imsgiheap.txt", "http://www.redhat.com/support/errata/RHSA-2006-0633.html", "http://www.securityfocus.com/archive/1/443208/100/0/threaded", "http://www.securityfocus.com/archive/1/443362/100/0/threaded", "http://www.securityfocus.com/bid/19507", "http://www.ubuntu.com/usn/usn-337-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/28372", "https://issues.rpath.com/browse/RPL-605", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11129"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2006-4144"
imported = 2025-11-25T22:35:57.364Z
modified = 2025-04-03T01:03:51.193Z
published = 2006-08-15T23:04:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-4144"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-4144"
```

# Integer overflow in the ReadSGIImage function in sgi.c in ImageMagick before 6.2.9 allows user-assis...

Integer overflow in the ReadSGIImage function in sgi.c in ImageMagick before 6.2.9 allows user-assisted attackers to cause a denial of service (crash) and possibly execute arbitrary code via large (1) bytes_per_pixel, (2) columns, and (3) rows values, which trigger a heap-based buffer overflow.

