```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc53-13e97uh"
modified = 2025-11-25T22:35:59.607Z
upstream = ["CVE-2014-9837"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26682", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=7a7119c6fe19324ee17b8f756dae60c16e470ab2", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26682", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=7a7119c6fe19324ee17b8f756dae60c16e470ab2"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9837"
imported = 2025-11-25T22:35:59.607Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T19:59:00.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9837"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9837"
```

# coders/pnm.c in ImageMagick 6.9.0-1 Beta and earlier allows remote attackers to cause a denial of se...

coders/pnm.c in ImageMagick 6.9.0-1 Beta and earlier allows remote attackers to cause a denial of service (crash) via a crafted png file.

