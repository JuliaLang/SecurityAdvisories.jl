```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaua71-1czsp8j"
modified = 2025-11-25T22:35:57.085Z
upstream = ["CVE-2005-1275"]
references = ["http://bugs.gentoo.org/show_bug.cgi?id=90423", "http://seclists.org/lists/bugtraq/2005/Apr/0407.html", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/security/advisories?name=MDKSA-2005:107", "http://www.overflow.pl/adv/imheapoverflow.txt", "http://www.redhat.com/support/errata/RHSA-2005-413.html", "http://www.securityfocus.com/bid/13351", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10003", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A711", "http://bugs.gentoo.org/show_bug.cgi?id=90423", "http://seclists.org/lists/bugtraq/2005/Apr/0407.html", "http://www.imagemagick.org/script/changelog.php", "http://www.mandriva.com/security/advisories?name=MDKSA-2005:107", "http://www.overflow.pl/adv/imheapoverflow.txt", "http://www.redhat.com/support/errata/RHSA-2005-413.html", "http://www.securityfocus.com/bid/13351", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A10003", "https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A711"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2005-1275"
imported = 2025-11-25T22:35:57.085Z
modified = 2025-04-03T01:03:51.193Z
published = 2005-04-25T04:00:00.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2005-1275"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2005-1275"
```

# Heap-based buffer overflow in the ReadPNMImage function in pnm.c for ImageMagick 6.2.1 and earlier a...

Heap-based buffer overflow in the ReadPNMImage function in pnm.c for ImageMagick 6.2.1 and earlier allows remote attackers to cause a denial of service (application crash) via a PNM file with a small colors value.

