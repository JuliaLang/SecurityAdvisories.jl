```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvbm2jfi-14zekad"
modified = 2026-01-07T03:36:28.638Z
upstream = ["CVE-2024-32020"]
references = ["http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/commit/1204e1a824c34071019fe106348eaa6d88f9528d", "https://github.com/git/git/commit/9e65df5eab274bf74c7b570107aacd1303a1e703", "https://github.com/git/git/security/advisories/GHSA-5rfh-556j-fhgj", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/", "http://www.openwall.com/lists/oss-security/2024/05/14/2", "https://github.com/git/git/commit/1204e1a824c34071019fe106348eaa6d88f9528d", "https://github.com/git/git/commit/9e65df5eab274bf74c7b570107aacd1303a1e703", "https://github.com/git/git/security/advisories/GHSA-5rfh-556j-fhgj", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/S4CK4IYTXEOBZTEM5K3T6LWOIZ3S44AR/"]

[[affected]]
pkg = "Git_jll"
ranges = ["< 2.46.2+0"]

[[jlsec_sources]]
id = "CVE-2024-32020"
imported = 2026-01-07T03:36:28.638Z
modified = 2026-01-06T17:01:55.127Z
published = 2024-05-14T19:15:12.240Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-32020"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-32020"
```

# Git is a revision control system

Git is a revision control system. Prior to versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4, local clones may end up hardlinking files into the target repository's object database when source and target repository reside on the same disk. If the source repository is owned by a different user, then those hardlinked files may be rewritten at any point in time by the untrusted user. Cloning local repositories will cause Git to either copy or hardlink files of the source repository into the target repository. This significantly speeds up such local clones compared to doing a "proper" clone and saves both disk space and compute time. When cloning a repository located on the same disk that is owned by a different user than the current user we also end up creating such hardlinks. These files will continue to be owned and controlled by the potentially-untrusted user and can be rewritten by them at will in the future. The problem has been patched in versions 2.45.1, 2.44.1, 2.43.4, 2.42.2, 2.41.1, 2.40.2, and 2.39.4.

