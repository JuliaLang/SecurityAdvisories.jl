```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64fek-s5imac"
modified = 2025-11-04T03:43:00.860Z
upstream = ["CVE-2024-47543"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0009.html", "https://securitylab.github.com/advisories/GHSL-2024-236_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47543"
imported = 2025-11-04T03:43:00.860Z
modified = 2025-11-03T21:16:23.563Z
published = 2024-12-12T02:03:28.807Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47543"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47543"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been discovered in qtdemux_parse_container function within qtdemux.c. In the parent function qtdemux_parse_node, the value of length is not well checked. So, if length is big enough, it causes the pointer end to point beyond the boundaries of buffer. Subsequently, in the qtdemux_parse_container function, the while loop can trigger an OOB-read, accessing memory beyond the bounds of buf. This vulnerability can result in reading up to 4GB of process memory or potentially causing a segmentation fault (SEGV) when accessing invalid memory. This vulnerability is fixed in 1.24.10.

