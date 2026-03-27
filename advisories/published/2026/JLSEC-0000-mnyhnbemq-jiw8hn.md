```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbemq-jiw8hn"
modified = 2026-03-27T22:59:35.010Z
upstream = ["EUVD-2024-1344", "CVE-2024-34346", "GHSA-23rx-c3g5-hv9w"]
severity = ["CVSS:3.1/AV:A/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-23rx-c3g5-hv9w", "https://nvd.nist.gov/vuln/detail/CVE-2024-34346", "https://github.com/denoland/deno"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 2.0.0+0"]

[[jlsec_sources]]
id = "EUVD-2024-1344"
imported = 2026-03-27T22:57:07.807Z
modified = 2024-08-02T02:51:11.000Z
published = 2024-05-07T21:02:16.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-1344"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-1344"
[[jlsec_sources]]
id = "CVE-2024-34346"
imported = 2026-03-27T22:59:35.010Z
modified = 2025-09-04T19:23:06.737Z
published = 2024-05-07T21:15:09.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-34346"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-34346"
```

# Deno is a JavaScript, TypeScript, and WebAssembly runtime with secure defaults

Deno is a JavaScript, TypeScript, and WebAssembly runtime with secure defaults. The Deno sandbox may be unexpectedly weakened by allowing file read/write access to privileged files in various locations on Unix and Windows platforms. For example, reading `/proc/self/environ` may provide access equivalent to `--allow-env`, and writing `/proc/self/mem` may provide access equivalent to `--allow-all`. Users who grant read and write access to the entire filesystem may not realize that these access to these files may have additional, unintended consequences. The documentation did not reflect that this practice should be undertaken to increase the strength of the security sandbox. Users who run code with `--allow-read` or `--allow-write` may unexpectedly end up granting additional permissions via file-system operations. Deno 1.43 and above require explicit `--allow-all` access to read or write `/etc`, `/dev` on unix platform (as well as `/proc` and `/sys` on linux platforms), and any path starting with `\\` on Windows.

