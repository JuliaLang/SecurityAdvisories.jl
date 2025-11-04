```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t688-aaupw6"
modified = 2025-11-04T04:02:15.368Z
upstream = ["CVE-2024-47599"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0016.html", "https://securitylab.github.com/advisories/GHSL-2024-247_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47599"
imported = 2025-11-04T04:02:15.368Z
modified = 2025-11-03T21:16:24.460Z
published = 2024-12-12T02:03:31.440Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47599"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47599"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been discovered in the gst_jpeg_dec_negotiate function in gstjpegdec.c. This function does not check for a NULL return value from gst_video_decoder_set_output_state. When this happens, dereferences of the outstate pointer will lead to a null pointer dereference. This vulnerability can result in a Denial of Service (DoS) by triggering a segmentation fault (SEGV). This vulnerability is fixed in 1.24.10.

