```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudj8-yhyzhy"
modified = 2025-11-25T22:36:01.412Z
upstream = ["CVE-2025-53019"]
references = ["https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cfh4-9f7v-fhrc", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cfh4-9f7v-fhrc"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2001+0"]

[[jlsec_sources]]
id = "CVE-2025-53019"
imported = 2025-11-25T22:36:01.412Z
modified = 2025-11-03T19:16:08.050Z
published = 2025-07-14T20:15:29.043Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-53019"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-53019"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. In versions prior to 7.1.2-0 and 6.9.13-26, in ImageMagick's `magick stream` command, specifying multiple consecutive `%d` format specifiers in a filename template causes a memory leak. Versions 7.1.2-0 and 6.9.13-26 fix the issue.

