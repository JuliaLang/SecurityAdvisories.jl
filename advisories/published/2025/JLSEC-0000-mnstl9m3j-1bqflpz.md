```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl9m3j-1bqflpz"
modified = 2025-11-05T03:34:43.231Z
upstream = ["CVE-2024-28182"]
references = ["http://www.openwall.com/lists/oss-security/2024/04/03/16", "https://github.com/nghttp2/nghttp2/commit/00201ecd8f982da3b67d4f6868af72a1b03b14e0", "https://github.com/nghttp2/nghttp2/commit/d71a4668c6bead55805d18810d633fbb98315af9", "https://github.com/nghttp2/nghttp2/security/advisories/GHSA-x6x3-gv8h-m57q", "https://lists.debian.org/debian-lts-announce/2024/04/msg00026.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/AGOME6ZXJG7664IPQNVE3DL67E3YP3HY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/J6ZMXUGB66VAXDW5J6QSTHM5ET25FGSA/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/PXJO2EASHM2OQQLGVDY5ZSO7UVDVHTDK/", "http://www.openwall.com/lists/oss-security/2024/04/03/16", "https://github.com/nghttp2/nghttp2/commit/00201ecd8f982da3b67d4f6868af72a1b03b14e0", "https://github.com/nghttp2/nghttp2/commit/d71a4668c6bead55805d18810d633fbb98315af9", "https://github.com/nghttp2/nghttp2/security/advisories/GHSA-x6x3-gv8h-m57q", "https://lists.debian.org/debian-lts-announce/2024/04/msg00026.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00041.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/AGOME6ZXJG7664IPQNVE3DL67E3YP3HY/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/J6ZMXUGB66VAXDW5J6QSTHM5ET25FGSA/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/PXJO2EASHM2OQQLGVDY5ZSO7UVDVHTDK/", "https://www.kb.cert.org/vuls/id/421644"]

[[affected]]
pkg = "nghttp2_jll"
ranges = ["< 1.61.0+0"]

[[jlsec_sources]]
id = "CVE-2024-28182"
imported = 2025-11-05T03:34:43.231Z
modified = 2025-11-04T19:17:05.097Z
published = 2024-04-04T15:15:38.427Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-28182"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-28182"
```

# nghttp2 is an implementation of the Hypertext Transfer Protocol version 2 in C

nghttp2 is an implementation of the Hypertext Transfer Protocol version 2 in C. The nghttp2 library prior to version 1.61.0 keeps reading the unbounded number of HTTP/2 CONTINUATION frames even after a stream is reset to keep HPACK context in sync.  This causes excessive CPU usage to decode HPACK stream. nghttp2 v1.61.0 mitigates this vulnerability by limiting the number of CONTINUATION frames it accepts per stream. There is no workaround for this vulnerability.

