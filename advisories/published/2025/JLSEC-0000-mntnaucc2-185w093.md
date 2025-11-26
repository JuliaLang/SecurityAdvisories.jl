```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucc2-185w093"
modified = 2025-11-25T22:35:59.858Z
upstream = ["CVE-2017-11525"]
references = ["http://www.securityfocus.com/bid/99931", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867810", "https://github.com/ImageMagick/ImageMagick/issues/519", "http://www.securityfocus.com/bid/99931", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867810", "https://github.com/ImageMagick/ImageMagick/issues/519"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11525"
imported = 2025-11-25T22:35:59.858Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-23T03:29:00.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11525"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11525"
```

# The ReadCINImage function in coders/cin.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allow...

The ReadCINImage function in coders/cin.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allows remote attackers to cause a denial of service (memory consumption) via a crafted file.

