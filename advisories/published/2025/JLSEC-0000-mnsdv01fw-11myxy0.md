```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsdv01fw-11myxy0"
modified = 2025-10-25T03:22:53.900Z
upstream = ["CVE-2025-48384"]
references = ["https://github.com/git/git/security/advisories/GHSA-vwqx-4fm8-6qc9", "https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2025-48384"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.50.1+0"]

[[jlsec_sources]]
id = "CVE-2025-48384"
imported = 2025-10-25T03:22:53.900Z
modified = 2025-10-24T13:58:30.817Z
published = 2025-07-08T19:15:42.800Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-48384"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-48384"
```

# Git is a fast, scalable, distributed revision control system with an unusually rich command set that...

Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals. When reading a config value, Git strips any trailing carriage return and line feed (CRLF). When writing a config entry, values with a trailing CR are not quoted, causing the CR to be lost when the config is later read. When initializing a submodule, if the submodule path contains a trailing CR, the altered path is read resulting in the submodule being checked out to an incorrect location. If a symlink exists that points the altered path to the submodule hooks directory, and the submodule contains an executable post-checkout hook, the script may be unintentionally executed after checkout. This vulnerability is fixed in v2.43.7, v2.44.4, v2.45.4, v2.46.4, v2.47.3, v2.48.2, v2.49.1, and v2.50.1.

