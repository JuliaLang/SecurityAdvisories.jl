```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubs8-tblutc"
modified = 2025-11-25T22:35:59.144Z
upstream = ["CVE-2010-4167"]
references = ["http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=601824", "http://lists.fedoraproject.org/pipermail/package-announce/2010-December/052515.html", "http://lists.fedoraproject.org/pipermail/package-announce/2010-December/052599.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/42497", "http://secunia.com/advisories/42744", "http://secunia.com/advisories/48100", "http://secunia.com/advisories/49063", "http://www.imagemagick.org/script/changelog.php", "http://www.openwall.com/lists/oss-security/2010/11/13/1", "http://www.openwall.com/lists/oss-security/2010/11/15/3", "http://www.securityfocus.com/bid/45044", "http://www.ubuntu.com/usn/USN-1028-1", "http://www.vupen.com/english/advisories/2010/3150", "http://www.vupen.com/english/advisories/2010/3322", "https://bugzilla.redhat.com/show_bug.cgi?id=652860", "http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=601824", "http://lists.fedoraproject.org/pipermail/package-announce/2010-December/052515.html", "http://lists.fedoraproject.org/pipermail/package-announce/2010-December/052599.html", "http://rhn.redhat.com/errata/RHSA-2012-0544.html", "http://secunia.com/advisories/42497", "http://secunia.com/advisories/42744", "http://secunia.com/advisories/48100", "http://secunia.com/advisories/49063", "http://www.imagemagick.org/script/changelog.php", "http://www.openwall.com/lists/oss-security/2010/11/13/1", "http://www.openwall.com/lists/oss-security/2010/11/15/3", "http://www.securityfocus.com/bid/45044", "http://www.ubuntu.com/usn/USN-1028-1", "http://www.vupen.com/english/advisories/2010/3150", "http://www.vupen.com/english/advisories/2010/3322", "https://bugzilla.redhat.com/show_bug.cgi?id=652860"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2010-4167"
imported = 2025-11-25T22:35:59.144Z
modified = 2025-04-11T00:51:21.963Z
published = 2010-11-22T20:00:03.637Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2010-4167"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2010-4167"
```

# Untrusted search path vulnerability in configure.c in ImageMagick before 6.6.5-5, when MAGICKCORE_IN...

Untrusted search path vulnerability in configure.c in ImageMagick before 6.6.5-5, when MAGICKCORE_INSTALLED_SUPPORT is defined, allows local users to gain privileges via a Trojan horse configuration file in the current working directory.

