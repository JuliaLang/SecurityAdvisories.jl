```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsb-ri2mx7"
modified = 2025-11-25T22:35:59.147Z
upstream = ["CVE-2012-0260"]
references = ["http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://rhn.redhat.com/errata/RHSA-2012-0545.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://secunia.com/advisories/57224", "http://www.cert.fi/en/reports/2012/vulnerability635606.html", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81022", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "http://www.ubuntu.com/usn/USN-2132-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74658", "http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://rhn.redhat.com/errata/RHSA-2012-0545.html", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49063", "http://secunia.com/advisories/49068", "http://secunia.com/advisories/49317", "http://secunia.com/advisories/55035", "http://secunia.com/advisories/57224", "http://www.cert.fi/en/reports/2012/vulnerability635606.html", "http://www.debian.org/security/2012/dsa-2462", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=4&t=20629", "http://www.osvdb.org/81022", "http://www.securityfocus.com/bid/52898", "http://www.securitytracker.com/id?1027032", "http://www.ubuntu.com/usn/USN-2132-1", "https://exchange.xforce.ibmcloud.com/vulnerabilities/74658"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-0260"
imported = 2025-11-25T22:35:59.147Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:07.793Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-0260"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-0260"
```

# The JPEGWarningHandler function in coders/jpeg.c in ImageMagick before 6.7.6-3 allows remote attacke...

The JPEGWarningHandler function in coders/jpeg.c in ImageMagick before 6.7.6-3 allows remote attackers to cause a denial of service (memory consumption) via a JPEG image with a crafted sequence of restart markers.

