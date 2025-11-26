```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyn-i7pi0c"
modified = 2025-11-25T22:35:59.375Z
upstream = ["CVE-2016-10048"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95186", "https://bugzilla.redhat.com/show_bug.cgi?id=1410451", "https://github.com/ImageMagick/ImageMagick/commit/fc6080f1321fd21e86ef916195cc110b05d9effb", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95186", "https://bugzilla.redhat.com/show_bug.cgi?id=1410451", "https://github.com/ImageMagick/ImageMagick/commit/fc6080f1321fd21e86ef916195cc110b05d9effb"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10048"
imported = 2025-11-25T22:35:59.375Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10048"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10048"
```

# Directory traversal vulnerability in magick/module.c in ImageMagick 6.9.4-7 allows remote attackers ...

Directory traversal vulnerability in magick/module.c in ImageMagick 6.9.4-7 allows remote attackers to load arbitrary modules via unspecified vectors.

