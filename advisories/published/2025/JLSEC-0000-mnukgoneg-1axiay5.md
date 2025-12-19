```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgoneg-1axiay5"
modified = 2025-12-19T03:35:55.768Z
upstream = ["CVE-2024-52006"]
references = ["https://github.com/git-ecosystem/git-credential-manager/security/advisories/GHSA-86c2-4x57-wc8g", "https://github.com/git/git/commit/b01b9b81d36759cdcd07305e78765199e1bc2060", "https://github.com/git/git/security/advisories/GHSA-qm7j-c969-7j4q", "https://github.com/git/git/security/advisories/GHSA-r5ph-xg7q-xfrp", "https://lists.debian.org/debian-lts-announce/2025/01/msg00025.html"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.44.0+0", ">= 2.47.1+0, < 2.49.0+0"]

[[jlsec_sources]]
id = "CVE-2024-52006"
imported = 2025-12-19T03:35:55.768Z
modified = 2025-12-18T16:10:34.287Z
published = 2025-01-14T19:15:32.330Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52006"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52006"
```

# Git is a fast, scalable, distributed revision control system with an unusually rich command set that...

Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals. Git defines a line-based protocol that is used to exchange information between Git and Git credential helpers. Some ecosystems (most notably, .NET and node.js) interpret single Carriage Return characters as newlines, which renders the protections against CVE-2020-5260 incomplete for credential helpers that treat Carriage Returns in this way. This issue has been addressed in commit `b01b9b8` which is included in release versions v2.48.1, v2.47.2, v2.46.3, v2.45.3, v2.44.3, v2.43.6, v2.42.4, v2.41.3, and v2.40.4. Users are advised to upgrade. Users unable to upgrade should avoid cloning from untrusted URLs, especially recursive clones.

