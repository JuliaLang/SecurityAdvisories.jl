```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxu-jjx497"
modified = 2025-11-25T22:36:00.642Z
upstream = ["CVE-2022-32545"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2091811", "https://github.com/ImageMagick/ImageMagick/commit/9c9a84cec4ab28ee0b57c2b9266d6fbe68183512", "https://github.com/ImageMagick/ImageMagick6/commit/450949ed017f009b399c937cf362f0058eacc5fa", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2091811", "https://github.com/ImageMagick/ImageMagick/commit/9c9a84cec4ab28ee0b57c2b9266d6fbe68183512", "https://github.com/ImageMagick/ImageMagick6/commit/450949ed017f009b399c937cf362f0058eacc5fa", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-32545"
imported = 2025-11-25T22:36:00.642Z
modified = 2024-11-21T07:06:35.893Z
published = 2022-06-16T18:15:10.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-32545"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-32545"
```

# A vulnerability was found in ImageMagick, causing an outside the range of representable values of ty...

A vulnerability was found in ImageMagick, causing an outside the range of representable values of type 'unsigned char' at coders/psd.c, when crafted or untrusted input is processed. This leads to a negative impact to application availability or other problems related to undefined behavior.

