```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyr-1jzbto6"
modified = 2025-11-25T22:35:59.379Z
upstream = ["CVE-2016-10053"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95179", "https://bugzilla.redhat.com/show_bug.cgi?id=1410461", "https://github.com/ImageMagick/ImageMagick/commit/728dc6a600cf4cbdac846964c85cc04339db8ac1", "https://github.com/ImageMagick/ImageMagick/commit/f983dcdf9c178e0cbc49608a78713c5669aa1bb5", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95179", "https://bugzilla.redhat.com/show_bug.cgi?id=1410461", "https://github.com/ImageMagick/ImageMagick/commit/728dc6a600cf4cbdac846964c85cc04339db8ac1", "https://github.com/ImageMagick/ImageMagick/commit/f983dcdf9c178e0cbc49608a78713c5669aa1bb5"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10053"
imported = 2025-11-25T22:35:59.379Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.563Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10053"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10053"
```

# The WriteTIFFImage function in coders/tiff.c in ImageMagick before 6.9.5-8 allows remote attackers t...

The WriteTIFFImage function in coders/tiff.c in ImageMagick before 6.9.5-8 allows remote attackers to cause a denial of service (divide-by-zero error and application crash) via a crafted file.

