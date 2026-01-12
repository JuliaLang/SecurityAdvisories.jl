```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx5-196f2fb"
modified = 2025-11-25T22:35:59.321Z
upstream = ["CVE-2014-9852"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=37ec7d53dcb99fbd1f5c33442594d5e279630563", "https://bugzilla.redhat.com/show_bug.cgi?id=1343512", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=37ec7d53dcb99fbd1f5c33442594d5e279630563", "https://bugzilla.redhat.com/show_bug.cgi?id=1343512"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9852"
imported = 2025-11-25T22:35:59.321Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-17T14:59:00.500Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9852"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9852"
```

# distribute-cache.c in ImageMagick re-uses objects after they have been destroyed, which allows remot...

distribute-cache.c in ImageMagick re-uses objects after they have been destroyed, which allows remote attackers to have unspecified impact via unspecified vectors.

