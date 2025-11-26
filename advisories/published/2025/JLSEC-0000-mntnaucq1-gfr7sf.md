```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucq1-gfr7sf"
modified = 2025-11-25T22:36:00.361Z
upstream = ["CVE-2017-12877"]
references = ["http://www.openwall.com/lists/oss-security/2017/08/16/2", "https://blogs.gentoo.org/ago/2017/08/10/imagemagick-use-after-free-in-destroyimage-image-c/", "https://github.com/ImageMagick/ImageMagick/commit/04178de2247e353fc095846784b9a10fefdbf890", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4040", "https://www.debian.org/security/2017/dsa-4074", "http://www.openwall.com/lists/oss-security/2017/08/16/2", "https://blogs.gentoo.org/ago/2017/08/10/imagemagick-use-after-free-in-destroyimage-image-c/", "https://github.com/ImageMagick/ImageMagick/commit/04178de2247e353fc095846784b9a10fefdbf890", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4040", "https://www.debian.org/security/2017/dsa-4074"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-12877"
imported = 2025-11-25T22:36:00.361Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-28T19:29:00.790Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-12877"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-12877"
```

# Use-after-free vulnerability in the DestroyImage function in image.c in ImageMagick before 7.0.6-6 a...

Use-after-free vulnerability in the DestroyImage function in image.c in ImageMagick before 7.0.6-6 allows remote attackers to cause a denial of service via a crafted file.

