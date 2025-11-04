```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t829-t5il7s"
modified = 2025-11-04T04:02:17.745Z
upstream = ["CVE-2024-47776"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0027.html", "https://securitylab.github.com/advisories/GHSL-2024-260_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47776"
imported = 2025-11-04T04:02:17.745Z
modified = 2025-11-03T21:16:29.987Z
published = 2024-12-12T02:03:40.557Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47776"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47776"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read has been discovered in gst_wavparse_cue_chunk within gstwavparse.c. The vulnerability happens due to a discrepancy between the size of the data buffer and the size value provided to the function. This mismatch causes the comparison  if (size < 4 + ncues * 24) to fail in some cases, allowing the subsequent loop to access beyond the bounds of the data buffer. The root cause of this discrepancy stems from a miscalculation when clipping the chunk size based on upstream data size. This vulnerability allows reading beyond the bounds of the data buffer, potentially leading to a crash (denial of service) or the leak of sensitive data. This vulnerability is fixed in 1.24.10.

