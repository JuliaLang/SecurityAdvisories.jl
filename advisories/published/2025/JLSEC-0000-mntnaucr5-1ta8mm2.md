```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucr5-1ta8mm2"
modified = 2025-11-25T22:36:00.401Z
upstream = ["CVE-2017-17499"]
references = ["http://www.securityfocus.com/bid/102155", "https://github.com/ImageMagick/ImageMagick/commit/8c35502217c1879cb8257c617007282eee3fe1cc", "https://github.com/ImageMagick/ImageMagick/commit/dd96d671e4d5ae22c6894c302e8996c13f24c45a", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4074", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=33078&sid=5fbb164c3830293138917f9b14264ed1", "http://www.securityfocus.com/bid/102155", "https://github.com/ImageMagick/ImageMagick/commit/8c35502217c1879cb8257c617007282eee3fe1cc", "https://github.com/ImageMagick/ImageMagick/commit/dd96d671e4d5ae22c6894c302e8996c13f24c45a", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4074", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=33078&sid=5fbb164c3830293138917f9b14264ed1"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-17499"
imported = 2025-11-25T22:36:00.401Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-12-11T02:29:00.650Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-17499"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-17499"
```

# ImageMagick before 6.9.9-24 and 7.x before 7.0.7-12 has a use-after-free in Magick::Image::read in M...

ImageMagick before 6.9.9-24 and 7.x before 7.0.7-12 has a use-after-free in Magick::Image::read in Magick++/lib/Image.cpp.

