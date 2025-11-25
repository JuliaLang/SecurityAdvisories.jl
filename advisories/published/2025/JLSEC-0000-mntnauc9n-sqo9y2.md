```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc9n-sqo9y2"
modified = 2025-11-25T22:35:59.771Z
upstream = ["CVE-2017-11522"]
references = ["https://bugs.debian.org/869209", "https://github.com/ImageMagick/ImageMagick/commit/816ecab6c532ae086ff4186b3eaf4aa7092d536f", "https://github.com/ImageMagick/ImageMagick/issues/586", "https://bugs.debian.org/869209", "https://github.com/ImageMagick/ImageMagick/commit/816ecab6c532ae086ff4186b3eaf4aa7092d536f", "https://github.com/ImageMagick/ImageMagick/issues/586"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11522"
imported = 2025-11-25T22:35:59.771Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-22T21:29:00.180Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11522"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11522"
```

# The WriteOnePNGImage function in coders/png.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1...

The WriteOnePNGImage function in coders/png.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 allows remote attackers to cause a denial of service (NULL pointer dereference) via a crafted file.

