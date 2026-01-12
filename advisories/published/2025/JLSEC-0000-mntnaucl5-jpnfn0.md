```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucl5-jpnfn0"
modified = 2025-11-25T22:36:00.185Z
upstream = ["CVE-2017-13140"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870111", "https://github.com/ImageMagick/ImageMagick/issues/596", "https://security.gentoo.org/glsa/201711-07", "https://www.debian.org/security/2017/dsa-4019", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870111", "https://github.com/ImageMagick/ImageMagick/issues/596", "https://security.gentoo.org/glsa/201711-07", "https://www.debian.org/security/2017/dsa-4019"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13140"
imported = 2025-11-25T22:36:00.185Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.230Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13140"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13140"
```

# In ImageMagick before 6.9.9-1 and 7.x before 7.0.6-2, the ReadOnePNGImage function in coders/png.c a...

In ImageMagick before 6.9.9-1 and 7.x before 7.0.6-2, the ReadOnePNGImage function in coders/png.c allows remote attackers to cause a denial of service (application hang in LockSemaphoreInfo) via a PNG file with a width equal to MAGICK_WIDTH_LIMIT.

