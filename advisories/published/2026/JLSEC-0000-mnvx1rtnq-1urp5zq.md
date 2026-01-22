```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvx1rtnq-1urp5zq"
modified = 2026-01-22T03:39:12.230Z
upstream = ["CVE-2026-22695"]
references = ["https://github.com/pnggroup/libpng/commit/218612ddd6b17944e21eda56caf8b4bf7779d1ea", "https://github.com/pnggroup/libpng/commit/e4f7ad4ea2", "https://github.com/pnggroup/libpng/issues/778", "https://github.com/pnggroup/libpng/security/advisories/GHSA-mmq5-27w3-rxpp"]

[[affected]]
pkg = "libpng_jll"
ranges = [">= 1.6.51+0, < 1.6.54+0"]

[[jlsec_sources]]
id = "CVE-2026-22695"
imported = 2026-01-22T03:39:12.230Z
modified = 2026-01-21T18:58:55.787Z
published = 2026-01-12T23:15:52.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22695"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22695"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. From 1.6.51 to 1.6.53, there is a heap buffer over-read in the libpng simplified API function png_image_finish_read when processing interlaced 16-bit PNGs with 8-bit output format and non-minimal row stride. This is a regression introduced by the fix for CVE-2025-65018. This vulnerability is fixed in 1.6.54.

