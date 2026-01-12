```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvm-fznskv"
modified = 2025-11-25T22:36:00.562Z
upstream = ["CVE-2019-17541"]
references = ["https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15827", "https://github.com/ImageMagick/ImageMagick/commit/39f226a9c137f547e12afde972eeba7551124493", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-54...7.0.8-55", "https://github.com/ImageMagick/ImageMagick/issues/1641", "https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=15827", "https://github.com/ImageMagick/ImageMagick/commit/39f226a9c137f547e12afde972eeba7551124493", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-54...7.0.8-55", "https://github.com/ImageMagick/ImageMagick/issues/1641"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-17541"
imported = 2025-11-25T22:36:00.562Z
modified = 2024-11-21T04:32:29.170Z
published = 2019-10-14T02:15:10.703Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-17541"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-17541"
```

# ImageMagick before 7.0.8-55 has a use-after-free in DestroyStringInfo in MagickCore/string.c because...

ImageMagick before 7.0.8-55 has a use-after-free in DestroyStringInfo in MagickCore/string.c because the error manager is mishandled in coders/jpeg.c.

