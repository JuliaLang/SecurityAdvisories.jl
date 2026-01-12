```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx9-qfpgjr"
modified = 2025-11-25T22:35:59.325Z
upstream = ["CVE-2014-9843"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=b8df15144d91a19ed545893ea492363635a1cb29", "https://bugzilla.redhat.com/show_bug.cgi?id=1343501", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=b8df15144d91a19ed545893ea492363635a1cb29", "https://bugzilla.redhat.com/show_bug.cgi?id=1343501"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9843"
imported = 2025-11-25T22:35:59.325Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-20T16:59:00.717Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9843"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9843"
```

# The DecodePSDPixels function in coders/psd.c in ImageMagick 6.8.9.9 allows remote attackers to have ...

The DecodePSDPixels function in coders/psd.c in ImageMagick 6.8.9.9 allows remote attackers to have unspecified impact via unknown vectors.

