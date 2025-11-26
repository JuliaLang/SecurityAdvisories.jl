```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubse-ruoori"
modified = 2025-11-25T22:35:59.150Z
upstream = ["CVE-2012-1610"]
references = ["http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://ubuntu.com/usn/usn-1435-1", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.openwall.com/lists/oss-security/2012/04/04/6", "http://www.osvdb.org/81024", "http://www.securityfocus.com/bid/52898", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-0259", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74660", "http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://ubuntu.com/usn/usn-1435-1", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.openwall.com/lists/oss-security/2012/04/04/6", "http://www.osvdb.org/81024", "http://www.securityfocus.com/bid/52898", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-0259", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74660"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-1610"
imported = 2025-11-25T22:35:59.150Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:10.013Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-1610"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-1610"
```

# Integer overflow in the GetEXIFProperty function in magick/property.c in ImageMagick before 6.7.6-4 ...

Integer overflow in the GetEXIFProperty function in magick/property.c in ImageMagick before 6.7.6-4 allows remote attackers to cause a denial of service (out-of-bounds read) via a large component count for certain EXIF tags in a JPEG image.  NOTE: this vulnerability exists because of an incomplete fix for CVE-2012-0259.

