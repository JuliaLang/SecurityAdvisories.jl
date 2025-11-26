```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauaeb-13qcgyj"
modified = 2025-11-25T22:35:57.347Z
upstream = ["CVE-2005-4601"]
references = ["ftp://patches.sgi.com/support/free/security/advisories/20060301-01.U.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345238", "http://rhn.redhat.com/errata/RHSA-2006-0178.html", "http://secunia.com/advisories/18261", "http://secunia.com/advisories/18607", "http://secunia.com/advisories/18631", "http://secunia.com/advisories/18871", "http://secunia.com/advisories/19183", "http://secunia.com/advisories/19408", "http://secunia.com/advisories/23090", "http://secunia.com/advisories/28800", "http://slackware.com/security/viewer.php?l=slackware-security&y=2006&m=slackware-security.341682", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://www.debian.org/security/2006/dsa-957", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:024", "http://www.novell.com/linux/security/advisories/2006_06_sr.html", "http://www.osvdb.org/22121", "http://www.securityfocus.com/archive/1/452718/100/100/threaded", "http://www.securityfocus.com/bid/16093", "http://www.ubuntu.com/usn/usn-246-1", "http://www.vupen.com/english/advisories/2008/0412", "https://exchange.xforce.ibmcloud.com/vulnerabilities/23927", "https://issues.rpath.com/browse/RPL-389", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10353", "ftp://patches.sgi.com/support/free/security/advisories/20060301-01.U.asc", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=345238", "http://rhn.redhat.com/errata/RHSA-2006-0178.html", "http://secunia.com/advisories/18261", "http://secunia.com/advisories/18607", "http://secunia.com/advisories/18631", "http://secunia.com/advisories/18871", "http://secunia.com/advisories/19183", "http://secunia.com/advisories/19408", "http://secunia.com/advisories/23090", "http://secunia.com/advisories/28800", "http://slackware.com/security/viewer.php?l=slackware-security&y=2006&m=slackware-security.341682", "http://sunsolve.sun.com/search/document.do?assetkey=1-26-231321-1", "http://www.debian.org/security/2006/dsa-957", "http://www.mandriva.com/security/advisories?name=MDKSA-2006:024", "http://www.novell.com/linux/security/advisories/2006_06_sr.html", "http://www.osvdb.org/22121", "http://www.securityfocus.com/archive/1/452718/100/100/threaded", "http://www.securityfocus.com/bid/16093", "http://www.ubuntu.com/usn/usn-246-1", "http://www.vupen.com/english/advisories/2008/0412", "https://exchange.xforce.ibmcloud.com/vulnerabilities/23927", "https://issues.rpath.com/browse/RPL-389", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10353"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-4601"
imported = 2025-11-25T22:35:57.347Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-12-31T05:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-4601"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-4601"
```

# The delegate code in ImageMagick 6.2.4.5-0.3 allows remote attackers to execute arbitrary commands v...

The delegate code in ImageMagick 6.2.4.5-0.3 allows remote attackers to execute arbitrary commands via shell metacharacters in a filename that is processed by the display command.

