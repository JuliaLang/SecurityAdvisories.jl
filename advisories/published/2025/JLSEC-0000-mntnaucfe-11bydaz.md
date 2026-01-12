```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucfe-11bydaz"
modified = 2025-11-25T22:35:59.978Z
upstream = ["CVE-2017-11529"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867823", "https://github.com/ImageMagick/ImageMagick/issues/525", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867823", "https://github.com/ImageMagick/ImageMagick/issues/525"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11529"
imported = 2025-11-25T22:35:59.978Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-23T03:29:00.453Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11529"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11529"
```

# The ReadMATImage function in coders/mat.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allow...

The ReadMATImage function in coders/mat.c in ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1 allows remote attackers to cause a denial of service (memory leak) via a crafted file.

