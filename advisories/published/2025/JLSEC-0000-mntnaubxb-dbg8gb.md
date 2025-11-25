```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubxb-dbg8gb"
modified = 2025-11-25T22:35:59.327Z
upstream = ["CVE-2014-9845"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=a7a7fd3ce95b7b8efb0ce1ce40f43dbbd20d8e03", "https://bugzilla.redhat.com/show_bug.cgi?id=1343503", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=a7a7fd3ce95b7b8efb0ce1ce40f43dbbd20d8e03", "https://bugzilla.redhat.com/show_bug.cgi?id=1343503"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9845"
imported = 2025-11-25T22:35:59.327Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-20T16:59:00.877Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9845"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9845"
```

# The ReadDIBImage function in coders/dib.c in ImageMagick allows remote attackers to cause a denial o...

The ReadDIBImage function in coders/dib.c in ImageMagick allows remote attackers to cause a denial of service (crash) via a corrupted dib file.

