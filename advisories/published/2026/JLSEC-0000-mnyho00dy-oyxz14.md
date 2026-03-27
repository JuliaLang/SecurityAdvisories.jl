```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyho00dy-oyxz14"
modified = 2026-03-27T23:16:52.684Z
upstream = ["EUVD-2025-33180", "GHSA-qq26-84mh-26j9", "CVE-2025-61786"]
severity = ["CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-qq26-84mh-26j9", "https://github.com/denoland/deno/pull/30876", "https://github.com/denoland/deno/commit/1ab2268c0bcbf9b0468e0e36963f77f8c31c73ec", "https://github.com/denoland/deno/releases/tag/v2.2.15", "https://github.com/denoland/deno/releases/tag/v2.5.3", "https://nvd.nist.gov/vuln/detail/CVE-2025-61786"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2025-33180"
imported = 2026-03-27T23:16:15.864Z
modified = 2025-10-08T18:54:33.000Z
published = 2025-10-08T00:49:42.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-33180"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-33180"
[[jlsec_sources]]
id = "CVE-2025-61786"
imported = 2026-03-27T23:16:52.684Z
modified = 2025-10-16T18:13:38.117Z
published = 2025-10-08T01:15:33.010Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-61786"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-61786"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime

Deno is a JavaScript, TypeScript, and WebAssembly runtime. In versions prior to 2.5.3 and 2.2.15, `Deno.FsFile.prototype.stat` and `Deno.FsFile.prototype.statSync` are not limited by the permission model check `--deny-read=./`. It's possible to retrieve stats from files that the user do not have explicit read access to (the script is executed with `--deny-read=./`). Similar APIs like `Deno.stat` and `Deno.statSync` require `allow-read` permission, however, when a file is opened, even with file-write only flags and deny-read permission, it's still possible to retrieve file stats, and thus bypass the permission model. Versions 2.5.3 and 2.2.15 fix the issue.

