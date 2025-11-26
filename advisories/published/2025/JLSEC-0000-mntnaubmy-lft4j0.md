```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubmy-lft4j0"
modified = 2025-11-25T22:35:58.954Z
upstream = ["CVE-2007-4988"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=186030", "http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=597", "http://secunia.com/advisories/26926", "http://secunia.com/advisories/27048", "http://secunia.com/advisories/27309", "http://secunia.com/advisories/27364", "http://secunia.com/advisories/27439", "http://secunia.com/advisories/28721", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/36260", "http://security.gentoo.org/glsa/glsa-200710-27.xml", "http://studio.imagemagick.org/pipermail/magick-announce/2007-September/000037.html", "http://www.debian.org/security/2009/dsa-1858", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/en/security/advisories?name=MDVSA-2008:035", "http://www.novell.com/linux/security/advisories/2007_23_sr.html", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.securityfocus.com/archive/1/483572/100/0/threaded", "http://www.securityfocus.com/bid/25765", "http://www.securitytracker.com/id?1018729", "http://www.ubuntu.com/usn/usn-523-1", "http://www.vupen.com/english/advisories/2007/3245", "https://exchange.xforce.ibmcloud.com/vulnerabilities/36737", "https://issues.rpath.com/browse/RPL-1743", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9656", "http://bugs.gentoo.org/show_bug.cgi?id=186030", "http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=597", "http://secunia.com/advisories/26926", "http://secunia.com/advisories/27048", "http://secunia.com/advisories/27309", "http://secunia.com/advisories/27364", "http://secunia.com/advisories/27439", "http://secunia.com/advisories/28721", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/36260", "http://security.gentoo.org/glsa/glsa-200710-27.xml", "http://studio.imagemagick.org/pipermail/magick-announce/2007-September/000037.html", "http://www.debian.org/security/2009/dsa-1858", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/en/security/advisories?name=MDVSA-2008:035", "http://www.novell.com/linux/security/advisories/2007_23_sr.html", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.securityfocus.com/archive/1/483572/100/0/threaded", "http://www.securityfocus.com/bid/25765", "http://www.securitytracker.com/id?1018729", "http://www.ubuntu.com/usn/usn-523-1", "http://www.vupen.com/english/advisories/2007/3245", "https://exchange.xforce.ibmcloud.com/vulnerabilities/36737", "https://issues.rpath.com/browse/RPL-1743", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9656"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2007-4988"
imported = 2025-11-25T22:35:58.954Z
modified = 2025-04-09T00:30:58.490Z
published = 2007-09-24T22:17:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2007-4988"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2007-4988"
```

# Sign extension error in the ReadDIBImage function in ImageMagick before 6.3.5-9 allows context-depen...

Sign extension error in the ReadDIBImage function in ImageMagick before 6.3.5-9 allows context-dependent attackers to execute arbitrary code via a crafted width value in an image file, which triggers an integer overflow and a heap-based buffer overflow.

