```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudjh-1toobe0"
modified = 2025-11-25T22:36:01.421Z
upstream = ["CVE-2025-55298"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/439b362b93c074eea6c3f834d84982b43ef057d5", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9ccg-6pjw-x645", "https://github.com/dlemstra/Magick.NET/releases/tag/14.8.1", "https://lists.debian.org/debian-lts-announce/2025/09/msg00012.html", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9ccg-6pjw-x645"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.2004+0"]

[[jlsec_sources]]
id = "CVE-2025-55298"
imported = 2025-11-25T22:36:01.421Z
modified = 2025-11-03T19:16:12.337Z
published = 2025-08-26T18:15:47.583Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-55298"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-55298"
```

# ImageMagick is free and open-source software used for editing and manipulating digital images

ImageMagick is free and open-source software used for editing and manipulating digital images. Prior to ImageMagick versions 6.9.13-28 and 7.1.2-2, a format string bug vulnerability exists in InterpretImageFilename function where user input is directly passed to FormatLocaleString without proper sanitization. An attacker can overwrite arbitrary memory regions, enabling a wide range of attacks from heap overflow to remote code execution. This issue has been patched in versions 6.9.13-28 and 7.1.2-2.

