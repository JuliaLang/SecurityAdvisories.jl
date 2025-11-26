```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucuh-1501x12"
modified = 2025-11-25T22:36:00.521Z
upstream = ["CVE-2019-10714"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/07eebcd72f45c8fd7563d3f9ec5d2bed48f65f36", "https://github.com/ImageMagick/ImageMagick/commit/58d9c46929ca0828edde34d263700c3a5fe8dc3c", "https://github.com/ImageMagick/ImageMagick/commit/edc7d3035883ddca8413e4fe7689aa2e579ef04a", "https://github.com/ImageMagick/ImageMagick/issues/1495", "https://github.com/ImageMagick/ImageMagick/commit/07eebcd72f45c8fd7563d3f9ec5d2bed48f65f36", "https://github.com/ImageMagick/ImageMagick/commit/58d9c46929ca0828edde34d263700c3a5fe8dc3c", "https://github.com/ImageMagick/ImageMagick/commit/edc7d3035883ddca8413e4fe7689aa2e579ef04a", "https://github.com/ImageMagick/ImageMagick/issues/1495"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-10714"
imported = 2025-11-25T22:36:00.521Z
modified = 2024-11-21T04:19:47.490Z
published = 2019-04-02T21:29:00.250Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-10714"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-10714"
```

# LocaleLowercase in MagickCore/locale.c in ImageMagick before 7.0.8-32 allows out-of-bounds access, l...

LocaleLowercase in MagickCore/locale.c in ImageMagick before 7.0.8-32 allows out-of-bounds access, leading to a SIGSEGV.

