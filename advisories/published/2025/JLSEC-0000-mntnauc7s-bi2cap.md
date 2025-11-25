```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc7s-bi2cap"
modified = 2025-11-25T22:35:59.704Z
upstream = ["CVE-2017-11478"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867826", "https://github.com/ImageMagick/ImageMagick/issues/528", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867826", "https://github.com/ImageMagick/ImageMagick/issues/528"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11478"
imported = 2025-11-25T22:35:59.704Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-20T16:29:00.177Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11478"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11478"
```

# The ReadOneDJVUImage function in coders/djvu.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-...

The ReadOneDJVUImage function in coders/djvu.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 allows remote attackers to cause a denial of service (infinite loop and CPU consumption) via a malformed DJVU image.

