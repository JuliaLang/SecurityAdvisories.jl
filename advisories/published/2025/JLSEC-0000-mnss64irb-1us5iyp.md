```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64irb-1us5iyp"
modified = 2025-11-04T03:43:05.207Z
upstream = ["CVE-2024-47596"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0015.html", "https://securitylab.github.com/advisories/GHSL-2024-244_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47596"
imported = 2025-11-04T03:43:05.207Z
modified = 2025-11-03T21:16:24.093Z
published = 2024-12-12T02:03:31.010Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47596"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47596"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read has been discovered in the qtdemux_parse_svq3_stsd_data function within qtdemux.c. In the FOURCC_SMI_ case, seqh_size is read from the input file without proper validation. If seqh_size is greater than the remaining size of the data buffer, it can lead to an OOB-read in the following call to gst_buffer_fill, which internally uses memcpy. This vulnerability can result in reading up to 4GB of process memory or potentially causing a segmentation fault (SEGV) when accessing invalid memory. This vulnerability is fixed in 1.24.10.

