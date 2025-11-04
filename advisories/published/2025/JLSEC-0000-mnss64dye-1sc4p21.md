```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64dye-1sc4p21"
modified = 2025-11-04T03:42:58.982Z
upstream = ["CVE-2024-47538"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8035.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0022.html", "https://securitylab.github.com/advisories/GHSL-2024-115_GHSL-2024-118_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47538"
imported = 2025-11-04T03:42:58.982Z
modified = 2025-11-03T23:16:12.917Z
published = 2024-12-12T02:03:28.070Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47538"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47538"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A stack-buffer overflow has been detected in the `vorbis_handle_identification_packet` function within `gstvorbisdec.c`. The position array is a stack-allocated buffer of size 64. If vd->vi.channels exceeds 64, the for loop will write beyond the boundaries of the position array. The value written will always be `GST_AUDIO_CHANNEL_POSITION_NONE`. This vulnerability allows someone to overwrite the EIP address allocated in the stack. Additionally, this bug can overwrite the `GstAudioInfo` info structure. This vulnerability is fixed in 1.24.10.

