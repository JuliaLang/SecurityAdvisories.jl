```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw72b0jy-x5xf42"
modified = 2026-01-29T03:51:49.390Z
upstream = ["CVE-2025-25468"]
references = ["https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd", "https://trac.ffmpeg.org/ticket/11415"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = ["*"]
[[affected]]
pkg = "FFplay_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-25468"
imported = 2026-01-29T03:51:49.371Z
modified = 2026-01-29T02:12:57.920Z
published = 2025-02-18T22:15:18.477Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-25468"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-25468"
```

# FFmpeg git-master before commit d5873b was discovered to contain a memory leak in the component liba...

FFmpeg git-master before commit d5873b was discovered to contain a memory leak in the component libavutil/mem.c.

