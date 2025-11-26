```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudja-1oq2d5a"
modified = 2025-11-25T22:36:01.414Z
upstream = ["CVE-2025-53101"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-53101"
imported = 2025-11-25T22:36:01.414Z
modified = 2025-11-03T19:16:08.327Z
published = 2025-07-14T20:15:29.180Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53101"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53101"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. In versions prior to 7.1.2-0 and 6.9.13-26, in ImageMagick's `magick mogrify` command, specifying multiple consecutive `%d` format specifiers in a filename template causes internal pointer arithmetic to generate an address below the beginning of the stack buffer, resulting in a stack overflow through `vsnprintf()`. Versions 7.1.2-0 and 6.9.13-26 fix the issue.

