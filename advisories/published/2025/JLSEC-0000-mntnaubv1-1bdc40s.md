```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv1-1bdc40s"
modified = 2025-11-25T22:35:59.245Z
upstream = ["CVE-2016-10061"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95207", "https://bugzilla.redhat.com/show_bug.cgi?id=1410471", "https://github.com/ImageMagick/ImageMagick/commit/4e914bbe371433f0590cefdf3bd5f3a5710069f9", "https://github.com/ImageMagick/ImageMagick/issues/196", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95207", "https://bugzilla.redhat.com/show_bug.cgi?id=1410471", "https://github.com/ImageMagick/ImageMagick/commit/4e914bbe371433f0590cefdf3bd5f3a5710069f9", "https://github.com/ImageMagick/ImageMagick/issues/196"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10061"
imported = 2025-11-25T22:35:59.245Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-03T17:59:00.190Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10061"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10061"
```

# The ReadGROUP4Image function in coders/tiff.c in ImageMagick before 7.0.1-10 does not check the retu...

The ReadGROUP4Image function in coders/tiff.c in ImageMagick before 7.0.1-10 does not check the return value of the fputc function, which allows remote attackers to cause a denial of service (crash) via a crafted image file.

