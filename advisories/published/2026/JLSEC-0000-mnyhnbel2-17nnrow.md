```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbel2-17nnrow"
modified = 2026-03-27T22:58:27.515Z
upstream = ["EUVD-2023-1121", "CVE-2023-28446", "GHSA-vq67-rp93-65qf"]
severity = ["CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-vq67-rp93-65qf", "https://nvd.nist.gov/vuln/detail/CVE-2023-28446", "https://github.com/denoland/deno", "https://github.com/denoland/deno/blob/7d13d65468c37022f003bb680dfbddd07ea72173/runtime/js/40_process.js#L175", "https://github.com/denoland/deno/releases/tag/v1.31.2"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 1.33.4+0"]

[[jlsec_sources]]
id = "EUVD-2023-1121"
imported = 2026-03-27T22:57:07.807Z
modified = 2025-02-19T20:25:29.000Z
published = 2023-03-24T19:46:28.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2023-1121"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2023-1121"
[[jlsec_sources]]
id = "CVE-2023-28446"
imported = 2026-03-27T22:58:27.515Z
modified = 2024-11-21T07:55:05.730Z
published = 2023-03-24T20:15:15.560Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-28446"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-28446"
```

# Deno is a simple, modern and secure runtime for JavaScript and TypeScript that uses V8 and is built ...

Deno is a simple, modern and secure runtime for JavaScript and TypeScript that uses V8 and is built in Rust. Arbitrary program names without any ANSI filtering allows any malicious program to clear the first 2 lines of a `op_spawn_child` or `op_kill` prompt and replace it with any desired text. This works with any command on the respective platform, giving the program the full ability to choose what program they wanted to run. This problem can not be exploited on systems that do not attach an interactive prompt (for example headless servers). This issue has been patched in version 1.31.2.

