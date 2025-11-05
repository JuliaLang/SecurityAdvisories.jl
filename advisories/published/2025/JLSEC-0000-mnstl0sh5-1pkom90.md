```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0sh5-1pkom90"
modified = 2025-11-05T03:27:51.593Z
upstream = ["CVE-2023-29491"]
references = ["http://ncurses.scripts.mit.edu/?p=ncurses.git%3Ba=commit%3Bh=eb51b1ea1f75a0ec17c9c5937cb28df1e8eeec56", "http://www.openwall.com/lists/oss-security/2023/04/19/10", "http://www.openwall.com/lists/oss-security/2023/04/19/11", "https://lists.debian.org/debian-lts-announce/2023/12/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LU4MYMKFEZQ5VSCVLRIZGDQOUW3T44GT/", "https://security.netapp.com/advisory/ntap-20230517-0009/", "https://support.apple.com/kb/HT213843", "https://support.apple.com/kb/HT213844", "https://support.apple.com/kb/HT213845", "https://www.openwall.com/lists/oss-security/2023/04/12/5", "https://www.openwall.com/lists/oss-security/2023/04/13/4", "http://ncurses.scripts.mit.edu/?p=ncurses.git%3Ba=commit%3Bh=eb51b1ea1f75a0ec17c9c5937cb28df1e8eeec56", "http://www.openwall.com/lists/oss-security/2023/04/19/10", "http://www.openwall.com/lists/oss-security/2023/04/19/11", "https://lists.debian.org/debian-lts-announce/2023/12/msg00004.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LU4MYMKFEZQ5VSCVLRIZGDQOUW3T44GT/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LU4MYMKFEZQ5VSCVLRIZGDQOUW3T44GT/", "https://security.netapp.com/advisory/ntap-20230517-0009/", "https://support.apple.com/kb/HT213843", "https://support.apple.com/kb/HT213844", "https://support.apple.com/kb/HT213845", "https://www.openwall.com/lists/oss-security/2023/04/12/5", "https://www.openwall.com/lists/oss-security/2023/04/13/4"]

[[affected]]
pkg = "Ncurses_jll"
ranges = ["< 6.4.0+0"]

[[jlsec_sources]]
id = "CVE-2023-29491"
imported = 2025-11-05T03:27:51.593Z
modified = 2025-11-04T19:15:42.307Z
published = 2023-04-14T01:15:08.570Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-29491"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-29491"
```

# ncurses before 6.4 20230408, when used by a setuid application, allows local users to trigger securi...

ncurses before 6.4 20230408, when used by a setuid application, allows local users to trigger security-relevant memory corruption via malformed data in a terminfo database file that is found in $HOME/.terminfo or reached via the TERMINFO or TERM environment variable.

