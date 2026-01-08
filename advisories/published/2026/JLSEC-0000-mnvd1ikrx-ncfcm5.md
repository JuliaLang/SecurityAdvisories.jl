```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvd1ikrx-ncfcm5"
modified = 2026-01-08T03:36:37.293Z
upstream = ["CVE-2023-51798"]
references = ["https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10758", "https://ffmpeg.org/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IPETICRXUOGRIM4U3BCRTIKE3IZWCSBT/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/6G7EYH2JAK5OJPVNC6AXYQ5K7YGYNCDN/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LE3ASLH6QF2E5OVJI5VA3JSEPJFFFMNY/", "https://trac.ffmpeg.org/ticket/10758"]

[[affected]]
pkg = "FFMPEG_jll"
ranges = [">= 7.1.0+0"]
[[affected]]
pkg = "FFplay_jll"
ranges = [">= 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2023-51798"
imported = 2026-01-08T03:36:37.293Z
modified = 2026-01-07T15:36:23.587Z
published = 2024-04-19T17:15:52.527Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-51798"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-51798"
```

# Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arb...

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local attacker to execute arbitrary code via a floating point exception (FPE) error at libavfilter/vf_minterpolate.c:1078:60 in interpolate.

