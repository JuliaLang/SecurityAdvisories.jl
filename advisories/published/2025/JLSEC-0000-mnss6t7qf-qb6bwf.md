```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6t7qf-qb6bwf"
modified = 2025-11-04T04:02:17.319Z
upstream = ["CVE-2024-47615"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8038.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0026.html", "https://securitylab.github.com/advisories/GHSL-2024-115_GHSL-2024-118_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47615"
imported = 2025-11-04T04:02:17.319Z
modified = 2025-11-03T23:16:13.613Z
published = 2024-12-12T02:03:32.940Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47615"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47615"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-Write has been detected in the function gst_parse_vorbis_setup_packet within vorbis_parse.c. The integer size is read from the input file without proper validation. As a result, size can exceed the fixed size of the pad->vorbis_mode_sizes array (which size is 256). When this happens, the for loop overwrites the entire pad structure with 0s and 1s, affecting adjacent memory as well. This OOB-write can overwrite up to 380 bytes of memory beyond the boundaries of the pad->vorbis_mode_sizes array. This vulnerability is fixed in 1.24.10.

