```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubsf-qaghmx"
modified = 2025-11-25T22:35:59.151Z
upstream = ["CVE-2012-3437"]
references = ["http://lists.opensuse.org/opensuse-updates/2013-03/msg00101.html", "http://secunia.com/advisories/50091", "http://secunia.com/advisories/50398", "http://www.mandriva.com/security/advisories?name=MDVSA-2012:160", "http://www.mandriva.com/security/advisories?name=MDVSA-2013:092", "http://www.securityfocus.com/bid/54714", "http://www.securitytracker.com/id?1027321", "http://www.ubuntu.com/usn/USN-1544-1", "https://bugzilla.redhat.com/show_bug.cgi?id=844101", "https://exchange.xforce.ibmcloud.com/vulnerabilities/77260", "https://wiki.mageia.org/en/Support/Advisories/MGASA-2012-0243", "http://lists.opensuse.org/opensuse-updates/2013-03/msg00101.html", "http://secunia.com/advisories/50091", "http://secunia.com/advisories/50398", "http://www.mandriva.com/security/advisories?name=MDVSA-2012:160", "http://www.mandriva.com/security/advisories?name=MDVSA-2013:092", "http://www.securityfocus.com/bid/54714", "http://www.securitytracker.com/id?1027321", "http://www.ubuntu.com/usn/USN-1544-1", "https://bugzilla.redhat.com/show_bug.cgi?id=844101", "https://exchange.xforce.ibmcloud.com/vulnerabilities/77260", "https://wiki.mageia.org/en/Support/Advisories/MGASA-2012-0243"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2012-3437"
imported = 2025-11-25T22:35:59.151Z
modified = 2025-04-11T00:51:21.963Z
published = 2012-08-07T21:55:02.063Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2012-3437"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2012-3437"
```

# The Magick_png_malloc function in coders/png.c in ImageMagick 6.7.8 and earlier does not use the pro...

The Magick_png_malloc function in coders/png.c in ImageMagick 6.7.8 and earlier does not use the proper variable type for the allocation size, which might allow remote attackers to cause a denial of service (crash) via a crafted PNG file that triggers incorrect memory allocation.

