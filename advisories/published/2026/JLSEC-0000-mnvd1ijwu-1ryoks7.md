```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvd1ijwu-1ryoks7"
modified = 2026-01-08T03:36:36.174Z
upstream = ["CVE-2023-51791"]
references = ["https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10738", "https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10738"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-51791"
imported = 2026-01-08T03:36:36.156Z
modified = 2026-01-07T17:32:17.710Z
published = 2024-04-19T17:15:52.183Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51791"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51791"
```

# Buffer Overflow vulenrability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arb...

Buffer Overflow vulenrability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arbitrary code via the libavcodec/jpegxl_parser.c in gen_alias_map.

