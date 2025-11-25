```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudji-13ufxax"
modified = 2025-11-25T22:36:01.422Z
upstream = ["CVE-2025-57803"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/2c55221f4d38193adcb51056c14cf238fbcc35d7", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mxvv-97wh-cfmm", "https://github.com/dlemstra/Magick.NET/releases/tag/14.8.1", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mxvv-97wh-cfmm"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2004+0"]

[[jlsec_sources]]
id = "CVE-2025-57803"
imported = 2025-11-25T22:36:01.422Z
modified = 2025-11-03T19:16:12.657Z
published = 2025-08-26T18:15:47.780Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-57803"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-57803"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to versions 6.9.13-28 and 7.1.2-2 for ImageMagick's 32-bit build, a 32-bit integer overflow in the BMP encoder’s scanline-stride computation collapses bytes_per_line (stride) to a tiny value while the per-row writer still emits 3 × width bytes for 24-bpp images. The row base pointer advances using the (overflowed) stride, so the first row immediately writes past its slot and into adjacent heap memory with attacker-controlled bytes. This is a classic, powerful primitive for heap corruption in common auto-convert pipelines. This issue has been patched in versions 6.9.13-28 and 7.1.2-2.

