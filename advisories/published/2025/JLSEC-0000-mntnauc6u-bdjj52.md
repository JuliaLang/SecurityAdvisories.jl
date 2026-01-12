```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc6u-bdjj52"
modified = 2025-11-25T22:35:59.670Z
upstream = ["CVE-2017-11448"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867893", "https://github.com/ImageMagick/ImageMagick/commit/f6463ca9588579633bbaed9460899d892aa3c64a", "https://github.com/ImageMagick/ImageMagick/issues/556", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867893", "https://github.com/ImageMagick/ImageMagick/commit/f6463ca9588579633bbaed9460899d892aa3c64a", "https://github.com/ImageMagick/ImageMagick/issues/556"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11448"
imported = 2025-11-25T22:35:59.670Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-19T07:29:00.517Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11448"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11448"
```

# The ReadJPEGImage function in coders/jpeg.c in ImageMagick before 7.0.6-1 allows remote attackers to...

The ReadJPEGImage function in coders/jpeg.c in ImageMagick before 7.0.6-1 allows remote attackers to obtain sensitive information from uninitialized memory locations via a crafted file.

