```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t8dz-wu1rc8"
modified = 2025-11-04T04:02:18.167Z
upstream = ["CVE-2024-47834"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0030.html", "https://securitylab.github.com/advisories/GHSL-2024-280_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47834"
imported = 2025-11-04T04:02:18.167Z
modified = 2025-11-03T21:16:30.680Z
published = 2024-12-12T02:03:43.017Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47834"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47834"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An Use-After-Free read vulnerability has been discovered affecting the processing of CodecPrivate elements in Matroska streams. In the GST_MATROSKA_ID_CODECPRIVATE case within the gst_matroska_demux_parse_stream function, a data chunk is allocated using gst_ebml_read_binary. Later, the allocated memory is freed in the gst_matroska_track_free function, by the call to g_free (track->codec_priv). Finally, the freed memory is accessed in the caps_serialize function through gst_value_serialize_buffer. The freed memory will be accessed in the gst_value_serialize_buffer function. This results in a UAF read vulnerability, as the function tries to process memory that has already been freed. This vulnerability is fixed in 1.24.10.

