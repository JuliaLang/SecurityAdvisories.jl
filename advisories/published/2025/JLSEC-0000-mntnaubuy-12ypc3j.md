```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuy-12ypc3j"
modified = 2025-11-25T22:35:59.242Z
upstream = ["CVE-2016-10068"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95219", "https://bugzilla.redhat.com/show_bug.cgi?id=1410500", "https://github.com/ImageMagick/ImageMagick/commit/56d6e20de489113617cbbddaf41e92600a34db22", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30797", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95219", "https://bugzilla.redhat.com/show_bug.cgi?id=1410500", "https://github.com/ImageMagick/ImageMagick/commit/56d6e20de489113617cbbddaf41e92600a34db22", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30797"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10068"
imported = 2025-11-25T22:35:59.242Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.490Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10068"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10068"
```

# The MSL interpreter in ImageMagick before 6.9.6-4 allows remote attackers to cause a denial of servi...

The MSL interpreter in ImageMagick before 6.9.6-4 allows remote attackers to cause a denial of service (segmentation fault and application crash) via a crafted XML file.

