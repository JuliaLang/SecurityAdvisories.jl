```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxo-945um6"
modified = 2025-11-25T22:36:00.636Z
upstream = ["CVE-2021-3596"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1970569", "https://github.com/ImageMagick/ImageMagick/issues/2624", "https://lists.debian.org/debian-lts-announce/2022/05/msg00018.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1970569", "https://github.com/ImageMagick/ImageMagick/issues/2624", "https://lists.debian.org/debian-lts-announce/2022/05/msg00018.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2021-3596"
imported = 2025-11-25T22:36:00.636Z
modified = 2024-11-21T06:21:55.937Z
published = 2022-02-24T19:15:09.063Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3596"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3596"
```

# A NULL pointer dereference flaw was found in ImageMagick in versions prior to 7.0.10-31 in ReadSVGIm...

A NULL pointer dereference flaw was found in ImageMagick in versions prior to 7.0.10-31 in ReadSVGImage() in coders/svg.c. This issue is due to not checking the return value from libxml2's xmlCreatePushParserCtxt() and uses the value directly, which leads to a crash and segmentation fault.

