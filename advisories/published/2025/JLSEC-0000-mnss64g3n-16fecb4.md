```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64g3n-16fecb4"
modified = 2025-11-04T03:43:01.763Z
upstream = ["CVE-2024-47545"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0010.html", "https://securitylab.github.com/advisories/GHSL-2024-242_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47545"
imported = 2025-11-04T03:43:01.763Z
modified = 2025-11-03T21:16:23.840Z
published = 2024-12-12T02:03:29.083Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47545"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47545"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An integer underflow has been detected in qtdemux_parse_trak function within qtdemux.c. During the strf parsing case, the subtraction size -= 40 can lead to a negative integer overflow if it is less than 40. If this happens, the subsequent call to gst_buffer_fill will invoke memcpy with a large tocopy size, resulting in an OOB-read. This vulnerability is fixed in 1.24.10.

