```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc6s-hhl77h"
modified = 2025-11-25T22:35:59.668Z
upstream = ["CVE-2017-11447"]
references = ["http://www.securityfocus.com/bid/99948", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867897", "https://github.com/ImageMagick/ImageMagick/commit/72a50e400d98d7a2fd610caedfeb9af043dc5582", "https://github.com/ImageMagick/ImageMagick/issues/556", "http://www.securityfocus.com/bid/99948", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867897", "https://github.com/ImageMagick/ImageMagick/commit/72a50e400d98d7a2fd610caedfeb9af043dc5582", "https://github.com/ImageMagick/ImageMagick/issues/556"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2017-11447"
imported = 2025-11-25T22:35:59.668Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-19T07:29:00.470Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11447"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11447"
```

# The ReadSCREENSHOTImage function in coders/screenshot.c in ImageMagick before 7.0.6-1 has memory lea...

The ReadSCREENSHOTImage function in coders/screenshot.c in ImageMagick before 7.0.6-1 has memory leaks, causing denial of service.

