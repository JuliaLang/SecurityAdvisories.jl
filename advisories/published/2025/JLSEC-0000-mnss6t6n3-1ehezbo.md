```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t6n3-1ehezbo"
modified = 2025-11-04T04:02:15.903Z
upstream = ["CVE-2024-47603"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0021.html", "https://securitylab.github.com/advisories/GHSL-2024-251_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47603"
imported = 2025-11-04T04:02:15.903Z
modified = 2025-11-03T21:16:24.827Z
published = 2024-12-12T02:03:32.033Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47603"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47603"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been discovered in the gst_matroska_demux_update_tracks function within matroska-demux.c. The vulnerability occurs when the gst_caps_is_equal function is called with invalid caps values. If this happen, then in the function gst_buffer_get_size the call to GST_BUFFER_MEM_PTR can return a null pointer. Attempting to dereference the size field of this null pointer results in a null pointer dereference. This vulnerability is fixed in 1.24.10.

