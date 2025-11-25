```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudjw-18pjp8m"
modified = 2025-11-25T22:36:01.436Z
upstream = ["CVE-2025-57807"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/077a417a19a5ea8c85559b602754a5b928eef23e", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-23hg-53q6-hqfg", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-23hg-53q6-hqfg"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2004+0"]

[[jlsec_sources]]
id = "CVE-2025-57807"
imported = 2025-11-25T22:36:01.436Z
modified = 2025-11-03T19:16:12.893Z
published = 2025-09-05T22:15:34.340Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-57807"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-57807"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. ImageMagick versions lower than 14.8.2 include  insecure functions: SeekBlob(), which permits advancing the stream offset beyond the current end without increasing capacity, and WriteBlob(), which then expands by quantum + length (amortized) instead of offset + length, and copies to data + offset. When offset ≫ extent, the copy targets memory beyond the allocation, producing a deterministic heap write on 64-bit builds. No 2⁶⁴ arithmetic wrap, external delegates, or policy settings are required. This is fixed in version 14.8.2.

