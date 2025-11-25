```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuy-167zg2c"
modified = 2025-11-25T22:35:59.242Z
upstream = ["CVE-2016-10067"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95220", "https://bugzilla.redhat.com/show_bug.cgi?id=1410494", "https://github.com/ImageMagick/ImageMagick/commit/0474237508f39c4f783208123431815f1ededb76", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95220", "https://bugzilla.redhat.com/show_bug.cgi?id=1410494", "https://github.com/ImageMagick/ImageMagick/commit/0474237508f39c4f783208123431815f1ededb76"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10067"
imported = 2025-11-25T22:35:59.242Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.443Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10067"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10067"
```

# magick/memory.c in ImageMagick before 6.9.4-5 allows remote attackers to cause a denial of service (...

magick/memory.c in ImageMagick before 6.9.4-5 allows remote attackers to cause a denial of service (application crash) via vectors involving "too many exceptions," which trigger a buffer overflow.

