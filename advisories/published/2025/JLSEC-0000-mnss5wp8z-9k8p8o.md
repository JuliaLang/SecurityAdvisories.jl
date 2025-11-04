```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5wp8z-9k8p8o"
modified = 2025-11-04T03:37:00.371Z
upstream = ["CVE-2024-47814"]
references = ["https://github.com/vim/vim/commit/51b62387be93c65fa56bbabe1c3", "https://github.com/vim/vim/security/advisories/GHSA-rj48-v4mq-j4vg", "https://lists.debian.org/debian-lts-announce/2025/03/msg00023.html", "https://security.netapp.com/advisory/ntap-20250411-0009/"]

[[affected]]
pkg = "Vim_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-47814"
imported = 2025-11-04T03:37:00.371Z
modified = 2025-11-03T21:16:30.517Z
published = 2024-10-07T22:15:03.657Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-47814"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-47814"
```

# Vim is an open source, command line text editor

Vim is an open source, command line text editor. A use-after-free was found in Vim < 9.1.0764. When closing a buffer (visible in a window) a BufWinLeave auto command can cause an use-after-free if this auto command happens to re-open the same buffer in a new split window. Impact is low since the user must have intentionally set up such a strange auto command and run some buffer unload commands. However this may lead to a crash. This issue has been addressed in version 9.1.0764 and all users are advised to upgrade. There are no known workarounds for this vulnerability.

