```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ioae-atwpy8"
modified = 2025-11-04T03:26:05.942Z
upstream = ["CVE-2021-3733"]
references = ["https://bugs.python.org/issue43075", "https://bugzilla.redhat.com/show_bug.cgi?id=1995234", "https://github.com/python/cpython/commit/7215d1ae25525c92b026166f9d5cac85fb", "https://github.com/python/cpython/pull/24391", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://security.netapp.com/advisory/ntap-20220407-0001/", "https://ubuntu.com/security/CVE-2021-3733", "https://bugs.python.org/issue43075", "https://bugzilla.redhat.com/show_bug.cgi?id=1995234", "https://github.com/python/cpython/commit/7215d1ae25525c92b026166f9d5cac85fb", "https://github.com/python/cpython/pull/24391", "https://lists.debian.org/debian-lts-announce/2023/05/msg00024.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://security.netapp.com/advisory/ntap-20220407-0001/", "https://ubuntu.com/security/CVE-2021-3733"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]

[[jlsec_sources]]
id = "CVE-2021-3733"
imported = 2025-11-04T03:26:05.942Z
modified = 2025-11-03T22:15:50.833Z
published = 2022-03-10T17:42:59.623Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3733"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3733"
```

# There's a flaw in urllib's AbstractBasicAuthHandler class

There's a flaw in urllib's AbstractBasicAuthHandler class. An attacker who controls a malicious HTTP server that an HTTP client (such as web browser) connects to, could trigger a Regular Expression Denial of Service (ReDOS) during an authentication request with a specially crafted payload that is sent by the server to the client. The greatest threat that this flaw poses is to application availability.

