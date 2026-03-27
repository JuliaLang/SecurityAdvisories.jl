```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbeqg-152kgus"
modified = 2026-03-27T22:57:26.269Z
upstream = ["EUVD-2026-2935", "GHSA-m3c4-prhw-mrx6", "CVE-2026-22864"]
severity = ["CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-m3c4-prhw-mrx6", "https://nvd.nist.gov/vuln/detail/CVE-2026-22864", "https://github.com/denoland/deno", "https://github.com/denoland/deno/releases/tag/v2.5.6"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2026-2935"
imported = 2026-03-27T22:57:07.697Z
modified = 2026-01-16T17:16:02.000Z
published = 2026-01-15T22:58:52.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2026-2935"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2026-2935"
[[jlsec_sources]]
id = "CVE-2026-22864"
imported = 2026-03-27T22:57:26.269Z
modified = 2026-01-21T14:32:39.837Z
published = 2026-01-15T23:15:51.937Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22864"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22864"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Before 2.5.6, a prior patch aimed to block spawning Windows batch/shell files by returning an error when a spawned path’s extension matched .bat or .cmd. That check performs a case-sensitive comparison against lowercase literals and therefore can be bypassed when the extension uses alternate casing (for example .BAT, .Bat, etc.). This vulnerability is fixed in 2.5.6.

