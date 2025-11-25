```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx6-1xtdavt"
modified = 2025-11-25T22:35:59.322Z
upstream = ["CVE-2014-9853"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://bugzilla.redhat.com/show_bug.cgi?id=1343513", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00000.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00002.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00009.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00010.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00011.html", "http://lists.opensuse.org/opensuse-security-announce/2016-07/msg00018.html", "http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00037.html", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.ubuntu.com/usn/USN-3131-1", "https://bugzilla.redhat.com/show_bug.cgi?id=1343513"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9853"
imported = 2025-11-25T22:35:59.322Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-17T14:59:00.547Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9853"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9853"
```

# Memory leak in coders/rle.c in ImageMagick allows remote attackers to cause a denial of service (mem...

Memory leak in coders/rle.c in ImageMagick allows remote attackers to cause a denial of service (memory consumption) via a crafted rle file.

