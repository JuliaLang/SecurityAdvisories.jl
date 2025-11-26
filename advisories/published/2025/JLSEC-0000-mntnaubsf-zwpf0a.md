```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsf-zwpf0a"
modified = 2025-11-25T22:35:59.151Z
upstream = ["CVE-2012-1798"]
references = ["http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81023", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74659", "http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81023", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74659"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-1798"
imported = 2025-11-25T22:35:59.151Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:10.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-1798"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-1798"
```

# The TIFFGetEXIFProperties function in coders/tiff.c in ImageMagick before 6.7.6-3 allows remote atta...

The TIFFGetEXIFProperties function in coders/tiff.c in ImageMagick before 6.7.6-3 allows remote attackers to cause a denial of service (out-of-bounds read and crash) via a crafted EXIF IFD in a TIFF image.

