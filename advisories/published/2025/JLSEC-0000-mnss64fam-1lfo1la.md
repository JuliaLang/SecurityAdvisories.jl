```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64fam-1lfo1la"
modified = 2025-11-04T03:43:00.718Z
upstream = ["CVE-2024-47542"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8033.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0008.html", "https://securitylab.github.com/advisories/GHSL-2024-235_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47542"
imported = 2025-11-04T03:43:00.718Z
modified = 2025-11-03T23:16:13.203Z
published = 2024-12-12T02:03:28.630Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47542"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47542"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference has been discovered in the id3v2_read_synch_uint function, located in id3v2.c. If id3v2_read_synch_uint is called with a null work->hdr.frame_data, the pointer guint8 *data is accessed without validation, resulting in a null pointer dereference. This vulnerability can result in a Denial of Service (DoS) by triggering a segmentation fault (SEGV). This vulnerability is fixed in 1.24.10.

