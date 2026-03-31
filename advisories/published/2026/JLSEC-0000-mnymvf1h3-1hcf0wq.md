```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1h3-1hcf0wq"
modified = 2026-03-31T14:45:25.334Z
upstream = ["EUVD-2024-0957", "GHSA-m4pq-fv2w-6hrw", "CVE-2024-27936"]
severity = ["CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-m4pq-fv2w-6hrw", "https://nvd.nist.gov/vuln/detail/CVE-2024-27936", "https://github.com/denoland/deno/commit/78d430103a8f6931154ddbbe19d36f3b8630286d", "https://github.com/denoland/deno/commit/7e6b94231290020b55f1d08fb03ea8132781abc5", "https://github.com/denoland/deno"]

[[affected]]
pkg = "Deno_jll"
ranges = [">= 1.33.4+0, < 2.0.0+0"]

[[jlsec_sources]]
id = "EUVD-2024-0957"
imported = 2026-03-31T14:42:45.362Z
modified = 2024-08-02T00:41:55.000Z
published = 2024-03-06T21:05:59.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-0957"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-0957"
[[jlsec_sources]]
id = "CVE-2024-27936"
imported = 2026-03-31T14:45:25.334Z
modified = 2025-01-03T19:27:46.510Z
published = 2024-03-21T02:52:22.813Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-27936"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-27936"
```

Deno is a JavaScript, TypeScript, and WebAssembly runtime with secure defaults. Starting in version 1.32.1 and prior to version 1.41.0 of the deno library, maliciously crafted permission request can show the spoofed permission prompt by inserting a broken ANSI escape sequence into the request contents. Deno is stripping any ANSI escape sequences from the permission prompt, but permissions given to the program are based on the contents that contain the ANSI escape sequences. Any Deno program can spoof the content of the interactive permission prompt by inserting a broken ANSI code, which allows a malicious Deno program to display the wrong file path or program name to the user. Version 1.41.0 of the deno library contains a patch for the issue.

