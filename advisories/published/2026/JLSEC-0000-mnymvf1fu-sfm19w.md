```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnymvf1fu-sfm19w"
modified = 2026-03-31T14:45:31.731Z
upstream = ["EUVD-2024-0943", "GHSA-hrqr-jv8w-v9jh", "CVE-2024-27931"]
severity = ["CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:N/I:L/A:N"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-hrqr-jv8w-v9jh", "https://nvd.nist.gov/vuln/detail/CVE-2024-27931", "https://github.com/denoland/deno"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.0.0+0"]

[[jlsec_sources]]
id = "EUVD-2024-0943"
imported = 2026-03-31T14:42:45.362Z
modified = 2024-08-02T00:41:55.000Z
published = 2024-03-05T16:43:11.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-0943"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-0943"
[[jlsec_sources]]
id = "CVE-2024-27931"
imported = 2026-03-31T14:45:31.731Z
modified = 2025-01-03T19:29:35.223Z
published = 2024-03-05T17:15:07.310Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-27931"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-27931"
```

Deno is a JavaScript, TypeScript, and WebAssembly runtime with secure defaults. Insufficient validation of parameters in `Deno.makeTemp*` APIs would allow for creation of files outside of the allowed directories. This may allow the user to overwrite important files on the system that may affect other systems. A user may provide a prefix or suffix to a `Deno.makeTemp*` API containing path traversal characters. This is fixed in Deno 1.41.1.

