```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsa-1qjrkft"
modified = 2025-11-25T22:35:59.146Z
upstream = ["CVE-2012-0259"]
references = ["http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/48679", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://ubuntu.com/usn/usn-1435-1", "http://www.cert.fi/en/reports/2012/vulnerability635606.html", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81021", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-0259", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74657", "http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/48679", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://ubuntu.com/usn/usn-1435-1", "http://www.cert.fi/en/reports/2012/vulnerability635606.html", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81021", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-0259", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74657"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-0259"
imported = 2025-11-25T22:35:59.146Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:07.733Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-0259"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-0259"
```

# The GetEXIFProperty function in magick/property.c in ImageMagick before 6.7.6-3 allows remote attack...

The GetEXIFProperty function in magick/property.c in ImageMagick before 6.7.6-3 allows remote attackers to cause a denial of service (crash) via a zero value in the component count of an EXIF XResolution tag in a JPEG file, which triggers an out-of-bounds read.

