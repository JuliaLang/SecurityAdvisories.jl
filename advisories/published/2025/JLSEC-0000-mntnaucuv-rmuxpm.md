```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucuv-rmuxpm"
modified = 2025-11-25T22:36:00.535Z
upstream = ["CVE-2019-13136"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/fe5f4b85e6b1b54d3b4588a77133c06ade46d891", "https://github.com/ImageMagick/ImageMagick/issues/1602", "https://support.f5.com/csp/article/K03512441?utm_source=f5support&amp%3Butm_medium=RSS", "http://lists.opensuse.org/opensuse-security-announce/2019-08/msg00069.html", "https://github.com/ImageMagick/ImageMagick/commit/fe5f4b85e6b1b54d3b4588a77133c06ade46d891", "https://github.com/ImageMagick/ImageMagick/issues/1602", "https://support.f5.com/csp/article/K03512441?utm_source=f5support&amp%3Butm_medium=RSS"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2019-13136"
imported = 2025-11-25T22:36:00.535Z
modified = 2024-11-21T04:24:16.360Z
published = 2019-07-01T20:15:11.417Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-13136"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-13136"
```

# ImageMagick before 7.0.8-50 has an integer overflow vulnerability in the function TIFFSeekCustomStre...

ImageMagick before 7.0.8-50 has an integer overflow vulnerability in the function TIFFSeekCustomStream in coders/tiff.c.

