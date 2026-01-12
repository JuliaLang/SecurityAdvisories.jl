```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubym-5xcdr5"
modified = 2025-11-25T22:35:59.374Z
upstream = ["CVE-2016-10047"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95182", "https://bugzilla.redhat.com/show_bug.cgi?id=1410449", "https://github.com/ImageMagick/ImageMagick/commit/fc6080f1321fd21e86ef916195cc110b05d9effb", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95182", "https://bugzilla.redhat.com/show_bug.cgi?id=1410449", "https://github.com/ImageMagick/ImageMagick/commit/fc6080f1321fd21e86ef916195cc110b05d9effb"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10047"
imported = 2025-11-25T22:35:59.374Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10047"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10047"
```

# Memory leak in the NewXMLTree function in magick/xml-tree.c in ImageMagick before 6.9.4-7 allows rem...

Memory leak in the NewXMLTree function in magick/xml-tree.c in ImageMagick before 6.9.4-7 allows remote attackers to cause a denial of service (memory consumption) via a crafted XML file.

