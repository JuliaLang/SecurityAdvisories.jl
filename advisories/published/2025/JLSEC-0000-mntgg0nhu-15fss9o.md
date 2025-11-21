```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntgg0nhu-15fss9o"
modified = 2025-11-21T03:26:29.106Z
upstream = ["CVE-2024-41817"]
references = ["https://github.com/ImageMagick/ImageMagick/blob/3b22378a23d59d7517c43b65b1822f023df357a0/app-image/AppRun#L11-L14", "https://github.com/ImageMagick/ImageMagick/commit/6526a2b28510ead6a3e14de711bb991ad9abff38", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8rxc-922v-phg8", "https://github.com/ImageMagick/ImageMagick/blob/3b22378a23d59d7517c43b65b1822f023df357a0/app-image/AppRun#L11-L14", "https://github.com/ImageMagick/ImageMagick/commit/6526a2b28510ead6a3e14de711bb991ad9abff38", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8rxc-922v-phg8"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 7.1.0+0, < 7.1.1047+0"]

[[jlsec_sources]]
id = "CVE-2024-41817"
imported = 2025-11-21T03:26:29.087Z
modified = 2025-11-20T19:21:58.747Z
published = 2024-07-29T16:15:05.360Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-41817"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-41817"
```

# ImageMagick is a free and open-source software suite, used for editing and manipulating digital imag...

ImageMagick is a free and open-source software suite, used for editing and manipulating digital images. The `AppImage` version `ImageMagick` might use an empty path when setting `MAGICK_CONFIGURE_PATH` and `LD_LIBRARY_PATH` environment variables while executing, which might lead to arbitrary code execution by loading malicious configuration files or shared libraries in the current working directory while executing `ImageMagick`. The vulnerability is fixed in 7.11-36.

