```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv2-1rd61et"
modified = 2025-11-25T22:35:59.246Z
upstream = ["CVE-2016-10065"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95213", "https://bugzilla.redhat.com/show_bug.cgi?id=1410482", "https://github.com/ImageMagick/ImageMagick/commit/134463b926fa965571aa4febd61b810be5e7da05", "https://github.com/ImageMagick/ImageMagick/issues/129", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95213", "https://bugzilla.redhat.com/show_bug.cgi?id=1410482", "https://github.com/ImageMagick/ImageMagick/commit/134463b926fa965571aa4febd61b810be5e7da05", "https://github.com/ImageMagick/ImageMagick/issues/129"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10065"
imported = 2025-11-25T22:35:59.246Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-03T17:59:00.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10065"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10065"
```

# The ReadVIFFImage function in coders/viff.c in ImageMagick before 7.0.1-0 allows remote attackers to...

The ReadVIFFImage function in coders/viff.c in ImageMagick before 7.0.1-0 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file.

