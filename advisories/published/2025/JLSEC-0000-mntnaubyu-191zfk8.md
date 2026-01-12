```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyu-191zfk8"
modified = 2025-11-25T22:35:59.382Z
upstream = ["CVE-2016-10058"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95212", "https://bugzilla.redhat.com/show_bug.cgi?id=1410467", "https://github.com/ImageMagick/ImageMagick/commit/47e8e6ceef979327614d0b8f0c76c6ecb18e09cf", "https://github.com/ImageMagick/ImageMagick/commit/4ec444f4eab88cf4bec664fafcf9cab50bc5ff6a", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95212", "https://bugzilla.redhat.com/show_bug.cgi?id=1410467", "https://github.com/ImageMagick/ImageMagick/commit/47e8e6ceef979327614d0b8f0c76c6ecb18e09cf", "https://github.com/ImageMagick/ImageMagick/commit/4ec444f4eab88cf4bec664fafcf9cab50bc5ff6a"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10058"
imported = 2025-11-25T22:35:59.382Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.767Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10058"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10058"
```

# Memory leak in the ReadPSDLayers function in coders/psd.c in ImageMagick before 6.9.6-3 allows remot...

Memory leak in the ReadPSDLayers function in coders/psd.c in ImageMagick before 6.9.6-3 allows remote attackers to cause a denial of service (memory consumption) via a crafted image file.

