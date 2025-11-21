```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5imam-zsv4oi"
modified = 2025-11-04T03:26:03.358Z
upstream = ["CVE-2022-0391"]
references = ["https://bugs.python.org/issue43882", "https://lists.debian.org/debian-lts-announce/2023/09/msg00022.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CSD2YBXP3ZF44E44QMIIAR5VTO35KTRB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UDBDBAU6HUPZHISBOARTXZ5GKHF2VH5U/", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20220225-0009/", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://bugs.python.org/issue43882", "https://lists.debian.org/debian-lts-announce/2023/09/msg00022.html", "https://lists.debian.org/debian-lts-announce/2024/11/msg00024.html", "https://lists.debian.org/debian-lts-announce/2025/03/msg00013.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/CSD2YBXP3ZF44E44QMIIAR5VTO35KTRB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UDBDBAU6HUPZHISBOARTXZ5GKHF2VH5U/", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20220225-0009/", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]

[[jlsec_sources]]
id = "CVE-2022-0391"
imported = 2025-11-04T03:26:03.358Z
modified = 2025-11-03T22:15:54.307Z
published = 2022-02-09T23:15:16.580Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0391"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0391"
```

# A flaw was found in Python, specifically within the urllib.parse module

A flaw was found in Python, specifically within the urllib.parse module. This module helps break Uniform Resource Locator (URL) strings into components. The issue involves how the urlparse method does not sanitize input and allows characters like '\r' and '\n' in the URL path. This flaw allows an attacker to input a crafted URL, leading to injection attacks. This flaw affects Python versions prior to 3.10.0b1, 3.9.5, 3.8.11, 3.7.11 and 3.6.14.

