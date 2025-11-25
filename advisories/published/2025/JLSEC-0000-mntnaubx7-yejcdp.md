```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx7-yejcdp"
modified = 2025-11-25T22:35:59.323Z
upstream = ["CVE-2014-9854"]
references = ["http://git.imagemagick.org/repos/ImageMagick/commit/7fb9b7e095a65b4528d0180e26574f2bc7cd0e8b", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=5ee6f49297c8137cae527429e0267462c14ec3ed", "https://bugzilla.redhat.com/show_bug.cgi?id=1343514", "http://git.imagemagick.org/repos/ImageMagick/commit/7fb9b7e095a65b4528d0180e26574f2bc7cd0e8b", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=5ee6f49297c8137cae527429e0267462c14ec3ed", "https://bugzilla.redhat.com/show_bug.cgi?id=1343514"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9854"
imported = 2025-11-25T22:35:59.323Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-17T14:59:00.610Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9854"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9854"
```

# coders/tiff.c in ImageMagick allows remote attackers to cause a denial of service (application crash...

coders/tiff.c in ImageMagick allows remote attackers to cause a denial of service (application crash) via vectors related to the "identification of image."

