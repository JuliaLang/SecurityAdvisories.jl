```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns8z6unj-rei27n"
modified = 2025-10-21T17:21:19.279Z
upstream = ["CVE-2018-7738"]
references = ["http://www.securityfocus.com/bid/103367", "https://bugs.debian.org/892179", "https://github.com/karelzak/util-linux/commit/75f03badd7ed9f1dd951863d75e756883d3acc55", "https://github.com/karelzak/util-linux/issues/539", "https://usn.ubuntu.com/4512-1/", "https://www.debian.org/security/2018/dsa-4134", "http://www.securityfocus.com/bid/103367", "https://bugs.debian.org/892179", "https://github.com/karelzak/util-linux/commit/75f03badd7ed9f1dd951863d75e756883d3acc55", "https://github.com/karelzak/util-linux/issues/539", "https://security.netapp.com/advisory/ntap-20241213-0002/", "https://usn.ubuntu.com/4512-1/", "https://www.debian.org/security/2018/dsa-4134"]

[[affected]]
pkg = "util_linux_jll"
ranges = ["< 2.39.3+0"]

[[jlsec_sources]]
id = "CVE-2018-7738"
imported = 2025-10-21T17:21:19.279Z
modified = 2024-12-13T14:15:19.380Z
published = 2018-03-07T02:29:03.533Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-7738"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-7738"
```

# In util-linux before 2.32-rc1, bash-completion/umount allows local users to gain privileges by embed...

In util-linux before 2.32-rc1, bash-completion/umount allows local users to gain privileges by embedding shell commands in a mountpoint name, which is mishandled during a umount command (within Bash) by a different user, as demonstrated by logging in as root and entering umount followed by a tab character for autocompletion.

