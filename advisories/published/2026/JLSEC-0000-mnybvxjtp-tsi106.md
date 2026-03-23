```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnybvxjtp-tsi106"
modified = 2026-03-23T22:11:39.037Z
upstream = ["CVE-2026-27135"]
references = ["https://github.com/nghttp2/nghttp2/commit/5c7df8fa815ac1004d9ecb9d1f7595c4d37f46e1", "https://github.com/nghttp2/nghttp2/security/advisories/GHSA-6933-cjhr-5qg6", "http://www.openwall.com/lists/oss-security/2026/03/20/3"]

[[affected]]
pkg = "nghttp2_jll"
ranges = ["< 1.68.1+0"]

[[jlsec_sources]]
id = "CVE-2026-27135"
imported = 2026-03-23T22:11:39.037Z
modified = 2026-03-23T17:51:17.017Z
published = 2026-03-18T18:16:26.723Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-27135"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-27135"
```

# nghttp2 is an implementation of the Hypertext Transfer Protocol version 2 in C

nghttp2 is an implementation of the Hypertext Transfer Protocol version 2 in C. Prior to version 1.68.1, the nghttp2 library stops reading the incoming data when user facing public API `nghttp2_session_terminate_session` or `nghttp2_session_terminate_session2` is called by the application. They might be called internally by the library when it detects the situation that is subject to connection error. Due to the missing internal state validation, the library keeps reading the rest of the data after one of those APIs is called. Then receiving a malformed frame that causes FRAME_SIZE_ERROR causes assertion failure. nghttp2 v1.68.1 adds missing state validation to avoid assertion failure. No known workarounds are available.

