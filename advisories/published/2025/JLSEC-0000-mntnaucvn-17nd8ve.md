```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvn-17nd8ve"
modified = 2025-11-25T22:36:00.563Z
upstream = ["CVE-2019-17547"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16537", "https://github.com/ImageMagick/ImageMagick/commit/ecf7c6b288e11e7e7f75387c5e9e93e423b98397", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-51...7.0.8-62", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16537", "https://github.com/ImageMagick/ImageMagick/commit/ecf7c6b288e11e7e7f75387c5e9e93e423b98397", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-51...7.0.8-62"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2019-17547"
imported = 2025-11-25T22:36:00.563Z
modified = 2024-11-21T04:32:30.127Z
published = 2019-10-14T02:15:11.170Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17547"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17547"
```

# In ImageMagick before 7.0.8-62, TraceBezier in MagickCore/draw.c has a use-after-free.

In ImageMagick before 7.0.8-62, TraceBezier in MagickCore/draw.c has a use-after-free.

