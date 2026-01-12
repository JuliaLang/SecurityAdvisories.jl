```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauccw-z32g9g"
modified = 2025-11-25T22:35:59.888Z
upstream = ["CVE-2017-11526"]
references = ["http://www.securityfocus.com/bid/99932", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867825", "https://github.com/ImageMagick/ImageMagick/issues/527", "http://www.securityfocus.com/bid/99932", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867825", "https://github.com/ImageMagick/ImageMagick/issues/527"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11526"
imported = 2025-11-25T22:35:59.888Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-23T03:29:00.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11526"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11526"
```

# The ReadOneMNGImage function in coders/png.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 al...

The ReadOneMNGImage function in coders/png.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allows remote attackers to cause a denial of service (large loop and CPU consumption) via a crafted file.

