```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvd1il48-11fj7w"
modified = 2026-01-08T03:36:37.736Z
upstream = ["CVE-2023-51794"]
references = ["https://trac.ffmpeg.org/ticket/10746", "https://trac.ffmpeg.org/ticket/10746"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-51794"
imported = 2026-01-08T03:36:37.736Z
modified = 2026-01-07T14:23:43.130Z
published = 2024-04-26T15:15:48.240Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51794"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51794"
```

# Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arb...

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arbitrary code via the libavfilter/af_stereowiden.c:120:69.

