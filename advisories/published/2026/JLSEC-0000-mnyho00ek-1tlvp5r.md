```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyho00ek-1tlvp5r"
modified = 2026-03-27T23:16:28.171Z
upstream = ["EUVD-2026-2936", "GHSA-5379-f5hf-w38v", "CVE-2026-22863"]
severity = ["CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:N/VA:N/SC:H/SI:N/SA:N"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-5379-f5hf-w38v", "https://nvd.nist.gov/vuln/detail/CVE-2026-22863", "https://github.com/denoland/deno", "https://github.com/denoland/deno/releases/tag/v2.6.0"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2026-2936"
imported = 2026-03-27T23:16:15.740Z
modified = 2026-01-16T17:16:41.000Z
published = 2026-01-15T22:53:15.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2026-2936"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2026-2936"
[[jlsec_sources]]
id = "CVE-2026-22863"
imported = 2026-03-27T23:16:28.171Z
modified = 2026-01-21T14:35:52.730Z
published = 2026-01-15T23:15:51.767Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22863"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22863"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Before 2.6.0, node:crypto doesn't finalize cipher. The vulnerability allows an attacker to have infinite encryptions. This can lead to naive attempts at brute forcing, as well as more refined attacks with the goal to learn the server secrets. This vulnerability is fixed in 2.6.0.

