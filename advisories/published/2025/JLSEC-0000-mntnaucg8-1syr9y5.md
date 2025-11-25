```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucg8-1syr9y5"
modified = 2025-11-25T22:36:00.008Z
upstream = ["CVE-2017-11530"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867821", "https://github.com/ImageMagick/ImageMagick/issues/524", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867821", "https://github.com/ImageMagick/ImageMagick/issues/524"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11530"
imported = 2025-11-25T22:36:00.008Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-23T03:29:00.483Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11530"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11530"
```

# The ReadEPTImage function in coders/ept.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allow...

The ReadEPTImage function in coders/ept.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allows remote attackers to cause a denial of service (memory consumption) via a crafted file.

