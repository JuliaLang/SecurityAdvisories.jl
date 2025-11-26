```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuz-r9iwku"
modified = 2025-11-25T22:35:59.243Z
upstream = ["CVE-2016-10069"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95216", "https://bugzilla.redhat.com/show_bug.cgi?id=1410507", "https://github.com/ImageMagick/ImageMagick/commit/8a370f9ab120faf182aa160900ba692ba8e2bcf0", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95216", "https://bugzilla.redhat.com/show_bug.cgi?id=1410507", "https://github.com/ImageMagick/ImageMagick/commit/8a370f9ab120faf182aa160900ba692ba8e2bcf0"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10069"
imported = 2025-11-25T22:35:59.243Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-02T21:59:00.553Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10069"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10069"
```

# coders/mat.c in ImageMagick before 6.9.4-5 allows remote attackers to cause a denial of service (app...

coders/mat.c in ImageMagick before 6.9.4-5 allows remote attackers to cause a denial of service (application crash) via a mat file with an invalid number of frames.

