```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t76u-jsfshf"
modified = 2025-11-04T04:02:16.614Z
upstream = ["CVE-2024-47607"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8037.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0024.html", "https://securitylab.github.com/advisories/GHSL-2024-115_GHSL-2024-118_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47607"
imported = 2025-11-04T04:02:16.614Z
modified = 2025-11-03T23:16:13.477Z
published = 2024-12-12T02:03:32.363Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47607"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47607"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components.  stack-buffer overflow has been detected in the gst_opus_dec_parse_header function within `gstopusdec.c'. The pos array is a stack-allocated buffer of size 64. If n_channels exceeds 64, the for loop will write beyond the boundaries of the pos array. The value written will always be GST_AUDIO_CHANNEL_POSITION_NONE. This bug allows to overwrite the EIP address allocated in the stack. This vulnerability is fixed in 1.24.10.

