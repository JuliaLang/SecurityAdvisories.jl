```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvx1rtru-k7yjj6"
modified = 2026-01-22T03:39:12.378Z
upstream = ["CVE-2026-22801"]
references = ["https://github.com/pnggroup/libpng/security/advisories/GHSA-vgjq-8cw5-ggw8"]

[[affected]]
pkg = "libpng_jll"
ranges = ["< 1.6.54+0"]

[[jlsec_sources]]
id = "CVE-2026-22801"
imported = 2026-01-22T03:39:12.378Z
modified = 2026-01-21T18:58:18.270Z
published = 2026-01-12T23:15:52.907Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22801"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22801"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. From 1.6.26 to 1.6.53, there is an integer truncation in the libpng simplified write API functions png_write_image_16bit and png_write_image_8bit causes heap buffer over-read when the caller provides a negative row stride (for bottom-up image layouts) or a stride exceeding 65535 bytes. The bug was introduced in libpng 1.6.26 (October 2016) by casts added to silence compiler warnings on 16-bit systems. This vulnerability is fixed in 1.6.54.

