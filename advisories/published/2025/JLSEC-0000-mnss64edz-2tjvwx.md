```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64edz-2tjvwx"
modified = 2025-11-04T03:42:59.543Z
upstream = ["CVE-2024-47539"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0007.html", "https://securitylab.github.com/advisories/GHSL-2024-195_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47539"
imported = 2025-11-04T03:42:59.543Z
modified = 2025-11-03T21:16:23.250Z
published = 2024-12-12T02:03:28.203Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47539"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47539"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An out-of-bounds write vulnerability was identified in the convert_to_s334_1a function in isomp4/qtdemux.c. The vulnerability arises due to a discrepancy between the size of memory allocated to the storage array and the loop condition i * 2 < ccpair_size. Specifically, when ccpair_size is even, the allocated size in storage does not match the loop's expected bounds, resulting in an out-of-bounds write. This bug allows for the overwriting of up to 3 bytes beyond the allocated bounds of the storage array. This vulnerability is fixed in 1.24.10.

