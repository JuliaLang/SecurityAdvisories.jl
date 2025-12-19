```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnukgonea-sghzks"
modified = 2025-12-19T03:35:55.762Z
upstream = ["CVE-2024-50349"]
references = ["https://github.com/git/git/commit/7725b8100ffbbff2750ee4d61a0fcc1f53a086e8", "https://github.com/git/git/commit/c903985bf7e772e2d08275c1a95c8a55ab011577", "https://github.com/git/git/security/advisories/GHSA-hmg8-h7qf-7cxr", "https://lists.debian.org/debian-lts-announce/2025/01/msg00025.html"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.44.0+0", ">= 2.47.1+0, < 2.49.0+0"]

[[jlsec_sources]]
id = "CVE-2024-50349"
imported = 2025-12-19T03:35:55.762Z
modified = 2025-12-18T16:42:54.610Z
published = 2025-01-14T19:15:32.157Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-50349"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-50349"
```

# Git is a fast, scalable, distributed revision control system with an unusually rich command set that...

Git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals. When Git asks for credentials via a terminal prompt (i.e. without using any credential helper), it prints out the host name for which the user is expected to provide a username and/or a password. At this stage, any URL-encoded parts have been decoded already, and are printed verbatim. This allows attackers to craft URLs that contain ANSI escape sequences that the terminal interpret to confuse users e.g. into providing passwords for trusted Git hosting sites when in fact they are then sent to untrusted sites that are under the attacker's control. This issue has been patch via commits `7725b81` and `c903985` which are included in release versions v2.48.1, v2.47.2, v2.46.3, v2.45.3, v2.44.3, v2.43.6, v2.42.4, v2.41.3, and v2.40.4. Users are advised to upgrade. Users unable to upgrade should avoid cloning from untrusted URLs, especially recursive clones.

