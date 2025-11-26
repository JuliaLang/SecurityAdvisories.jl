```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubxc-1tb5iqo"
modified = 2025-11-25T22:35:59.328Z
upstream = ["CVE-2014-9846"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=2d90693af41a363a988a9db3a91a15f9ca7c7370", "https://bugzilla.redhat.com/show_bug.cgi?id=1343504", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=2d90693af41a363a988a9db3a91a15f9ca7c7370", "https://bugzilla.redhat.com/show_bug.cgi?id=1343504"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9846"
imported = 2025-11-25T22:35:59.328Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-20T16:59:00.953Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9846"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9846"
```

# Buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick 6.8.9.9 allows remote at...

Buffer overflow in the ReadRLEImage function in coders/rle.c in ImageMagick 6.8.9.9 allows remote attackers to have unspecified impact.

