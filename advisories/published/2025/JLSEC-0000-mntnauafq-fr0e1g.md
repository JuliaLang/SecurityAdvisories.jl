```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauafq-fr0e1g"
modified = 2025-11-25T22:35:57.398Z
upstream = ["CVE-2006-3744"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20060901-01-P.asc", "http://bugs.gentoo.org/show_bug.cgi?id=144854", "http://secunia.com/advisories/21615", "http://secunia.com/advisories/21621", "http://secunia.com/advisories/21671", "http://secunia.com/advisories/21679", "http://secunia.com/advisories/21719", "http://secunia.com/advisories/21780", "http://secunia.com/advisories/21832", "http://secunia.com/advisories/22036", "http://secunia.com/advisories/22096", "http://security.gentoo.org/glsa/glsa-200609-14.xml", "http://securitytracker.com/id?1016749", "http://www.debian.org/security/2006/dsa-1168", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:155", "http://www.novell.com/linux/security/advisories/2006_50_imagemagick.html", "http://www.osvdb.org/28204", "http://www.redhat.com/support/errata/RHSA-2006-0633.html", "http://www.securityfocus.com/bid/19699", "http://www.ubuntu.com/usn/usn-340-1", "http://www.vupen.com/english/advisories/2006/3375", "https://exchange.xforce.ibmcloud.com/vulnerabilities/28574", "https://issues.rpath.com/browse/RPL-605", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11486", "ftp://patches.sgi.com/support/free/security/advisories/20060901-01-P.asc", "http://bugs.gentoo.org/show_bug.cgi?id=144854", "http://secunia.com/advisories/21615", "http://secunia.com/advisories/21621", "http://secunia.com/advisories/21671", "http://secunia.com/advisories/21679", "http://secunia.com/advisories/21719", "http://secunia.com/advisories/21780", "http://secunia.com/advisories/21832", "http://secunia.com/advisories/22036", "http://secunia.com/advisories/22096", "http://security.gentoo.org/glsa/glsa-200609-14.xml", "http://securitytracker.com/id?1016749", "http://www.debian.org/security/2006/dsa-1168", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:155", "http://www.novell.com/linux/security/advisories/2006_50_imagemagick.html", "http://www.osvdb.org/28204", "http://www.redhat.com/support/errata/RHSA-2006-0633.html", "http://www.securityfocus.com/bid/19699", "http://www.ubuntu.com/usn/usn-340-1", "http://www.vupen.com/english/advisories/2006/3375", "https://exchange.xforce.ibmcloud.com/vulnerabilities/28574", "https://issues.rpath.com/browse/RPL-605", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11486"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2006-3744"
imported = 2025-11-25T22:35:57.398Z
modified = 2025-04-03T01:03:51.193Z
published = 2006-08-25T01:04:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2006-3744"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2006-3744"
```

# Multiple integer overflows in ImageMagick before 6.2.9 allows user-assisted attackers to execute arb...

Multiple integer overflows in ImageMagick before 6.2.9 allows user-assisted attackers to execute arbitrary code via crafted Sun Rasterfile (bitmap) images that trigger heap-based buffer overflows.

