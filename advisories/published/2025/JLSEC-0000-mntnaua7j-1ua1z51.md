```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaua7j-1ua1z51"
modified = 2025-11-25T22:35:57.103Z
upstream = ["CVE-2005-0005"]
references = ["http://marc.info/?l=bugtraq&m=110608222117215&w=2", "http://www.debian.org/security/2005/dsa-646", "http://www.gentoo.org/security/en/glsa/glsa-200501-37.xml", "http://www.idefense.com/application/poi/display?id=184&type=vulnerabilities", "http://www.redhat.com/support/errata/RHSA-2005-070.html", "http://www.redhat.com/support/errata/RHSA-2005-071.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9925", "http://marc.info/?l=bugtraq&m=110608222117215&w=2", "http://www.debian.org/security/2005/dsa-646", "http://www.gentoo.org/security/en/glsa/glsa-200501-37.xml", "http://www.idefense.com/application/poi/display?id=184&type=vulnerabilities", "http://www.redhat.com/support/errata/RHSA-2005-070.html", "http://www.redhat.com/support/errata/RHSA-2005-071.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A9925"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-0005"
imported = 2025-11-25T22:35:57.103Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-05-02T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-0005"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-0005"
```

# Heap-based buffer overflow in psd.c for ImageMagick 6.1.0, 6.1.7, and possibly earlier versions allo...

Heap-based buffer overflow in psd.c for ImageMagick 6.1.0, 6.1.7, and possibly earlier versions allows remote attackers to execute arbitrary code via a .PSD image file with a large number of layers.

