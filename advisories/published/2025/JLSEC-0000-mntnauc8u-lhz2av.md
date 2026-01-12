```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc8u-lhz2av"
modified = 2025-11-25T22:35:59.742Z
upstream = ["CVE-2017-11505"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867824", "https://github.com/ImageMagick/ImageMagick/issues/526", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867824", "https://github.com/ImageMagick/ImageMagick/issues/526"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11505"
imported = 2025-11-25T22:35:59.742Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-21T16:29:00.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11505"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11505"
```

# The ReadOneJNGImage function in coders/png.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 ...

The ReadOneJNGImage function in coders/png.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 allows remote attackers to cause a denial of service (large loop and CPU consumption) via a malformed JNG file.

