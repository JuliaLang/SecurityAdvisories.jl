```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4y-1m8en5o"
modified = 2025-11-25T22:35:59.602Z
upstream = ["CVE-2014-9829"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=8e72cbfca8db81132319af14d1f33a3e833666d7", "https://bugzilla.redhat.com/show_bug.cgi?id=1343485", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=8e72cbfca8db81132319af14d1f33a3e833666d7", "https://bugzilla.redhat.com/show_bug.cgi?id=1343485"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9829"
imported = 2025-11-25T22:35:59.602Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-05T17:59:00.150Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9829"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9829"
```

# coders/sun.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds acce...

coders/sun.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds access) via a crafted sun file.

