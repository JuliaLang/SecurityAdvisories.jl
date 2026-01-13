```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvk6quzt-1x7rer7"
modified = 2026-01-13T03:37:25.097Z
upstream = ["CVE-2025-22921"]
references = ["https://trac.ffmpeg.org/ticket/11393", "https://lists.debian.org/debian-lts-announce/2025/02/msg00037.html"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2025-22921"
imported = 2026-01-13T03:37:25.078Z
modified = 2026-01-12T13:08:11.540Z
published = 2025-02-18T22:15:18.040Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-22921"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-22921"
```

# FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation violation via the co...

FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation violation via the component /libavcodec/jpeg2000dec.c.

