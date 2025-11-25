```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauciw-vvcnpl"
modified = 2025-11-25T22:36:00.104Z
upstream = ["CVE-2014-9831"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=b68b78e2625122d9f6b6d88ba4df7e85b47b556f", "https://bugzilla.redhat.com/show_bug.cgi?id=1343487", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=b68b78e2625122d9f6b6d88ba4df7e85b47b556f", "https://bugzilla.redhat.com/show_bug.cgi?id=1343487"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9831"
imported = 2025-11-25T22:36:00.104Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-07T20:29:00.403Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9831"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9831"
```

# coders/wpg.c in ImageMagick allows remote attackers to have unspecified impact via a corrupted wpg f...

coders/wpg.c in ImageMagick allows remote attackers to have unspecified impact via a corrupted wpg file.

