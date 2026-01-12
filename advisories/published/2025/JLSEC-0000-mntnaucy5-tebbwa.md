```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy5-tebbwa"
modified = 2025-11-25T22:36:00.653Z
upstream = ["CVE-2023-1289"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2176858", "https://github.com/ImageMagick/ImageMagick/commit/c5b23cbf2119540725e6dc81f4deb25798ead6a4", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-j96m-mjp6-99xr", "https://lists.debian.org/debian-lts-announce/2024/02/msg00007.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2176858", "https://github.com/ImageMagick/ImageMagick/commit/c5b23cbf2119540725e6dc81f4deb25798ead6a4", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-j96m-mjp6-99xr", "https://lists.debian.org/debian-lts-announce/2024/02/msg00007.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-1289"
imported = 2025-11-25T22:36:00.653Z
modified = 2024-11-21T07:38:50.907Z
published = 2023-03-23T20:15:14.393Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-1289"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-1289"
```

# A vulnerability was discovered in ImageMagick where a specially created SVG file loads itself and ca...

A vulnerability was discovered in ImageMagick where a specially created SVG file loads itself and causes a segmentation fault. This flaw allows a remote attacker to pass a specially crafted SVG file that leads to a segmentation fault, generating many trash files in "/tmp," resulting in a denial of service. When ImageMagick crashes, it generates a lot of trash files. These trash files can be large if the SVG file contains many render actions. In a denial of service attack, if a remote attacker uploads an SVG file of size t, ImageMagick generates files of size 103*t. If an attacker uploads a 100M SVG, the server will generate about 10G.

