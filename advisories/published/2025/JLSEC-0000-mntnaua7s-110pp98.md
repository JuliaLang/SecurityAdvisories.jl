```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaua7s-110pp98"
modified = 2025-11-25T22:35:57.112Z
upstream = ["CVE-2005-0760"]
references = ["http://securitytracker.com/id?1013550", "http://www.debian.org/security/2005/dsa-702", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11184", "https://rhn.redhat.com/errata/RHSA-2005-070.html", "http://securitytracker.com/id?1013550", "http://www.debian.org/security/2005/dsa-702", "http://www.novell.com/linux/security/advisories/2005_17_imagemagick.html", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A11184", "https://rhn.redhat.com/errata/RHSA-2005-070.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-0760"
imported = 2025-11-25T22:35:57.112Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-05-02T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-0760"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-0760"
```

# The TIFF decoder in ImageMagick before 6.0 allows remote attackers to cause a denial of service (cra...

The TIFF decoder in ImageMagick before 6.0 allows remote attackers to cause a denial of service (crash) via a crafted TIFF file.

