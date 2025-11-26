```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv5-1jn0st6"
modified = 2025-11-25T22:35:59.250Z
upstream = ["CVE-2017-6499"]
references = ["http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96590", "https://bugs.debian.org/856880", "https://github.com/ImageMagick/ImageMagick/commit/3358f060fc182551822576b2c0a8850faab5d543", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=23&p=142634", "http://www.debian.org/security/2017/dsa-3808", "http://www.securityfocus.com/bid/96590", "https://bugs.debian.org/856880", "https://github.com/ImageMagick/ImageMagick/commit/3358f060fc182551822576b2c0a8850faab5d543", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=23&p=142634"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-6499"
imported = 2025-11-25T22:35:59.249Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-06T02:59:00.587Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-6499"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-6499"
```

# An issue was discovered in Magick++ in ImageMagick 6.9.7

An issue was discovered in Magick++ in ImageMagick 6.9.7. A specially crafted file creating a nested exception could lead to a memory leak (thus, a DoS).

