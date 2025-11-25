```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4p-12csq5y"
modified = 2025-11-25T22:35:59.593Z
upstream = ["CVE-2014-9816"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=35aa01dd5511a2616a6427f7d5d49de0132aeb5f", "https://bugzilla.redhat.com/show_bug.cgi?id=1343472", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=35aa01dd5511a2616a6427f7d5d49de0132aeb5f", "https://bugzilla.redhat.com/show_bug.cgi?id=1343472"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9816"
imported = 2025-11-25T22:35:59.593Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.640Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9816"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9816"
```

# ImageMagick allows remote attackers to cause a denial of service (out-of-bounds access) via a crafte...

ImageMagick allows remote attackers to cause a denial of service (out-of-bounds access) via a crafted viff file.

