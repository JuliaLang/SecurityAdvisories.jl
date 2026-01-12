```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4i-19miawr"
modified = 2025-11-25T22:35:59.586Z
upstream = ["CVE-2014-9807"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=be644895456764f2c2670f297d9d9860ff0bdd75", "https://bugzilla.redhat.com/show_bug.cgi?id=1343463", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=be644895456764f2c2670f297d9d9860ff0bdd75", "https://bugzilla.redhat.com/show_bug.cgi?id=1343463"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9807"
imported = 2025-11-25T22:35:59.586Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.297Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9807"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9807"
```

# The pdb coder in ImageMagick allows remote attackers to cause a denial of service (double free) via ...

The pdb coder in ImageMagick allows remote attackers to cause a denial of service (double free) via unspecified vectors.

