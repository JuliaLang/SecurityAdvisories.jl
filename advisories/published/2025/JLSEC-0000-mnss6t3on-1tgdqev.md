```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t3on-1tgdqev"
modified = 2025-11-04T04:02:12.071Z
upstream = ["CVE-2024-47597"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0012.html", "https://securitylab.github.com/advisories/GHSL-2024-245_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47597"
imported = 2025-11-04T04:02:12.071Z
modified = 2025-11-03T21:16:24.207Z
published = 2024-12-12T02:03:31.137Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47597"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47597"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read has been detected in the function qtdemux_parse_samples within qtdemux.c. This issue arises when the function qtdemux_parse_samples reads data beyond the boundaries of the stream->stco buffer. The following code snippet shows the call to qt_atom_parser_get_offset_unchecked, which leads to the OOB-read when parsing the provided GHSL-2024-245_crash1.mp4 file. This issue may lead to read up to 8 bytes out-of-bounds. This vulnerability is fixed in 1.24.10.

