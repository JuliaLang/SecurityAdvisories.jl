```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvd1ik33-1b3khxw"
modified = 2026-01-08T03:36:36.399Z
upstream = ["CVE-2023-51793"]
references = ["https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10743", "https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10743"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-51793"
imported = 2026-01-08T03:36:36.399Z
modified = 2026-01-07T17:29:01.243Z
published = 2024-04-19T17:15:52.297Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51793"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51793"
```

# Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arb...

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arbitrary code via the libavutil/imgutils.c:353:9 in image_copy_plane.

