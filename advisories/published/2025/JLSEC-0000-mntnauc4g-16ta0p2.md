```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4g-16ta0p2"
modified = 2025-11-25T22:35:59.584Z
upstream = ["CVE-2014-9804"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=c504b8e1a1ca6f158f2d08bd33c62ce4865497ee", "https://bugzilla.redhat.com/show_bug.cgi?id=1343459", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=c504b8e1a1ca6f158f2d08bd33c62ce4865497ee", "https://bugzilla.redhat.com/show_bug.cgi?id=1343459"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9804"
imported = 2025-11-25T22:35:59.584Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.170Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9804"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9804"
```

# vision.c in ImageMagick allows remote attackers to cause a denial of service (infinite loop) via vec...

vision.c in ImageMagick allows remote attackers to cause a denial of service (infinite loop) via vectors related to "too many object."

