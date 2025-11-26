```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc52-3xq9rn"
modified = 2025-11-25T22:35:59.606Z
upstream = ["CVE-2014-8562"]
references = ["http://www.securityfocus.com/bid/70837", "https://bugzilla.redhat.com/show_bug.cgi?id=1159362", "https://int21.de/cve/CVE-2014-8562-ImageMagick-dcm-oob-heap-overflow.html", "https://packetstormsecurity.com/files/128944/ImageMagick-Out-Of-Bounds-Read-Heap-Overflow.html", "http://www.securityfocus.com/bid/70837", "https://bugzilla.redhat.com/show_bug.cgi?id=1159362", "https://int21.de/cve/CVE-2014-8562-ImageMagick-dcm-oob-heap-overflow.html", "https://packetstormsecurity.com/files/128944/ImageMagick-Out-Of-Bounds-Read-Heap-Overflow.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-8562"
imported = 2025-11-25T22:35:59.606Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T19:59:00.280Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-8562"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-8562"
```

# DCM decode in ImageMagick before 6.8.9-9 allows remote attackers to cause a denial of service (out-o...

DCM decode in ImageMagick before 6.8.9-9 allows remote attackers to cause a denial of service (out-of-bounds read).

