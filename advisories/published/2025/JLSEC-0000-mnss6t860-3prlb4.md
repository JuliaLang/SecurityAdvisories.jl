```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t860-3prlb4"
modified = 2025-11-04T04:02:17.880Z
upstream = ["CVE-2024-47777"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0027.html", "https://securitylab.github.com/advisories/GHSL-2024-259_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47777"
imported = 2025-11-04T04:02:17.880Z
modified = 2025-11-03T21:16:30.127Z
published = 2024-12-12T02:03:40.700Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47777"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47777"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been identified in the gst_wavparse_smpl_chunk function within gstwavparse.c. This function attempts to read 4 bytes from the data + 12 offset without checking if the size of the data buffer is sufficient. If the buffer is too small, the function reads beyond its bounds. This vulnerability may result in reading 4 bytes out of the boundaries of the data buffer. This vulnerability is fixed in 1.24.10.

