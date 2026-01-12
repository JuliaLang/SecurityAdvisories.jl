```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsc-v6brpj"
modified = 2025-11-25T22:35:59.148Z
upstream = ["CVE-2012-1185"]
references = ["http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://secunia.com/advisories/47926", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49317", "http://trac.imagemagick.org/changeset/6998/ImageMagick/branches/ImageMagick-6.7.5/magick/profile.c", "http://trac.imagemagick.org/changeset/6998/ImageMagick/branches/ImageMagick-6.7.5/magick/property.c", "http://ubuntu.com/usn/usn-1435-1", "http://www.debian.org/security/2012/dsa-2462", "http://www.openwall.com/lists/oss-security/2012/03/19/5", "http://www.osvdb.org/80556", "http://www.securityfocus.com/bid/51957", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-1185", "https://exchange.xforce.ibmcloud.com/vulnerabilities/76140", "http://lists.opensuse.org/opensuse-updates/2012-06/msg00001.html", "http://secunia.com/advisories/47926", "http://secunia.com/advisories/48974", "http://secunia.com/advisories/49043", "http://secunia.com/advisories/49317", "http://trac.imagemagick.org/changeset/6998/ImageMagick/branches/ImageMagick-6.7.5/magick/profile.c", "http://trac.imagemagick.org/changeset/6998/ImageMagick/branches/ImageMagick-6.7.5/magick/property.c", "http://ubuntu.com/usn/usn-1435-1", "http://www.debian.org/security/2012/dsa-2462", "http://www.openwall.com/lists/oss-security/2012/03/19/5", "http://www.osvdb.org/80556", "http://www.securityfocus.com/bid/51957", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-1185", "https://exchange.xforce.ibmcloud.com/vulnerabilities/76140"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-1185"
imported = 2025-11-25T22:35:59.148Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-06-05T22:55:09.887Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-1185"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-1185"
```

# Multiple integer overflows in (1) magick/profile.c or (2) magick/property.c in ImageMagick 6.7.5 and...

Multiple integer overflows in (1) magick/profile.c or (2) magick/property.c in ImageMagick 6.7.5 and earlier allow remote attackers to cause a denial of service (memory corruption) and possibly execute arbitrary code via crafted offset value in the ResolutionUnit tag in the EXIF IFD0 of an image.  NOTE: this vulnerability exists because of an incomplete fix for CVE-2012-0247.

