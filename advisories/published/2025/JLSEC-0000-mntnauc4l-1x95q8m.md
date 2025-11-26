```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4l-1x95q8m"
modified = 2025-11-25T22:35:59.589Z
upstream = ["CVE-2014-9811"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=82a5bbdd47b9b3f43ce3c2aa18741aecc4a0f962", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=914da276f717b3e21e5af6614887af14af87a9b8", "https://bugzilla.redhat.com/show_bug.cgi?id=1343467", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=82a5bbdd47b9b3f43ce3c2aa18741aecc4a0f962", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=914da276f717b3e21e5af6614887af14af87a9b8", "https://bugzilla.redhat.com/show_bug.cgi?id=1343467"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9811"
imported = 2025-11-25T22:35:59.589Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.437Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9811"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9811"
```

# The xwd file handler in ImageMagick allows remote attackers to cause a denial of service (segmentati...

The xwd file handler in ImageMagick allows remote attackers to cause a denial of service (segmentation fault and application crash) via a malformed xwd file.

