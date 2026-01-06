```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnva6oafn-3t80jm"
modified = 2026-01-06T03:37:43.379Z
upstream = ["CVE-2024-32021"]
references = ["http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/security/advisories/GHSA-mvxm-9j2h-qjx7", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/security/advisories/GHSA-mvxm-9j2h-qjx7", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00009.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.46.2+0"]

[[jlsec_sources]]
id = "CVE-2024-32021"
imported = 2026-01-06T03:37:43.359Z
modified = 2026-01-05T19:19:09.820Z
published = 2024-05-14T20:15:13.630Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-32021"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-32021"
```

# Git is a revision control system

Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4, when cloning a local source repository that contains symlinks via the filesystem, Git may create hardlinks to arbitrary user-readable files on the same filesystem as the target repository in the `objects/` directory. Cloning a local repository over the filesystem may creating hardlinks to arbitrary user-owned files on the same filesystem in the target Git repository's `objects/` directory. When cloning a repository over the filesystem (without explicitly specifying the `file://` protocol or `--no-local`), the optimizations for local cloning
will be used, which include attempting to hard link the object files instead of copying them. While the code includes checks against symbolic links in the source repository, which were added during the fix for CVE-2022-39253, these checks can still be raced because the hard link operation ultimately follows symlinks. If the object on the filesystem appears as a file during the check, and then a symlink during the operation, this will allow the adversary to bypass the check and create hardlinks in the destination objects directory to arbitrary, user-readable files. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4.

