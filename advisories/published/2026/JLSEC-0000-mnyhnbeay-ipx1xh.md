```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnbeay-ipx1xh"
modified = 2026-03-27T22:58:58.253Z
upstream = ["EUVD-2021-2134", "GHSA-xpwj-7v8q-mcgj", "CVE-2021-32619"]
severity = ["CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H"]
references = ["https://github.com/denoland/deno/security/advisories/GHSA-xpwj-7v8q-mcgj", "https://nvd.nist.gov/vuln/detail/CVE-2021-32619", "https://github.com/denoland/deno", "https://security.archlinux.org/CVE-2021-32619"]

[[affected]]
pkg = "Deno_jll"
ranges = ["< 1.10.2+0"]

[[jlsec_sources]]
id = "EUVD-2021-2134"
imported = 2026-03-27T22:57:07.807Z
modified = 2024-08-03T23:25:30.000Z
published = 2021-05-28T21:00:12.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2021-2134"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2021-2134"
[[jlsec_sources]]
id = "CVE-2021-32619"
imported = 2026-03-27T22:58:58.253Z
modified = 2024-11-21T06:07:23.627Z
published = 2021-05-28T21:15:08.893Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-32619"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-32619"
```

# Deno is a runtime for JavaScript and TypeScript that uses V8 and is built in Rust

Deno is a runtime for JavaScript and TypeScript that uses V8 and is built in Rust. In Deno versions 1.5.0 to 1.10.1, modules that are dynamically imported through `import()` or `new Worker` might have been able to bypass network and file system permission checks when statically importing other modules. The vulnerability has been patched in Deno release 1.10.2.

