```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyho008h-bdzmlh"
modified = 2026-03-27T23:18:00.139Z
upstream = ["EUVD-2024-0827", "CVE-2024-27932", "GHSA-5frw-4rwq-xhcr"]
severity = ["CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:U/C:L/I:L/A:N"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-5frw-4rwq-xhcr", "https://nvd.nist.gov/vuln/detail/CVE-2024-27932", "https://github.com/denoland/deno/commit/de23e3b60b066481cc390f459497d5bef42a899b", "https://github.com/denoland/deno", "https://github.com/denoland/deno/blob/3f4639c330a31741b0efda2f93ebbb833f4f95bc/cli/auth_tokens.rs#L89"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.0.0+0"]

[[jlsec_sources]]
id = "EUVD-2024-0827"
imported = 2026-03-27T23:16:15.864Z
modified = 2024-08-05T16:59:34.000Z
published = 2024-03-06T20:45:16.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-0827"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-0827"
[[jlsec_sources]]
id = "CVE-2024-27932"
imported = 2026-03-27T23:18:00.139Z
modified = 2025-01-03T19:19:52.197Z
published = 2024-03-21T02:52:21.953Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-27932"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-27932"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Starting in version 1.8.0 and prior to version 1.40.4, Deno improperly checks that an import specifier's hostname is equal to or a child of a token's hostname, which can cause tokens to be sent to servers they shouldn't be sent to. An auth token intended for `example[.]com` may be sent to `notexample[.]com`. Anyone who uses DENO_AUTH_TOKENS and imports potentially untrusted code is affected. Version 1.40.0 contains a patch for this issue

