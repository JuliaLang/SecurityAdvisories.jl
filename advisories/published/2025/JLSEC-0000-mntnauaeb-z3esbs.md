```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauaeb-z3esbs"
modified = 2025-11-25T22:35:57.347Z
upstream = ["CVE-2006-0082"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20060301-01.U.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345876", "http://rhn.redhat.com/errata/RHSA-2006-0178.html", "http://secunia.com/advisories/18261", "http://secunia.com/advisories/18607", "http://secunia.com/advisories/18851", "http://secunia.com/advisories/18871", "http://secunia.com/advisories/19030", "http://secunia.com/advisories/19183", "http://secunia.com/advisories/19408", "http://secunia.com/advisories/22998", "http://secunia.com/advisories/23090", "http://secunia.com/advisories/28800", "http://securityreason.com/securityalert/500", "http://securitytracker.com/id?1015623", "http://slackware.com/security/viewer.php?l=slackware-security&y=2006&m=slackware-security.341682", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://www.debian.org/security/2006/dsa-1213", "http://www.gentoo.org/security/en/glsa/glsa-200602-06.xml", "http://www.gentoo.org/security/en/glsa/glsa-200602-13.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:024", "http://www.novell.com/linux/security/advisories/2006_06_sr.html", "http://www.securityfocus.com/archive/1/452718/100/100/threaded", "http://www.securityfocus.com/bid/12717", "http://www.ubuntu.com/usn/usn-246-1", "http://www.vupen.com/english/advisories/2008/0412", "https://issues.rpath.com/browse/RPL-389", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10717", "ftp://patches.sgi.com/support/free/security/advisories/20060301-01.U.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345876", "http://rhn.redhat.com/errata/RHSA-2006-0178.html", "http://secunia.com/advisories/18261", "http://secunia.com/advisories/18607", "http://secunia.com/advisories/18851", "http://secunia.com/advisories/18871", "http://secunia.com/advisories/19030", "http://secunia.com/advisories/19183", "http://secunia.com/advisories/19408", "http://secunia.com/advisories/22998", "http://secunia.com/advisories/23090", "http://secunia.com/advisories/28800", "http://securityreason.com/securityalert/500", "http://securitytracker.com/id?1015623", "http://slackware.com/security/viewer.php?l=slackware-security&y=2006&m=slackware-security.341682", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://www.debian.org/security/2006/dsa-1213", "http://www.gentoo.org/security/en/glsa/glsa-200602-06.xml", "http://www.gentoo.org/security/en/glsa/glsa-200602-13.xml", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:024", "http://www.novell.com/linux/security/advisories/2006_06_sr.html", "http://www.securityfocus.com/archive/1/452718/100/100/threaded", "http://www.securityfocus.com/bid/12717", "http://www.ubuntu.com/usn/usn-246-1", "http://www.vupen.com/english/advisories/2008/0412", "https://issues.rpath.com/browse/RPL-389", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10717"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2006-0082"
imported = 2025-11-25T22:35:57.347Z
modified = 2025-04-03T01:03:51.193Z
published = 2006-01-04T23:03:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-0082"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-0082"
```

# Format string vulnerability in the SetImageInfo function in image.c for ImageMagick 6.2.3 and other ...

Format string vulnerability in the SetImageInfo function in image.c for ImageMagick 6.2.3 and other versions, and GraphicsMagick, allows user-assisted attackers to cause a denial of service (crash) and possibly execute arbitrary code via a numeric format string specifier such as %d in the file name, a variant of CVE-2005-0397, and as demonstrated using the convert program.

