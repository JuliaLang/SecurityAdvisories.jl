```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t6fr-12ooo4h"
modified = 2025-11-04T04:02:15.639Z
upstream = ["CVE-2024-47601"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0020.html", "https://securitylab.github.com/advisories/GHSL-2024-249_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47601"
imported = 2025-11-04T04:02:15.639Z
modified = 2025-11-03T21:16:24.573Z
published = 2024-12-12T02:03:31.727Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47601"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47601"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been discovered in the gst_matroska_demux_parse_blockgroup_or_simpleblock function within matroska-demux.c. This function does not properly check the validity of the GstBuffer *sub pointer before performing dereferences. As a result, null pointer dereferences may occur. This vulnerability is fixed in 1.24.10.

