```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauciv-1dsaq70"
modified = 2025-11-25T22:36:00.103Z
upstream = ["CVE-2014-9828"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=460547be494cc8c039b99b65e64a1fa2eb08ab5c", "https://bugzilla.redhat.com/show_bug.cgi?id=1343484", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=460547be494cc8c039b99b65e64a1fa2eb08ab5c", "https://bugzilla.redhat.com/show_bug.cgi?id=1343484"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9828"
imported = 2025-11-25T22:36:00.103Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-07T20:29:00.323Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9828"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9828"
```

# coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted psd fil...

coders/psd.c in ImageMagick allows remote attackers to have unspecified impact via a crafted psd file.

