```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t6c1-12fccyv"
modified = 2025-11-04T04:02:15.505Z
upstream = ["CVE-2024-47600"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8034.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0018.html", "https://securitylab.github.com/advisories/GHSL-2024-248_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47600"
imported = 2025-11-04T04:02:15.505Z
modified = 2025-11-03T23:16:13.350Z
published = 2024-12-12T02:03:31.577Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47600"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47600"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been detected in the format_channel_mask function in gst-discoverer.c. The vulnerability affects the local array position, which is defined with a fixed size of 64 elements. However, the function gst_discoverer_audio_info_get_channels may return a guint channels value greater than 64. This causes the for loop to attempt access beyond the bounds of the position array, resulting in an OOB-read when an index greater than 63 is used. This vulnerability can result in reading unintended bytes from the stack. Additionally, the dereference of value->value_nick after the OOB-read can lead to further memory corruption or undefined behavior. This vulnerability is fixed in 1.24.10.

