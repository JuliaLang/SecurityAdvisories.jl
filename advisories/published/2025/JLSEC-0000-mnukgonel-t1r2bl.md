```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgonel-t1r2bl"
modified = 2025-12-19T03:35:55.773Z
upstream = ["CVE-2024-52005"]
references = ["https://github.com/git/git/security/advisories/GHSA-7jjc-gg6m-3329", "https://lore.kernel.org/git/1M9FnZ-1taoNo1wwh-00ESSd@mail.gmx.net"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.49.0+0"]

[[jlsec_sources]]
id = "CVE-2024-52005"
imported = 2025-12-19T03:35:55.773Z
modified = 2025-12-18T16:00:17.533Z
published = 2025-01-15T18:15:24.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52005"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52005"
```

# Git is a source code management tool

Git is a source code management tool. When cloning from a server (or fetching, or pushing), informational or error messages are transported from the remote Git process to the client via the so-called "sideband channel". These messages will be prefixed with "remote:" and printed directly to the standard error output. Typically, this standard error output is connected to a terminal that understands ANSI escape sequences, which Git did not protect against. Most modern terminals support control sequences that can be used by a malicious actor to hide and misrepresent information, or to mislead the user into executing untrusted scripts. As requested on the git-security mailing list, the patches are under discussion on the public mailing list. Users are advised to update as soon as possible. Users unable to upgrade should avoid recursive clones unless they are from trusted sources.

