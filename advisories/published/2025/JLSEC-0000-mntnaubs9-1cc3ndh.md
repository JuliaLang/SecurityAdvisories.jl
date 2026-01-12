```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubs9-1cc3ndh"
modified = 2025-11-25T22:35:59.145Z
upstream = ["CVE-2012-0247"]
references = ["http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://rhn.redhat.com/errata/RHSA-2012-0545.html", "http://secunia.com/advisories/47926", "http://secunia.com/advisories/48247", "http://secunia.com/advisories/48259", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://ubuntu.com/usn/usn-1435-1", "http://www.cert.fi/en/reports/2012/vulnerability595210.html", "http://www.debian.org/security/2012/dsa-2427", "http://www.gentoo.org/security/en/glsa/glsa-201203-09.xml", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20286", "http://www.osvdb.org/79003", "http://www.securitytracker.com/id?1027032", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://rhn.redhat.com/errata/RHSA-2012-0545.html", "http://secunia.com/advisories/47926", "http://secunia.com/advisories/48247", "http://secunia.com/advisories/48259", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://ubuntu.com/usn/usn-1435-1", "http://www.cert.fi/en/reports/2012/vulnerability595210.html", "http://www.debian.org/security/2012/dsa-2427", "http://www.gentoo.org/security/en/glsa/glsa-201203-09.xml", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20286", "http://www.osvdb.org/79003", "http://www.securitytracker.com/id?1027032"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-0247"
imported = 2025-11-25T22:35:59.145Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:06.950Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-0247"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-0247"
```

# ImageMagick 6.7.5-7 and earlier allows remote attackers to cause a denial of service (memory corrupt...

ImageMagick 6.7.5-7 and earlier allows remote attackers to cause a denial of service (memory corruption) and possibly execute arbitrary code via crafted offset and count values in the ResolutionUnit tag in the EXIF IFD0 of an image.

