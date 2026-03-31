```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1ev-1mqrrj7"
modified = 2026-03-31T14:42:43.303Z
upstream = ["CVE-2023-26103"]
references = ["https://github.com/denoland/deno/blob/2b247be517d789a37e532849e2e40b724af0918f/ext/http/01_http.js%23L395-L409", "https://github.com/denoland/deno/commit/cf06a7c7e672880e1b38598fe445e2c50b4a9d06", "https://github.com/denoland/deno/pull/17722", "https://github.com/denoland/deno/releases/tag/v1.31.0", "https://security.snyk.io/vuln/SNYK-RUST-DENO-3315970", "https://github.com/denoland/deno/blob/2b247be517d789a37e532849e2e40b724af0918f/ext/http/01_http.js%23L395-L409", "https://github.com/denoland/deno/commit/cf06a7c7e672880e1b38598fe445e2c50b4a9d06", "https://github.com/denoland/deno/pull/17722", "https://github.com/denoland/deno/releases/tag/v1.31.0", "https://security.snyk.io/vuln/SNYK-RUST-DENO-3315970"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 1.33.4+0"]

[[jlsec_sources]]
id = "CVE-2023-26103"
imported = 2026-03-31T14:42:43.303Z
modified = 2025-03-11T16:15:14.263Z
published = 2023-02-25T05:15:12.343Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-26103"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-26103"
```

Versions of the package deno before 1.31.0 are vulnerable to Regular Expression Denial of Service (ReDoS) due to the upgradeWebSocket function, which contains regexes in the form of /s*,s*/, used for splitting the Connection/Upgrade header. A specially crafted Connection/Upgrade header can be used to significantly slow down a web socket server.

