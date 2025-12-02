```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapv7wt-1x6bzv5"
modified = 2025-10-22T22:35:52.397Z
upstream = ["CVE-2023-35945"]
references = ["https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29pc-x22r", "https://github.com/nghttp2/nghttp2/blob/e7f59406556c80904b81b593d38508591bb7523a/lib/nghttp2_session.c#L3346", "https://github.com/envoyproxy/envoy/security/advisories/GHSA-jfxv-29pc-x22r", "https://github.com/nghttp2/nghttp2/blob/e7f59406556c80904b81b593d38508591bb7523a/lib/nghttp2_session.c#L3346"]

[[affected]]
pkg = "nghttp2_jll"
ranges = ["< 1.58.0+0"]

[[jlsec_sources]]
id = "CVE-2023-35945"
imported = 2025-10-22T22:35:52.397Z
modified = 2024-11-21T08:09:01.860Z
published = 2023-07-13T21:15:08.880Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-35945"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-35945"
```

# Envoy is a cloud-native high-performance edge/middle/service proxy

Envoy is a cloud-native high-performance edge/middle/service proxy. Envoy’s HTTP/2 codec may leak a header map and bookkeeping structures upon receiving `RST_STREAM` immediately followed by the `GOAWAY` frames from an upstream server. In nghttp2, cleanup of pending requests due to receipt of the `GOAWAY` frame skips de-allocation of the bookkeeping structure and pending compressed header. The error return [code path] is taken if connection is already marked for not sending more requests due to `GOAWAY` frame. The clean-up code is right after the return statement, causing memory leak. Denial of service through memory exhaustion. This vulnerability was patched in versions(s) 1.26.3, 1.25.8, 1.24.9, 1.23.11.

