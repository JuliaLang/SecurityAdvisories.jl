```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t7yl-13dkt3q"
modified = 2025-11-04T04:02:17.613Z
upstream = ["CVE-2024-47775"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0027.html", "https://securitylab.github.com/advisories/GHSL-2024-261_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47775"
imported = 2025-11-04T04:02:17.613Z
modified = 2025-11-03T21:16:29.853Z
published = 2024-12-12T02:03:40.430Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47775"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47775"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-read vulnerability has been found in the parse_ds64 function within gstwavparse.c. The parse_ds64 function does not check that the buffer buf contains sufficient data before attempting to read from it, doing multiple GST_READ_UINT32_LE operations without performing boundary checks. This can lead to an OOB-read when buf is smaller than expected. This vulnerability allows reading beyond the bounds of the data buffer, potentially leading to a crash (denial of service) or the leak of sensitive data. This vulnerability is fixed in 1.24.10.

