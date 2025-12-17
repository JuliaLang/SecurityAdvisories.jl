```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnuhlqtuw-ihb1aw"
modified = 2025-12-17T03:34:17.000Z
upstream = ["CVE-2025-66293"]
references = ["https://github.com/pnggroup/libpng/commit/788a624d7387a758ffd5c7ab010f1870dea753a1", "https://github.com/pnggroup/libpng/commit/a05a48b756de63e3234ea6b3b938b8f5f862484a", "https://github.com/pnggroup/libpng/issues/764", "https://github.com/pnggroup/libpng/security/advisories/GHSA-9mpm-9pxh-mg4f", "http://www.openwall.com/lists/oss-security/2025/12/03/6", "http://www.openwall.com/lists/oss-security/2025/12/03/7", "http://www.openwall.com/lists/oss-security/2025/12/03/8", "https://github.com/pnggroup/libpng/issues/764"]

[[affected]]
pkg = "libpng_jll"
ranges = ["< 1.6.53+0"]

[[jlsec_sources]]
id = "CVE-2025-66293"
imported = 2025-12-17T03:34:17.000Z
modified = 2025-12-16T19:12:50.350Z
published = 2025-12-03T21:15:53.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-66293"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-66293"
```

# LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portabl...

LIBPNG is a reference library for use in applications that read, create, and manipulate PNG (Portable Network Graphics) raster image files. Prior to 1.6.52, an out-of-bounds read vulnerability in libpng's simplified API allows reading up to 1012 bytes beyond the png_sRGB_base[512] array when processing valid palette PNG images with partial transparency and gamma correction. The PNG files that trigger this vulnerability are valid per the PNG specification; the bug is in libpng's internal state management. Upgrade to libpng 1.6.52 or later.

