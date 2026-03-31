```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1mt-va97xw"
modified = 2026-03-31T14:42:51.601Z
upstream = ["EUVD-2026-7794", "CVE-2026-27190", "GHSA-hmh4-3xvx-q5hr"]
severity = ["CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-hmh4-3xvx-q5hr", "https://github.com/denoland/deno/commit/9132ad958c83a0d0b199de12b69b877f63edab4c", "https://github.com/denoland/deno/releases/tag/v2.6.8", "https://nvd.nist.gov/vuln/detail/CVE-2026-27190"]

[[affected]]
pkg = "Deno_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "EUVD-2026-7794"
imported = 2026-03-31T14:42:45.243Z
modified = 2026-02-20T22:20:03.000Z
published = 2026-02-19T20:31:41.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2026-7794"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2026-7794"
[[jlsec_sources]]
id = "CVE-2026-27190"
imported = 2026-03-31T14:42:51.601Z
modified = 2026-03-02T13:35:52.260Z
published = 2026-02-20T21:19:28.090Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-27190"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-27190"
```

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Prior to 2.6.8, a command injection vulnerability exists in Deno's node:child_process implementation. This vulnerability is fixed in 2.6.8.

