```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyho00dj-1oh05j7"
modified = 2026-03-27T23:16:46.610Z
upstream = ["EUVD-2025-31878", "CVE-2025-61785", "GHSA-vg2r-rmgp-cgqj"]
severity = ["CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-vg2r-rmgp-cgqj", "https://github.com/denoland/deno/pull/30872", "https://github.com/denoland/deno/commit/992e998dfe436cdc9325232759af8be92f11739b", "https://github.com/denoland/deno", "https://github.com/denoland/deno/releases/tag/v2.2.15", "https://github.com/denoland/deno/releases/tag/v2.5.3", "https://nvd.nist.gov/vuln/detail/CVE-2025-61785"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.6.3+0"]

[[jlsec_sources]]
id = "EUVD-2025-31878"
imported = 2026-03-27T23:16:15.864Z
modified = 2025-10-13T15:17:42.000Z
published = 2025-10-07T22:36:36.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-31878"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-31878"
[[jlsec_sources]]
id = "CVE-2025-61785"
imported = 2026-03-27T23:16:46.610Z
modified = 2025-10-16T18:12:40.397Z
published = 2025-10-08T01:15:32.847Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-61785"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-61785"
```

# Deno's --deny-write check does not prevent permission bypass

Deno is a JavaScript, TypeScript, and WebAssembly runtime. In versions prior to 2.5.3 and 2.2.15, `Deno.FsFile.prototype.utime` and `Deno.FsFile.prototype.utimeSync` are not limited by the permission model check `--deny-write=./`. It's possible to change to change the access (`atime`) and modification (`mtime`) times on the file stream resource even when the file is opened with `read` only permission (and `write`: `false`) and file write operations are not allowed (the script is executed with `--deny-write=./`). Similar APIs like `Deno.utime` and `Deno.utimeSync` require `allow-write` permission, however, when a file is opened, even with read only flags and deny-write permission, it's still possible to change the access (`atime`) and modification (`mtime`) times, and thus bypass the permission model. Versions 2.5.3 and 2.2.15 fix the issue.

