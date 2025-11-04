```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t6je-ft09a0"
modified = 2025-11-04T04:02:15.770Z
upstream = ["CVE-2024-47602"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0019.html", "https://securitylab.github.com/advisories/GHSL-2024-250_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47602"
imported = 2025-11-04T04:02:15.770Z
modified = 2025-11-03T21:16:24.690Z
published = 2024-12-12T02:03:31.893Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47602"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47602"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been discovered in the gst_matroska_demux_add_wvpk_header function within matroska-demux.c. This function does not properly check the validity of the stream->codec_priv pointer in the following code. If stream->codec_priv is NULL, the call to GST_READ_UINT16_LE will attempt to dereference a null pointer, leading to a crash of the application. This vulnerability is fixed in 1.24.10.

