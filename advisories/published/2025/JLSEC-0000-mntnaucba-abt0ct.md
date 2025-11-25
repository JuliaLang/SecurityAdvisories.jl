```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucba-abt0ct"
modified = 2025-11-25T22:35:59.830Z
upstream = ["CVE-2017-11524"]
references = ["http://www.securityfocus.com/bid/99934", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867798", "https://github.com/ImageMagick/ImageMagick/issues/506", "http://www.securityfocus.com/bid/99934", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=867798", "https://github.com/ImageMagick/ImageMagick/issues/506"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11524"
imported = 2025-11-25T22:35:59.830Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-23T03:29:00.267Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11524"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11524"
```

# The WriteBlob function in MagickCore/blob.c in ImageMagick before 6.9.8-10 and 7.x before 7.6.0-0 al...

The WriteBlob function in MagickCore/blob.c in ImageMagick before 6.9.8-10 and 7.x before 7.6.0-0 allows remote attackers to cause a denial of service (assertion failure and application exit) via a crafted file.

