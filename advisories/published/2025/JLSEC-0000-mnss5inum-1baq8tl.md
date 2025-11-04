```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5inum-1baq8tl"
modified = 2025-11-04T03:26:05.374Z
upstream = ["CVE-2021-3737"]
references = ["https://bugs.python.org/issue44022", "https://bugzilla.redhat.com/show_bug.cgi?id=1995162", "https://github.com/python/cpython/pull/25916", "https://github.com/python/cpython/pull/26503", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://python-security.readthedocs.io/vuln/urllib-100-continue-loop.html", "https://security.netapp.com/advisory/ntap-20220407-0009/", "https://ubuntu.com/security/CVE-2021-3737", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://bugs.python.org/issue44022", "https://bugzilla.redhat.com/show_bug.cgi?id=1995162", "https://github.com/python/cpython/pull/25916", "https://github.com/python/cpython/pull/26503", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://lists.debian.org/debian-lts-announce/2024/11/msg00024.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://python-security.readthedocs.io/vuln/urllib-100-continue-loop.html", "https://security.netapp.com/advisory/ntap-20220407-0009/", "https://ubuntu.com/security/CVE-2021-3737", "https://www.oracle.com/security-alerts/cpujul2022.html"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]

[[jlsec_sources]]
id = "CVE-2021-3737"
imported = 2025-11-04T03:26:05.374Z
modified = 2025-11-03T22:15:51.000Z
published = 2022-03-04T19:15:08.730Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3737"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3737"
```

# A flaw was found in python

A flaw was found in python. An improperly handled HTTP response in the HTTP client code of python may allow a remote attacker, who controls the HTTP server, to make the client script enter an infinite loop, consuming CPU time. The highest threat from this vulnerability is to system availability.

