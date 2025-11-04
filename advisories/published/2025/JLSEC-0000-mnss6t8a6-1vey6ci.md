```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t8a6-1vey6ci"
modified = 2025-11-04T04:02:18.030Z
upstream = ["CVE-2024-47778"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0027.html", "https://securitylab.github.com/advisories/GHSL-2024-258_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47778"
imported = 2025-11-04T04:02:18.030Z
modified = 2025-11-03T21:16:30.270Z
published = 2024-12-12T02:03:40.840Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47778"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47778"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been discovered in gst_wavparse_adtl_chunk within gstwavparse.c. This vulnerability arises due to insufficient validation of the size parameter, which can exceed the bounds of the data buffer. As a result, an OOB read occurs in the following while loop. This vulnerability can result in reading up to 4GB of process memory or potentially causing a segmentation fault (SEGV) when accessing invalid memory. This vulnerability is fixed in 1.24.10.

