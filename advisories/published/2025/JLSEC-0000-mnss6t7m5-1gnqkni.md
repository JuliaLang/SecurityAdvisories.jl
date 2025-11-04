```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t7m5-1gnqkni"
modified = 2025-11-04T04:02:17.165Z
upstream = ["CVE-2024-47613"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0025.html", "https://securitylab.github.com/advisories/GHSL-2024-115_GHSL-2024-118_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47613"
imported = 2025-11-04T04:02:17.165Z
modified = 2025-11-03T21:16:25.160Z
published = 2024-12-12T02:03:32.740Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47613"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47613"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been identified in `gst_gdk_pixbuf_dec_flush` within `gstgdkpixbufdec.c`. This function invokes `memcpy`, using `out_pix` as the destination address. `out_pix` is expected to point to the frame 0 from the frame structure, which is read from the input file. However, in certain situations, it can points to a NULL frame, causing the subsequent call to `memcpy` to attempt writing to the null address (0x00), leading to a null pointer dereference. This vulnerability can result in a Denial of Service (DoS) by triggering a segmentation fault (SEGV). This vulnerability is fixed in 1.24.10.

