```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64eta-1aszb4r"
modified = 2025-11-04T03:43:00.094Z
upstream = ["CVE-2024-47540"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0017.html", "https://securitylab.github.com/advisories/GHSL-2024-197_GStreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47540"
imported = 2025-11-04T03:43:00.094Z
modified = 2025-11-03T21:16:23.427Z
published = 2024-12-12T02:03:28.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47540"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47540"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An uninitialized stack variable vulnerability has been identified in the gst_matroska_demux_add_wvpk_header function within matroska-demux.c. When size < 4, the program calls gst_buffer_unmap with an uninitialized map variable. Then, in the gst_memory_unmap function, the program will attempt to unmap the buffer using the uninitialized map variable, causing a function pointer hijack, as it will jump to mem->allocator->mem_unmap_full or mem->allocator->mem_unmap. This vulnerability could allow an attacker to hijack the execution flow, potentially leading to code execution. This vulnerability is fixed in 1.24.10.

