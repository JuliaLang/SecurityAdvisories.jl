```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvbm2jfc-t7l03b"
modified = 2026-01-07T03:36:28.632Z
upstream = ["CVE-2024-32004"]
references = ["http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git-clone", "https://github.com/git/git/commit/f4aa8c8bb11dae6e769cd930565173808cbb69c8", "https://github.com/git/git/security/advisories/GHSA-xfc6-vwr8-r389", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git-clone", "https://github.com/git/git/commit/f4aa8c8bb11dae6e769cd930565173808cbb69c8", "https://github.com/git/git/security/advisories/GHSA-xfc6-vwr8-r389", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00009.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.46.2+0"]

[[jlsec_sources]]
id = "CVE-2024-32004"
imported = 2026-01-07T03:36:28.614Z
modified = 2026-01-06T17:09:23.710Z
published = 2024-05-14T19:15:11.377Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-32004"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-32004"
```

# Git is a revision control system

Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4, an attacker can prepare a local repository in such a way that, when cloned, will execute arbitrary code during the operation. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4. As a workaround, avoid cloning repositories from untrusted sources.

