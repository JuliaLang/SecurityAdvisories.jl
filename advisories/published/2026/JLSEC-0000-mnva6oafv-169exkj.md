```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnva6oafv-169exkj"
modified = 2026-01-06T03:37:43.387Z
upstream = ["CVE-2024-32465"]
references = ["http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git#_security", "https://git-scm.com/docs/git-clone", "https://github.com/git/git/commit/7b70e9efb18c2cc3f219af399bd384c5801ba1d7", "https://github.com/git/git/security/advisories/GHSA-vm9j-46j9-qvq4", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://git-scm.com/docs/git#_security", "https://git-scm.com/docs/git-clone", "https://github.com/git/git/commit/7b70e9efb18c2cc3f219af399bd384c5801ba1d7", "https://github.com/git/git/security/advisories/GHSA-vm9j-46j9-qvq4", "https://lists.debian.org/debian-lts-announce/2024/06/msg00018.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00009.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.46.2+0"]

[[jlsec_sources]]
id = "CVE-2024-32465"
imported = 2026-01-06T03:37:43.387Z
modified = 2026-01-05T19:15:50.573Z
published = 2024-05-14T20:15:14.540Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-32465"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-32465"
```

# Git is a revision control system

Git is a revision control system. The Git project recommends to avoid working in untrusted repositories, and instead to clone it first with `git clone --no-local` to obtain a clean copy. Git has specific protections to make that a safe operation even with an untrusted source repository, but vulnerabilities allow those protections to be bypassed. In the context of cloning local repositories owned by other users, this vulnerability has been covered in CVE-2024-32004. But there are circumstances where the fixes for CVE-2024-32004 are not enough: For example, when obtaining a `.zip` file containing a full copy of a Git repository, it should not be trusted by default to be safe, as e.g. hooks could be configured to run within the context of that repository. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4. As a workaround, avoid using Git in repositories that have been obtained via archives from untrusted sources.

