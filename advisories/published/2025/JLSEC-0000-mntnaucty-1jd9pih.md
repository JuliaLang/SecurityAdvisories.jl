```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucty-1jd9pih"
modified = 2025-11-25T22:36:00.502Z
upstream = ["CVE-2018-16749"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/1119", "https://github.com/ImageMagick/ImageMagick6/commit/1007b98f8795ad4bea6bc5f68a32d83e982fdae4", "https://lists.debian.org/debian-lts-announce/2018/10/msg00002.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://usn.ubuntu.com/3785-1/", "https://github.com/ImageMagick/ImageMagick/issues/1119", "https://github.com/ImageMagick/ImageMagick6/commit/1007b98f8795ad4bea6bc5f68a32d83e982fdae4", "https://lists.debian.org/debian-lts-announce/2018/10/msg00002.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://usn.ubuntu.com/3785-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2018-16749"
imported = 2025-11-25T22:36:00.502Z
modified = 2024-11-21T03:53:17.207Z
published = 2018-09-09T15:29:00.220Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-16749"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-16749"
```

# In ImageMagick 7.0.7-29 and earlier, a missing NULL check in ReadOneJNGImage in coders/png.c allows ...

In ImageMagick 7.0.7-29 and earlier, a missing NULL check in ReadOneJNGImage in coders/png.c allows an attacker to cause a denial of service (WriteBlob assertion failure and application exit) via a crafted file.

