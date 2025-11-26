```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubn3-1dicws5"
modified = 2025-11-25T22:35:58.959Z
upstream = ["CVE-2009-1882"]
references = ["http://imagemagick.org/script/changelog.php", "http://lists.fedoraproject.org/pipermail/package-announce/2010-January/033766.html", "http://lists.fedoraproject.org/pipermail/package-announce/2010-January/033833.html", "http://lists.opensuse.org/opensuse-security-announce/2009-07/msg00002.html", "http://mirror1.smudge-it.co.uk/imagemagick/www/changelog.html", "http://osvdb.org/54729", "http://secunia.com/advisories/35216", "http://secunia.com/advisories/35382", "http://secunia.com/advisories/35685", "http://secunia.com/advisories/36260", "http://secunia.com/advisories/37959", "http://secunia.com/advisories/55721", "http://security.gentoo.org/glsa/glsa-201311-10.xml", "http://wiki.rpath.com/Advisories:rPSA-2010-0074", "http://www.debian.org/security/2009/dsa-1858", "http://www.openwall.com/lists/oss-security/2009/06/08/1", "http://www.securityfocus.com/archive/1/514516/100/0/threaded", "http://www.securityfocus.com/bid/35111", "http://www.vupen.com/english/advisories/2009/1449", "https://usn.ubuntu.com/784-1/", "http://imagemagick.org/script/changelog.php", "http://lists.fedoraproject.org/pipermail/package-announce/2010-January/033766.html", "http://lists.fedoraproject.org/pipermail/package-announce/2010-January/033833.html", "http://lists.opensuse.org/opensuse-security-announce/2009-07/msg00002.html", "http://mirror1.smudge-it.co.uk/imagemagick/www/changelog.html", "http://osvdb.org/54729", "http://secunia.com/advisories/35216", "http://secunia.com/advisories/35382", "http://secunia.com/advisories/35685", "http://secunia.com/advisories/36260", "http://secunia.com/advisories/37959", "http://secunia.com/advisories/55721", "http://security.gentoo.org/glsa/glsa-201311-10.xml", "http://wiki.rpath.com/Advisories:rPSA-2010-0074", "http://www.debian.org/security/2009/dsa-1858", "http://www.openwall.com/lists/oss-security/2009/06/08/1", "http://www.securityfocus.com/archive/1/514516/100/0/threaded", "http://www.securityfocus.com/bid/35111", "http://www.vupen.com/english/advisories/2009/1449", "https://usn.ubuntu.com/784-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2009-1882"
imported = 2025-11-25T22:35:58.959Z
modified = 2025-04-09T00:30:58.490Z
published = 2009-06-02T15:30:00.360Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2009-1882"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2009-1882"
```

# Integer overflow in the XMakeImage function in magick/xwindow.c in ImageMagick 6.5.2-8, and Graphics...

Integer overflow in the XMakeImage function in magick/xwindow.c in ImageMagick 6.5.2-8, and GraphicsMagick, allows remote attackers to cause a denial of service (crash) and possibly execute arbitrary code via a crafted TIFF file, which triggers a buffer overflow.  NOTE: some of these details are obtained from third party information.

