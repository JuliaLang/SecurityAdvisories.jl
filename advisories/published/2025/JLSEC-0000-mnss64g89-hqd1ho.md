```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64g89-hqd1ho"
modified = 2025-11-04T03:43:01.929Z
upstream = ["CVE-2024-47546"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0013.html", "https://securitylab.github.com/advisories/GHSL-2024-243_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47546"
imported = 2025-11-04T03:43:01.929Z
modified = 2025-11-03T21:16:23.970Z
published = 2024-12-12T02:03:29.210Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47546"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47546"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An integer underflow has been detected in extract_cc_from_data function within qtdemux.c. In the FOURCC_c708 case, the subtraction atom_length - 8 may result in an underflow if atom_length is less than 8. When that subtraction underflows, *cclen ends up being a large number, and then cclen is passed to g_memdup2 leading to an out-of-bounds (OOB) read. This vulnerability is fixed in 1.24.10.

