```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss64bfg-1vniywm"
modified = 2025-11-04T03:42:55.708Z
upstream = ["CVE-2024-47537"]
references = ["https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059.patch", "https://gstreamer.freedesktop.org/security/sa-2024-0005.html", "https://securitylab.github.com/advisories/GHSL-2024-094_Gstreamer/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00035.html"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47537"
imported = 2025-11-04T03:42:55.708Z
modified = 2025-11-03T21:16:23.097Z
published = 2024-12-12T02:03:27.877Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47537"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47537"
```

# GStreamer is a library for constructing graphs of media-handling components

GStreamer is a library for constructing graphs of media-handling components. The program attempts to reallocate the memory pointed to by stream->samples to accommodate stream->n_samples + samples_count elements of type QtDemuxSample. The problem is that samples_count is read from the input file. And if this value is big enough, this can lead to an integer overflow during the addition. As a consequence, g_try_renew might allocate memory for a significantly smaller number of elements than intended. Following this, the program iterates through samples_count elements and attempts to write samples_count number of elements, potentially exceeding the actual allocated memory size and causing an OOB-write. This vulnerability is fixed in 1.24.10.

