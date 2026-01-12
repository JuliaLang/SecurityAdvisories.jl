```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc68-3dzdgv"
modified = 2025-11-25T22:35:59.648Z
upstream = ["CVE-2017-9098"]
references = ["http://hg.code.sf.net/p/graphicsmagick/code/diff/0a5b75e019b6/coders/rle.c", "http://www.debian.org/security/2017/dsa-3863", "http://www.securityfocus.com/bid/98593", "https://github.com/ImageMagick/ImageMagick/commit/1c358ffe0049f768dd49a8a889c1cbf99ac9849b", "https://lists.debian.org/debian-lts-announce/2018/08/msg00002.html", "https://scarybeastsecurity.blogspot.com/2017/05/bleed-continues-18-byte-file-14k-bounty.html", "http://hg.code.sf.net/p/graphicsmagick/code/diff/0a5b75e019b6/coders/rle.c", "http://www.debian.org/security/2017/dsa-3863", "http://www.securityfocus.com/bid/98593", "https://github.com/ImageMagick/ImageMagick/commit/1c358ffe0049f768dd49a8a889c1cbf99ac9849b", "https://lists.debian.org/debian-lts-announce/2018/08/msg00002.html", "https://scarybeastsecurity.blogspot.com/2017/05/bleed-continues-18-byte-file-14k-bounty.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-9098"
imported = 2025-11-25T22:35:59.648Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-05-19T19:29:00.307Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-9098"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-9098"
```

# ImageMagick before 7.0.5-2 and GraphicsMagick before 1.3.24 use uninitialized memory in the RLE deco...

ImageMagick before 7.0.5-2 and GraphicsMagick before 1.3.24 use uninitialized memory in the RLE decoder, allowing an attacker to leak sensitive information from process memory space, as demonstrated by remote attacks against ImageMagick code in a long-running server process that converts image data on behalf of multiple users. This is caused by a missing initialization step in the ReadRLEImage function in coders/rle.c.

