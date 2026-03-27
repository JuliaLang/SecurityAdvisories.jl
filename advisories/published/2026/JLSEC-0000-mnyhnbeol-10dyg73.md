```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbeol-10dyg73"
modified = 2026-03-27T22:58:03.087Z
upstream = ["EUVD-2025-16912", "GHSA-xqxc-x6p3-w683", "CVE-2025-48888"]
severity = ["CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:N/VI:L/VA:N/SC:N/SI:N/SA:N/E:P"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-xqxc-x6p3-w683", "https://github.com/denoland/deno/pull/22894", "https://github.com/denoland/deno/pull/29213", "https://github.com/denoland/deno/commit/2f0fae9d9071dcaf0a689bc7097584b1b9ebc8db", "https://github.com/denoland/deno/commit/9d665572d3cd39f997e29e6daac7c1102fc5c04f", "https://github.com/denoland/deno/commit/ef315b56c26c9ef5f25284a5100d2ed525a148cf", "https://nvd.nist.gov/vuln/detail/CVE-2025-48888"]

[[affected]]
pkg = "Deno_jll"
ranges = [">= 2.0.0+0, < 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2025-16912"
imported = 2026-03-27T22:57:07.807Z
modified = 2025-06-04T22:56:55.000Z
published = 2025-06-04T21:13:44.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-16912"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-16912"
[[jlsec_sources]]
id = "CVE-2025-48888"
imported = 2026-03-27T22:58:03.087Z
modified = 2025-07-02T14:05:20.353Z
published = 2025-06-04T20:15:23.977Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48888"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48888"
```

# Deno run with --allow-read and --deny-read flags results in allowed

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Starting in version 1.41.3 and prior to versions 2.1.13, 2.2.13, and 2.3.2, `deno run --allow-read --deny-read main.ts` results in allowed, even though 'deny' should be stronger. The result is the same with all global unary permissions given as `--allow-* --deny-*`. This only affects a nonsensical combination of flags, so there shouldn't be a real impact on the userbase. Users may upgrade to version 2.1.13, 2.2.13, or 2.3.2 to receive a patch.

