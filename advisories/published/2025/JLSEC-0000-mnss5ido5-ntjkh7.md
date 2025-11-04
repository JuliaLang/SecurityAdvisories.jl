```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ido5-ntjkh7"
modified = 2025-11-04T03:25:52.181Z
upstream = ["CVE-2021-3426"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1935913", "https://lists.debian.org/debian-lts-announce/2021/04/msg00005.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/25HVHLBGO2KNPXJ3G426QEYSSCECJDU5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BF2K7HEWADHN6P52R3QLIOX27U3DJ4HI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DQYPUKLLBOZMKFPO7RD7CENTXHUUEUV7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LM5V4VPLBHBEASSAROYPSHXGXGGPHNOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6VXJZSZ6N64AILJX4CTMACYGQGHHD5C/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QNGAFMPIYIVJ47FCF2NK2PIX22HUG35B/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VPX7Y5GQDNB4FJTREWONGC4ZSVH7TGHF/", "https://security.gentoo.org/glsa/202104-04", "https://security.netapp.com/advisory/ntap-20210629-0003/", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1935913", "https://lists.debian.org/debian-lts-announce/2021/04/msg00005.html", "https://lists.debian.org/debian-lts-announce/2023/06/msg00039.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/25HVHLBGO2KNPXJ3G426QEYSSCECJDU5/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/BF2K7HEWADHN6P52R3QLIOX27U3DJ4HI/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/DQYPUKLLBOZMKFPO7RD7CENTXHUUEUV7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LM5V4VPLBHBEASSAROYPSHXGXGGPHNOE/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/N6VXJZSZ6N64AILJX4CTMACYGQGHHD5C/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QNGAFMPIYIVJ47FCF2NK2PIX22HUG35B/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/VPX7Y5GQDNB4FJTREWONGC4ZSVH7TGHF/", "https://security.gentoo.org/glsa/202104-04", "https://security.netapp.com/advisory/ntap-20210629-0003/", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.8.8+0"]

[[jlsec_sources]]
id = "CVE-2021-3426"
imported = 2025-11-04T03:25:52.181Z
modified = 2025-11-03T22:15:50.480Z
published = 2021-05-20T13:15:07.753Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3426"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3426"
```

# There's a flaw in Python 3's pydoc

There's a flaw in Python 3's pydoc. A local or adjacent attacker who discovers or is able to convince another local or adjacent user to start a pydoc server could access the server and use it to disclose sensitive information belonging to the other user that they would not normally be able to access. The highest risk of this flaw is to data confidentiality. This flaw affects Python versions before 3.8.9, Python versions before 3.9.3 and Python versions before 3.10.0a7.

