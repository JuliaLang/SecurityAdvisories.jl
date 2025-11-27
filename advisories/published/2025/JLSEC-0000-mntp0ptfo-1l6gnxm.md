```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntp0ptfo-1l6gnxm"
modified = 2025-11-27T03:28:04.932Z
upstream = ["CVE-2025-65018"]
references = ["https://github.com/pnggroup/libpng/commit/16b5e3823918840aae65c0a6da57c78a5a496a4d", "https://github.com/pnggroup/libpng/commit/218612ddd6b17944e21eda56caf8b4bf7779d1ea", "https://github.com/pnggroup/libpng/issues/755", "https://github.com/pnggroup/libpng/pull/757", "https://github.com/pnggroup/libpng/security/advisories/GHSA-7wv6-48j4-hj3g", "https://github.com/pnggroup/libpng/issues/755", "https://github.com/pnggroup/libpng/security/advisories/GHSA-7wv6-48j4-hj3g"]

[[affected]]
pkg = "libpng_jll"
ranges = ["< 1.6.51+0"]

[[jlsec_sources]]
id = "CVE-2025-65018"
imported = 2025-11-27T03:28:04.932Z
modified = 2025-11-26T18:34:53.650Z
published = 2025-11-25T00:15:47.610Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-65018"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-65018"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. From version 1.6.0 to before 1.6.51, there is a heap buffer overflow vulnerability in the libpng simplified API function png_image_finish_read when processing 16-bit interlaced PNGs with 8-bit output format. Attacker-crafted interlaced PNG files cause heap writes beyond allocated buffer bounds. This issue has been patched in version 1.6.51.

