```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyv-1u1cwq5"
modified = 2025-11-25T22:35:59.383Z
upstream = ["CVE-2016-10059"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95206", "https://bugzilla.redhat.com/show_bug.cgi?id=1410469", "https://github.com/ImageMagick/ImageMagick/commit/58cf5bf4fade82e3b510e8f3463a967278a3e410", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95206", "https://bugzilla.redhat.com/show_bug.cgi?id=1410469", "https://github.com/ImageMagick/ImageMagick/commit/58cf5bf4fade82e3b510e8f3463a967278a3e410"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10059"
imported = 2025-11-25T22:35:59.383Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.797Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10059"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10059"
```

# Buffer overflow in coders/tiff.c in ImageMagick before 6.9.4-1 allows remote attackers to cause a de...

Buffer overflow in coders/tiff.c in ImageMagick before 6.9.4-1 allows remote attackers to cause a denial of service (application crash) or have unspecified other impact via a crafted TIFF file.

