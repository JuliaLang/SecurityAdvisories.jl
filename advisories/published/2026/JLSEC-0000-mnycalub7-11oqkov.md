```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnycalub7-11oqkov"
modified = 2026-03-24T05:02:26.995Z
upstream = ["CVE-2026-25646"]
references = ["https://github.com/pnggroup/libpng/commit/01d03b8453eb30ade759cd45c707e5a1c7277d88", "https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3", "http://www.openwall.com/lists/oss-security/2026/02/09/7", "https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3"]

[[affected]]
pkg = "libpng_jll"
ranges = ["< 1.6.55+0"]

[[jlsec_sources]]
id = "CVE-2026-25646"
imported = 2026-03-24T05:02:26.995Z
modified = 2026-02-13T20:43:44.690Z
published = 2026-02-10T18:16:37.817Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-25646"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-25646"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. Prior to 1.6.55, an out-of-bounds read vulnerability exists in the png_set_quantize() API function. When the function is called with no histogram and the number of colors in the palette is more than twice the maximum supported by the user's display, certain palettes will cause the function to enter into an infinite loop that reads past the end of an internal heap-allocated buffer. The images that trigger this vulnerability are valid per the PNG specification. This vulnerability is fixed in 1.6.55.

