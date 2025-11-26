```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4n-9lbacg"
modified = 2025-11-25T22:35:59.591Z
upstream = ["CVE-2014-9813"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=35aa01dd5511a2616a6427f7d5d49de0132aeb5f", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=ae8e15370f269a529623b762c1355ab1dbab712e", "https://bugzilla.redhat.com/show_bug.cgi?id=1343469", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=35aa01dd5511a2616a6427f7d5d49de0132aeb5f", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=ae8e15370f269a529623b762c1355ab1dbab712e", "https://bugzilla.redhat.com/show_bug.cgi?id=1343469"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9813"
imported = 2025-11-25T22:35:59.591Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.517Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9813"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9813"
```

# ImageMagick allows remote attackers to cause a denial of service (application crash) via a crafted v...

ImageMagick allows remote attackers to cause a denial of service (application crash) via a crafted viff file.

