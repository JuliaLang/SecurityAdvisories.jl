```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucif-1p10ark"
modified = 2025-11-25T22:36:00.087Z
upstream = ["CVE-2017-12427"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/e793eb203e5e0f91f5037aed6585e81b1e27395b", "https://github.com/ImageMagick/ImageMagick/issues/636", "https://security.gentoo.org/glsa/201711-07", "https://github.com/ImageMagick/ImageMagick/commit/e793eb203e5e0f91f5037aed6585e81b1e27395b", "https://github.com/ImageMagick/ImageMagick/issues/636", "https://security.gentoo.org/glsa/201711-07"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-12427"
imported = 2025-11-25T22:36:00.087Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-04T09:29:00.283Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-12427"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-12427"
```

# The ProcessMSLScript function in coders/msl.c in ImageMagick before 6.9.9-5 and 7.x before 7.0.6-5 a...

The ProcessMSLScript function in coders/msl.c in ImageMagick before 6.9.9-5 and 7.x before 7.0.6-5 allows remote attackers to cause a denial of service (memory leak) via a crafted file, related to the WriteMSLImage function.

