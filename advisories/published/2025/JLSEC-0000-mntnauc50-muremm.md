```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc50-muremm"
modified = 2025-11-25T22:35:59.604Z
upstream = ["CVE-2014-8354"]
references = ["http://packetstormsecurity.com/files/128944/ImageMagick-Out-Of-Bounds-Read-Heap-Overflow.html", "http://www.securityfocus.com/bid/70830", "https://bugzilla.redhat.com/show_bug.cgi?id=1158518", "https://int21.de/cve/CVE-2014-8354-ImageMagick-oob-heap-overflow.html", "http://packetstormsecurity.com/files/128944/ImageMagick-Out-Of-Bounds-Read-Heap-Overflow.html", "http://www.securityfocus.com/bid/70830", "https://bugzilla.redhat.com/show_bug.cgi?id=1158518", "https://int21.de/cve/CVE-2014-8354-ImageMagick-oob-heap-overflow.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-8354"
imported = 2025-11-25T22:35:59.604Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T19:59:00.203Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-8354"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-8354"
```

# The HorizontalFilter function in resize.c in ImageMagick before 6.8.9-9 allows remote attackers to c...

The HorizontalFilter function in resize.c in ImageMagick before 6.8.9-9 allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted image file.

