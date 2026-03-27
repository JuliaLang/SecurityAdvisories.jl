```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbeq4-6yma1r"
modified = 2026-03-27T22:57:50.805Z
upstream = ["EUVD-2025-33179", "GHSA-m2gf-x3f6-8hq3", "CVE-2025-61787"]
severity = ["CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-m2gf-x3f6-8hq3", "https://github.com/denoland/deno/pull/30818", "https://github.com/denoland/deno/commit/8a0990ccd37bafd8768176ca64b906ba2da2d822", "https://github.com/denoland/deno/releases/tag/v2.2.15", "https://github.com/denoland/deno/releases/tag/v2.5.3", "https://nvd.nist.gov/vuln/detail/CVE-2025-61787", "https://github.com/denoland/deno/releases/tag/v2.5.2"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2025-33179"
imported = 2026-03-27T22:57:07.807Z
modified = 2025-10-08T18:51:09.000Z
published = 2025-10-08T00:59:17.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-33179"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-33179"
[[jlsec_sources]]
id = "CVE-2025-61787"
imported = 2026-03-27T22:57:50.805Z
modified = 2025-10-16T18:14:53.107Z
published = 2025-10-08T02:15:41.897Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-61787"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-61787"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime

Deno is a JavaScript, TypeScript, and WebAssembly runtime. Versions prior to 2.5.3 and 2.2.15 are vulnerable to Command Line Injection attacks on Windows when batch files are executed. In Windows, `CreateProcess()` always implicitly spawns `cmd.exe` if a batch file (.bat, .cmd, etc.) is being executed even if the application does not specify it via the command line. This makes Deno vulnerable to a command injection attack on Windows. Versions 2.5.3 and 2.2.15 fix the issue.

