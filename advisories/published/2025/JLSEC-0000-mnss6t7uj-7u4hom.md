```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t7uj-7u4hom"
modified = 2025-11-04T04:02:17.467Z
upstream = ["CVE-2024-47774"]
references = ["https://github.com/github/securitylab-vulnerabilities/issues/1826", "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043.patch", "https://securitylab.github.com/advisories/GHSL-2024-262_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47774"
imported = 2025-11-04T04:02:17.467Z
modified = 2025-11-03T21:16:29.720Z
published = 2024-12-12T02:03:40.297Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47774"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47774"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been identified in the gst_avi_subtitle_parse_gab2_chunk function within gstavisubtitle.c. The function reads the name_length value directly from the input file without checking it properly. Then, the a condition, does not properly handle cases where name_length is greater than 0xFFFFFFFF - 17, causing an integer overflow. In such scenario, the function attempts to access memory beyond the buffer leading to an OOB-read. This vulnerability is fixed in 1.24.10.

