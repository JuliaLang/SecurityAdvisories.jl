```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvl-12yfp84"
modified = 2025-11-25T22:36:00.561Z
upstream = ["CVE-2019-17540"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15826", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=942578", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-53...7.0.8-54", "https://github.com/ImageMagick/ImageMagick/compare/master%40%7B2019-07-15%7D...master%40%7B2019-07-17%7D", "https://security-tracker.debian.org/tracker/CVE-2019-17540", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15826", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=942578", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-53...7.0.8-54", "https://github.com/ImageMagick/ImageMagick/compare/master%40%7B2019-07-15%7D...master%40%7B2019-07-17%7D", "https://security-tracker.debian.org/tracker/CVE-2019-17540"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 6.9.12+0, < 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-17540"
imported = 2025-11-25T22:36:00.561Z
modified = 2024-11-21T04:32:29.023Z
published = 2019-10-14T02:15:10.607Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17540"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17540"
```

# ImageMagick before 7.0.8-54 has a heap-based buffer overflow in ReadPSInfo in coders/ps.c.

ImageMagick before 7.0.8-54 has a heap-based buffer overflow in ReadPSInfo in coders/ps.c.

