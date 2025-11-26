```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudjf-2m13ls"
modified = 2025-11-25T22:36:01.419Z
upstream = ["CVE-2025-55212"]
references = ["https://github.com/ImageMagick/ImageMagick/blob/0ba1b587be17543b664f7ad538e9e51e0da59d17/MagickCore/geometry.c#L355", "https://github.com/ImageMagick/ImageMagick/blob/0ba1b587be17543b664f7ad538e9e51e0da59d17/MagickCore/resize.c#L4625-L4629", "https://github.com/ImageMagick/ImageMagick/commit/5f0bcf986b8b5e90567750d31a37af502b73f2af", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fh55-q5pj-pxgw", "https://github.com/dlemstra/Magick.NET/releases/tag/14.8.1", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fh55-q5pj-pxgw"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2004+0"]

[[jlsec_sources]]
id = "CVE-2025-55212"
imported = 2025-11-25T22:36:01.419Z
modified = 2025-11-03T19:16:12.180Z
published = 2025-08-26T17:15:39.863Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55212"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55212"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to versions 6.9.13-28 and 7.1.2-2, passing a geometry string containing only a colon (":") to montage -geometry leads GetGeometry() to set width/height to 0. Later, ThumbnailImage() divides by these zero dimensions, triggering a crash (SIGFPE/abort), resulting in a denial of service. This issue has been patched in versions 6.9.13-28 and 7.1.2-2.

