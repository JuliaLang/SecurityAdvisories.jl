```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntp0ptfk-1bcss3d"
modified = 2025-11-27T03:28:04.928Z
upstream = ["CVE-2025-64505"]
references = ["https://github.com/pnggroup/libpng/commit/6a528eb5fd0dd7f6de1c39d30de0e41473431c37", "https://github.com/pnggroup/libpng/pull/748", "https://github.com/pnggroup/libpng/security/advisories/GHSA-4952-h5wq-4m42"]

[[affected]]
pkg = "libpng_jll"
ranges = ["< 1.6.51+0"]

[[jlsec_sources]]
id = "CVE-2025-64505"
imported = 2025-11-27T03:28:04.911Z
modified = 2025-11-26T18:28:32.220Z
published = 2025-11-25T00:15:47.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-64505"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-64505"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. Prior to version 1.6.51, a heap buffer over-read vulnerability exists in libpng's png_do_quantize function when processing PNG files with malformed palette indices. The vulnerability occurs when palette_lookup array bounds are not validated against externally-supplied image data, allowing an attacker to craft a PNG file with out-of-range palette indices that trigger out-of-bounds memory access. This issue has been patched in version 1.6.51.

