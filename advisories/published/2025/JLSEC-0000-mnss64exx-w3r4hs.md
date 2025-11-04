```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64exx-w3r4hs"
modified = 2025-11-04T03:43:00.261Z
upstream = ["CVE-2024-47541"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8036.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0023.html", "https://securitylab.github.com/advisories/GHSL-2024-228_GStreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47541"
imported = 2025-11-04T03:43:00.261Z
modified = 2025-11-03T23:16:13.060Z
published = 2024-12-12T02:03:28.477Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47541"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47541"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. An OOB-write vulnerability has been identified in the gst_ssa_parse_remove_override_codes function of the gstssaparse.c file. This function is responsible for parsing and removing SSA (SubStation Alpha) style override codes, which are enclosed in curly brackets ({}). The issue arises when a closing curly bracket "}" appears before an opening curly bracket "{" in the input string. In this case, memmove() incorrectly duplicates a substring. With each successive loop iteration, the size passed to memmove() becomes progressively larger (strlen(end+1)), leading to a write beyond the allocated memory bounds. This vulnerability is fixed in 1.24.10.

