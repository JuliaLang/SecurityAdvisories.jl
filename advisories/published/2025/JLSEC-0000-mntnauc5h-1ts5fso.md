```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5h-1ts5fso"
modified = 2025-11-25T22:35:59.621Z
upstream = ["CVE-2016-7513"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93121", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=832455", "https://bugzilla.redhat.com/show_bug.cgi?id=1378733", "https://github.com/ImageMagick/ImageMagick/commit/a54fe0e8600eaf3dc6fe717d3c0398001507f723", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93121", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=832455", "https://bugzilla.redhat.com/show_bug.cgi?id=1378733", "https://github.com/ImageMagick/ImageMagick/commit/a54fe0e8600eaf3dc6fe717d3c0398001507f723"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7513"
imported = 2025-11-25T22:35:59.621Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.827Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7513"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7513"
```

# Off-by-one error in magick/cache.c in ImageMagick allows remote attackers to cause a denial of servi...

Off-by-one error in magick/cache.c in ImageMagick allows remote attackers to cause a denial of service (segmentation fault) via unspecified vectors.

