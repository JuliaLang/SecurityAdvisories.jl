```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubjs-19bp5ge"
modified = 2025-11-25T22:35:58.840Z
upstream = ["CVE-2007-1797"]
references = ["http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=496", "http://secunia.com/advisories/24721", "http://secunia.com/advisories/24739", "http://secunia.com/advisories/25072", "http://secunia.com/advisories/25206", "http://secunia.com/advisories/25992", "http://secunia.com/advisories/26177", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/29857", "http://secunia.com/advisories/36260", "http://security.gentoo.org/glsa/glsa-200705-13.xml", "http://www.debian.org/security/2009/dsa-1858", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:147", "http://www.novell.com/linux/security/advisories/2007_8_sr.html", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.redhat.com/support/errata/RHSA-2008-0165.html", "http://www.securityfocus.com/bid/23252", "http://www.securityfocus.com/bid/23347", "http://www.securitytracker.com/id?1017839", "http://www.ubuntu.com/usn/usn-481-1", "http://www.vupen.com/english/advisories/2007/1200", "https://exchange.xforce.ibmcloud.com/vulnerabilities/33376", "https://exchange.xforce.ibmcloud.com/vulnerabilities/33377", "https://issues.foresightlinux.org/browse/FL-222", "https://issues.rpath.com/browse/RPL-1205", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9254", "http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=496", "http://secunia.com/advisories/24721", "http://secunia.com/advisories/24739", "http://secunia.com/advisories/25072", "http://secunia.com/advisories/25206", "http://secunia.com/advisories/25992", "http://secunia.com/advisories/26177", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/29857", "http://secunia.com/advisories/36260", "http://security.gentoo.org/glsa/glsa-200705-13.xml", "http://www.debian.org/security/2009/dsa-1858", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/security/advisories?name=MDKSA-2007:147", "http://www.novell.com/linux/security/advisories/2007_8_sr.html", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.redhat.com/support/errata/RHSA-2008-0165.html", "http://www.securityfocus.com/bid/23252", "http://www.securityfocus.com/bid/23347", "http://www.securitytracker.com/id?1017839", "http://www.ubuntu.com/usn/usn-481-1", "http://www.vupen.com/english/advisories/2007/1200", "https://exchange.xforce.ibmcloud.com/vulnerabilities/33376", "https://exchange.xforce.ibmcloud.com/vulnerabilities/33377", "https://issues.foresightlinux.org/browse/FL-222", "https://issues.rpath.com/browse/RPL-1205", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9254"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2007-1797"
imported = 2025-11-25T22:35:58.840Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-04-02T22:19:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-1797"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-1797"
```

# Multiple integer overflows in ImageMagick before 6.3.3-5 allow remote attackers to execute arbitrary...

Multiple integer overflows in ImageMagick before 6.3.3-5 allow remote attackers to execute arbitrary code via (1) a crafted DCM image, which results in a heap-based overflow in the ReadDCMImage function, or (2) the (a) colors or (b) comments field in a crafted XWD image, which results in a heap-based overflow in the ReadXWDImage function, different issues than CVE-2007-1667.

