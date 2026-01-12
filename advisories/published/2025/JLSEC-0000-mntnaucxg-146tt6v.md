```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxg-146tt6v"
modified = 2025-11-25T22:36:00.628Z
upstream = ["CVE-2020-27829"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1922525", "https://github.com/ImageMagick/ImageMagick/commit/6ee5059cd3ac8d82714a1ab1321399b88539abf0", "https://bugzilla.redhat.com/show_bug.cgi?id=1922525", "https://github.com/ImageMagick/ImageMagick/commit/6ee5059cd3ac8d82714a1ab1321399b88539abf0"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2020-27829"
imported = 2025-11-25T22:36:00.628Z
modified = 2024-11-21T05:21:53.577Z
published = 2021-03-26T17:15:11.953Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27829"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27829"
```

# A heap based buffer overflow in coders/tiff.c may result in program crash and denial of service in I...

A heap based buffer overflow in coders/tiff.c may result in program crash and denial of service in ImageMagick before 7.0.10-45.

