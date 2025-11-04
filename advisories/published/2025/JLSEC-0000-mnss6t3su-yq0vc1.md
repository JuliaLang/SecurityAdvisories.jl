```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t3su-yq0vc1"
modified = 2025-11-04T04:02:12.222Z
upstream = ["CVE-2024-47598"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0006.html", "https://securitylab.github.com/advisories/GHSL-2024-246_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47598"
imported = 2025-11-04T04:02:12.222Z
modified = 2025-11-03T21:16:24.337Z
published = 2024-12-12T02:03:31.283Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47598"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47598"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been discovered in the qtdemux_merge_sample_table function within qtdemux.c. The problem is that the size of the stts buffer isn’t properly checked before reading stts_duration, allowing the program to read 4 bytes beyond the boundaries of stts->data. This vulnerability reads up to 4 bytes past the allocated bounds of the stts array. This vulnerability is fixed in 1.24.10.

