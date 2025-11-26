```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxz-wvoymb"
modified = 2025-11-25T22:36:00.647Z
upstream = ["CVE-2021-20224"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/5af1dffa4b6ab984b5f13d1e91c95760d75f12a6", "https://github.com/ImageMagick/ImageMagick/pull/3083", "https://github.com/ImageMagick/ImageMagick6/commit/553054c1cb1e4e05ec86237afef76a32cd7c464d", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://github.com/ImageMagick/ImageMagick/commit/5af1dffa4b6ab984b5f13d1e91c95760d75f12a6", "https://github.com/ImageMagick/ImageMagick/pull/3083", "https://github.com/ImageMagick/ImageMagick6/commit/553054c1cb1e4e05ec86237afef76a32cd7c464d", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2021-20224"
imported = 2025-11-25T22:36:00.647Z
modified = 2024-11-21T05:46:09.763Z
published = 2022-08-25T20:15:08.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20224"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20224"
```

# An integer overflow issue was discovered in ImageMagick's ExportIndexQuantum() function in MagickCor...

An integer overflow issue was discovered in ImageMagick's ExportIndexQuantum() function in MagickCore/quantum-export.c. Function calls to GetPixelIndex() could result in values outside the range of representable for the 'unsigned char'. When ImageMagick processes a crafted pdf file, this could lead to an undefined behaviour or a crash.

