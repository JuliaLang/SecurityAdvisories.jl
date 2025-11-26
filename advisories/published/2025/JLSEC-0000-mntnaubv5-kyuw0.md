```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv5-kyuw0"
modified = 2025-11-25T22:35:59.249Z
upstream = ["CVE-2017-6498"]
references = ["http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96591", "https://bugs.debian.org/856878", "https://github.com/ImageMagick/ImageMagick/commit/65f75a32a93ae4044c528a987a68366ecd4b46b9", "https://github.com/ImageMagick/ImageMagick/pull/359", "http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96591", "https://bugs.debian.org/856878", "https://github.com/ImageMagick/ImageMagick/commit/65f75a32a93ae4044c528a987a68366ecd4b46b9", "https://github.com/ImageMagick/ImageMagick/pull/359"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6498"
imported = 2025-11-25T22:35:59.249Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.557Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6498"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6498"
```

# An issue was discovered in ImageMagick 6.9.7

An issue was discovered in ImageMagick 6.9.7. Incorrect TGA files could trigger assertion failures, thus leading to DoS.

