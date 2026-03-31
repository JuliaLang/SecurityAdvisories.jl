```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1i3-1el6zul"
modified = 2026-03-31T14:43:46.853Z
upstream = ["EUVD-2025-16794", "CVE-2025-24015", "GHSA-2x3r-hwv5-p32x"]
severity = ["CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:N/VI:H/VA:N/SC:N/SI:N/SA:N/E:P"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-2x3r-hwv5-p32x", "https://github.com/denoland/deno/commit/0d1beed", "https://github.com/denoland/deno/commit/4f27d7cdc02e3edfb9d36275341fb8185d6e99ed", "https://github.com/denoland/deno/commit/a4003a5292bd0affefad3ecb24a8732886900f67", "https://nvd.nist.gov/vuln/detail/CVE-2025-24015", "https://github.com/denoland/deno/commit/0d1beed2e3633d71d5e288e0382b85be361ec13d"]

[[affected]]
pkg = "Deno_jll"
ranges = [">= 2.0.0+0, < 2.2.6+0"]

[[jlsec_sources]]
id = "EUVD-2025-16794"
imported = 2026-03-31T14:42:45.361Z
modified = 2025-06-04T22:56:13.000Z
published = 2025-06-04T20:48:56.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-16794"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-16794"
[[jlsec_sources]]
id = "CVE-2025-24015"
imported = 2026-03-31T14:43:46.853Z
modified = 2025-06-09T15:11:33.737Z
published = 2025-06-03T23:15:20.633Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-24015"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-24015"
```

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Versions 1.46.0 through 2.1.6 have an issue that affects AES-256-GCM and AES-128-GCM in Deno in which the authentication tag is not being validated. This means tampered ciphertexts or incorrect keys might not be detected, which breaks the guarantees expected from AES-GCM. Older versions of Deno correctly threw errors in such cases, as does Node.js. Without authentication tag verification, AES-GCM degrades to essentially CTR mode, removing integrity protection. Authenticated data set with set_aad is also affected, as it is incorporated into the GCM hash (ghash) but this too is not validated, rendering AAD checks ineffective. Version 2.1.7 includes a patch that addresses this issue.

