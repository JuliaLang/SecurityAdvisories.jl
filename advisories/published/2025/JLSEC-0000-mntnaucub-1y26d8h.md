```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucub-1y26d8h"
modified = 2025-11-25T22:36:00.515Z
upstream = ["CVE-2019-7397"]
references = ["http://hg.graphicsmagick.org/hg/GraphicsMagick/rev/11ad3aeb8ab1", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106847", "https://github.com/ImageMagick/ImageMagick/commit/306c1f0fa5754ca78efd16ab752f0e981d4f6b82", "https://github.com/ImageMagick/ImageMagick/issues/1454", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712", "http://hg.graphicsmagick.org/hg/GraphicsMagick/rev/11ad3aeb8ab1", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106847", "https://github.com/ImageMagick/ImageMagick/commit/306c1f0fa5754ca78efd16ab752f0e981d4f6b82", "https://github.com/ImageMagick/ImageMagick/issues/1454", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-7397"
imported = 2025-11-25T22:36:00.515Z
modified = 2024-11-21T04:48:08.860Z
published = 2019-02-05T00:29:00.510Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7397"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7397"
```

# In ImageMagick before 7.0.8-25 and GraphicsMagick through 1.3.31, several memory leaks exist in Writ...

In ImageMagick before 7.0.8-25 and GraphicsMagick through 1.3.31, several memory leaks exist in WritePDFImage in coders/pdf.c.

