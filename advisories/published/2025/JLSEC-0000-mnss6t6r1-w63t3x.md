```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t6r1-w63t3x"
modified = 2025-11-04T04:02:16.045Z
upstream = ["CVE-2024-47606"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0014.html", "https://securitylab.github.com/advisories/GHSL-2024-166_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00016.html", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html", "https://security.netapp.com/advisory/ntap-20250418-0003/"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47606"
imported = 2025-11-04T04:02:16.045Z
modified = 2025-11-03T21:16:24.987Z
published = 2024-12-12T02:03:32.220Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47606"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47606"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An integer underflow has been detected in the function qtdemux_parse_theora_extension within qtdemux.c. The vulnerability occurs due to an underflow of the gint size variable, which causes size to hold a large unintended value when cast to an unsigned integer. This 32-bit negative value is then cast to a 64-bit unsigned integer (0xfffffffffffffffa) in a subsequent call to gst_buffer_new_and_alloc. The function gst_buffer_new_allocate then attempts to allocate memory, eventually calling _sysmem_new_block. The function _sysmem_new_block adds alignment and header size to the (unsigned) size, causing the overflow of the 'slice_size' variable. As a result, only 0x89 bytes are allocated, despite the large input size. When the following memcpy call occurs in gst_buffer_fill, the data from the input file will overwrite the content of the GstMapInfo info structure. Finally, during the call to gst_memory_unmap, the overwritten memory may cause a function pointer hijack, as the mem->allocator->mem_unmap_full function is called with a corrupted pointer. This function pointer overwrite could allow an attacker to alter the execution flow of the program, leading to arbitrary code execution. This vulnerability is fixed in 1.24.10.

