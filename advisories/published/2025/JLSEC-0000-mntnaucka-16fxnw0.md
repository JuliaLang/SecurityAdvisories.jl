```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucka-16fxnw0"
modified = 2025-11-25T22:36:00.154Z
upstream = ["CVE-2017-13139"]
references = ["http://www.securityfocus.com/bid/100494", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870109", "https://github.com/ImageMagick/ImageMagick/commit/d072ed6aff835c174e856ce3a428163c0da9e8f4", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2017/dsa-4040", "http://www.securityfocus.com/bid/100494", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870109", "https://github.com/ImageMagick/ImageMagick/commit/d072ed6aff835c174e856ce3a428163c0da9e8f4", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2017/dsa-4040"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13139"
imported = 2025-11-25T22:36:00.154Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.183Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13139"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13139"
```

# In ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1, the ReadOneMNGImage function in coders/png.c h...

In ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1, the ReadOneMNGImage function in coders/png.c has an out-of-bounds read with the MNG CLIP chunk.

