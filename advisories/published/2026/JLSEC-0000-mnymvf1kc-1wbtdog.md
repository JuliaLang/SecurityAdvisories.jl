```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1kc-1wbtdog"
modified = 2026-03-31T14:43:34.443Z
upstream = ["EUVD-2025-16913", "CVE-2025-48934", "GHSA-7w8p-chxq-2789"]
severity = ["CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:L/VI:L/VA:N/SC:N/SI:N/SA:N/E:P"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-7w8p-chxq-2789", "https://github.com/denoland/deno/pull/29079", "https://github.com/denoland/deno/commit/2959e083912420988066a001c2b2d6732a1b562f", "https://github.com/denoland/deno/commit/946ccda1aa19a00c478a5e6826b75053b050d753", "https://docs.deno.com/api/deno/~/Deno.Env.toObject", "https://docs.deno.com/runtime/fundamentals/security/#environment-variables", "https://nvd.nist.gov/vuln/detail/CVE-2025-48934"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2025-16913"
imported = 2026-03-31T14:42:45.361Z
modified = 2025-06-04T22:57:03.000Z
published = 2025-06-04T21:18:18.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-16913"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-16913"
[[jlsec_sources]]
id = "CVE-2025-48934"
imported = 2026-03-31T14:43:34.443Z
modified = 2025-07-02T13:43:10.557Z
published = 2025-06-04T20:15:24.163Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48934"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48934"
```

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Prior to versions 2.1.13 and 2.2.13, the `Deno.env.toObject` method ignores any variables listed in the `--deny-env` option of the `deno run` command. When looking at the documentation of the `--deny-env` option this might lead to a false impression that variables listed in the option are impossible to read. Software relying on the combination of both flags to allow access to most environment variables except a few sensitive ones will be vulnerable to malicious code trying to steal secrets using the `Deno.env.toObject()` method. Versions 2.1.13 and 2.2.13 contains a patch.

