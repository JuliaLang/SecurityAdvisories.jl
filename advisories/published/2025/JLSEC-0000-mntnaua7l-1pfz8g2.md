```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaua7l-1pfz8g2"
modified = 2025-11-25T22:35:57.105Z
upstream = ["CVE-2005-0397"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=83542", "http://marc.info/?l=bugtraq&m=110987256010857&w=2", "http://www.debian.org/security/2005/dsa-702", "http://www.gentoo.org/security/en/glsa/glsa-200503-11.xml", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "http://www.redhat.com/support/errata/RHSA-2005-070.html", "http://www.redhat.com/support/errata/RHSA-2005-320.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/19586", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10302", "http://bugs.gentoo.org/show_bug.cgi?id=83542", "http://marc.info/?l=bugtraq&m=110987256010857&w=2", "http://www.debian.org/security/2005/dsa-702", "http://www.gentoo.org/security/en/glsa/glsa-200503-11.xml", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "http://www.redhat.com/support/errata/RHSA-2005-070.html", "http://www.redhat.com/support/errata/RHSA-2005-320.html", "https://exchange.xforce.ibmcloud.com/vulnerabilities/19586", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10302"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-0397"
imported = 2025-11-25T22:35:57.105Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-05-02T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-0397"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-0397"
```

# Format string vulnerability in the SetImageInfo function in image.c for ImageMagick before 6.0.2.5 m...

Format string vulnerability in the SetImageInfo function in image.c for ImageMagick before 6.0.2.5 may allow remote attackers to cause a denial of service (application crash) and possibly execute arbitrary code via format string specifiers in a filename argument to convert, which may be called by other web applications.

