```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubn0-gxrjrz"
modified = 2025-11-25T22:35:58.956Z
upstream = ["CVE-2008-1096"]
references = ["http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=414370", "http://lists.opensuse.org/opensuse-security-announce/2008-07/msg00001.html", "http://osvdb.org/43212", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/30967", "http://secunia.com/advisories/32945", "http://secunia.com/advisories/36260", "http://www.debian.org/security/2009/dsa-1858", "http://www.mandriva.com/security/advisories?name=MDVSA-2008:099", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.securityfocus.com/bid/28821", "http://www.securitytracker.com/id?1019880", "http://www.ubuntu.com/usn/USN-681-1", "https://bugzilla.redhat.com/show_bug.cgi?id=286411", "https://exchange.xforce.ibmcloud.com/vulnerabilities/41194", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10843", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=414370", "http://lists.opensuse.org/opensuse-security-announce/2008-07/msg00001.html", "http://osvdb.org/43212", "http://secunia.com/advisories/29786", "http://secunia.com/advisories/30967", "http://secunia.com/advisories/32945", "http://secunia.com/advisories/36260", "http://www.debian.org/security/2009/dsa-1858", "http://www.mandriva.com/security/advisories?name=MDVSA-2008:099", "http://www.redhat.com/support/errata/RHSA-2008-0145.html", "http://www.securityfocus.com/bid/28821", "http://www.securitytracker.com/id?1019880", "http://www.ubuntu.com/usn/USN-681-1", "https://bugzilla.redhat.com/show_bug.cgi?id=286411", "https://exchange.xforce.ibmcloud.com/vulnerabilities/41194", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10843"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2008-1096"
imported = 2025-11-25T22:35:58.956Z
modified = 2025-04-09T00:30:58.490Z
published = 2008-03-05T20:44:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2008-1096"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2008-1096"
```

# The load_tile function in the XCF coder in coders/xcf.c in (1) ImageMagick 6.2.8-0 and (2) GraphicsM...

The load_tile function in the XCF coder in coders/xcf.c in (1) ImageMagick 6.2.8-0 and (2) GraphicsMagick (aka gm) 1.1.7 allows user-assisted remote attackers to cause a denial of service (crash) or possibly execute arbitrary code via a crafted .xcf file that triggers an out-of-bounds heap write, possibly related to the ScaleCharToQuantum function.

