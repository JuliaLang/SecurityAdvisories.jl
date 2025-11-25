```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4o-1o7oxl4"
modified = 2025-11-25T22:35:59.592Z
upstream = ["CVE-2014-9815"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=1eb3064a9e4a81d0b8cd414e3dcd7fe9b158f241", "https://bugzilla.redhat.com/show_bug.cgi?id=1343471", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=1eb3064a9e4a81d0b8cd414e3dcd7fe9b158f241", "https://bugzilla.redhat.com/show_bug.cgi?id=1343471"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9815"
imported = 2025-11-25T22:35:59.592Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.593Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9815"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9815"
```

# ImageMagick allows remote attackers to cause a denial of service (application crash) via a crafted w...

ImageMagick allows remote attackers to cause a denial of service (application crash) via a crafted wpg file.

