```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyg4d5hk-1qggbie"
modified = 2026-03-26T21:18:48.584Z
upstream = ["CVE-2003-0693"]
references = ["http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010103.html", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010135.html", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010146.html", "http://marc.info/?l=bugtraq&m=106373247528528&w=2", "http://marc.info/?l=bugtraq&m=106373546332230&w=2", "http://marc.info/?l=bugtraq&m=106374466212309&w=2", "http://marc.info/?l=bugtraq&m=106381396120332&w=2", "http://marc.info/?l=bugtraq&m=106381409220492&w=2", "http://sunsolve.sun.com/search/document.do?assetkey=1-77-1000620.1-1", "http://www.cert.org/advisories/CA-2003-24.html", "http://www.debian.org/security/2003/dsa-382", "http://www.debian.org/security/2003/dsa-383", "http://www.kb.cert.org/vuls/id/333628", "http://www.mandriva.com/security/advisories?name=MDKSA-2003:090", "http://www.openssh.com/txt/buffer.adv", "http://www.openwall.com/lists/oss-security/2024/07/01/3", "http://www.redhat.com/support/errata/RHSA-2003-280.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/13191", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A2719", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A447", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010103.html", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010135.html", "http://lists.grok.org.uk/pipermail/full-disclosure/2003-September/010146.html", "http://marc.info/?l=bugtraq&m=106373247528528&w=2", "http://marc.info/?l=bugtraq&m=106373546332230&w=2", "http://marc.info/?l=bugtraq&m=106374466212309&w=2", "http://marc.info/?l=bugtraq&m=106381396120332&w=2", "http://marc.info/?l=bugtraq&m=106381409220492&w=2", "http://sunsolve.sun.com/search/document.do?assetkey=1-77-1000620.1-1", "http://www.cert.org/advisories/CA-2003-24.html", "http://www.debian.org/security/2003/dsa-382", "http://www.debian.org/security/2003/dsa-383", "http://www.kb.cert.org/vuls/id/333628", "http://www.mandriva.com/security/advisories?name=MDKSA-2003:090", "http://www.openssh.com/txt/buffer.adv", "http://www.openwall.com/lists/oss-security/2024/07/01/3", "http://www.redhat.com/support/errata/RHSA-2003-280.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/13191", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A2719", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A447"]

[[affected]]
pkg = "OpenSSH_jll"
ranges = ["< 9.3.2+0"]

[[jlsec_sources]]
id = "CVE-2003-0693"
imported = 2026-03-26T21:18:48.583Z
modified = 2025-04-03T01:03:51.193Z
published = 2003-09-22T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2003-0693"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2003-0693"
```

# A "buffer management error" in buffer_append_space of buffer.c for OpenSSH before 3.7 may allow remo...

A "buffer management error" in buffer_append_space of buffer.c for OpenSSH before 3.7 may allow remote attackers to execute arbitrary code by causing an incorrect amount of memory to be freed and corrupting the heap, a different vulnerability than CVE-2003-0695.

