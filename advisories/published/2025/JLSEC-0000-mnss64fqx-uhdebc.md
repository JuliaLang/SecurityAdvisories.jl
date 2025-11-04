```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64fqx-uhdebc"
modified = 2025-11-04T03:43:01.305Z
upstream = ["CVE-2024-47544"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0011.html", "https://securitylab.github.com/advisories/GHSL-2024-238_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47544"
imported = 2025-11-04T03:43:01.305Z
modified = 2025-11-03T21:16:23.700Z
published = 2024-12-12T02:03:28.950Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47544"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47544"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. The function qtdemux_parse_sbgp in qtdemux.c is affected by a null dereference vulnerability. This vulnerability is fixed in 1.24.10.

