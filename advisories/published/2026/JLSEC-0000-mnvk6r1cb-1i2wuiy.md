```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvk6r1cb-1i2wuiy"
modified = 2026-01-13T03:37:33.323Z
upstream = ["CVE-2025-65955"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/6409f34d637a34a1c643632aa849371ec8b3b5a8", "https://github.com/ImageMagick/ImageMagick/commit/6f81eb15f822ad86e8255be75efad6f9762c32f8", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-q3hc-j9x5-mp9m"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2011+0"]

[[jlsec_sources]]
id = "CVE-2025-65955"
imported = 2026-01-13T03:37:33.323Z
modified = 2026-01-13T02:50:51.920Z
published = 2025-12-02T23:15:45.603Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-65955"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-65955"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to 7.1.2-9 and 6.9.13-34, there is a vulnerability in ImageMagick’s Magick++ layer that manifests when Options::fontFamily is invoked with an empty string. Clearing a font family calls RelinquishMagickMemory on _drawInfo->font, freeing the font string but leaving _drawInfo->font pointing to freed memory while _drawInfo->family is set to that (now-invalid) pointer. Any later cleanup or reuse of _drawInfo->font re-frees or dereferences dangling memory. DestroyDrawInfo and other setters (Options::font, Image::font) assume _drawInfo->font remains valid, so destruction or subsequent updates trigger crashes or heap corruption. This vulnerability is fixed in 7.1.2-9 and 6.9.13-34.

