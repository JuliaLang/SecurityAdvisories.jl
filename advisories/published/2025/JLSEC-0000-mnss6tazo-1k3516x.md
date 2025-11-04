```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6tazo-1k3516x"
modified = 2025-11-04T04:02:21.540Z
upstream = ["CVE-2024-47835"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8039.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0029.html", "https://securitylab.github.com/advisories/GHSL-2024-263_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00021.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47835"
imported = 2025-11-04T04:02:21.540Z
modified = 2025-11-03T23:16:22.930Z
published = 2024-12-12T02:03:43.163Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47835"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47835"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. A null pointer dereference vulnerability has been detected in the parse_lrc function within gstsubparse.c. The parse_lrc function calls strchr() to find the character ']' in the string line. The pointer returned by this call is then passed to g_strdup(). However, if the string line does not contain the character ']', strchr() returns NULL, and a call to g_strdup(start + 1) leads to a null pointer dereference. This vulnerability is fixed in 1.24.10.

