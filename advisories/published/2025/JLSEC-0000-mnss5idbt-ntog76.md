```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5idbt-ntog76"
modified = 2025-11-04T03:25:51.737Z
upstream = ["CVE-2021-29921"]
references = ["https://bugs.python.org/issue36384", "https://docs.python.org/3/library/ipaddress.html", "https://github.com/python/cpython/blob/63298930fb531ba2bb4f23bc3b915dbf1e17e9e1/Misc/NEWS.d/3.8.0a4.rst", "https://github.com/python/cpython/pull/12577", "https://github.com/python/cpython/pull/25099", "https://github.com/sickcodes", "https://github.com/sickcodes/security/blob/master/advisories/SICK-2021-014.md", "https://python-security.readthedocs.io/vuln/ipaddress-ipv4-leading-zeros.html", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20210622-0003/", "https://sick.codes/sick-2021-014", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html", "https://bugs.python.org/issue36384", "https://docs.python.org/3/library/ipaddress.html", "https://github.com/python/cpython/blob/63298930fb531ba2bb4f23bc3b915dbf1e17e9e1/Misc/NEWS.d/3.8.0a4.rst", "https://github.com/python/cpython/pull/12577", "https://github.com/python/cpython/pull/25099", "https://github.com/sickcodes", "https://github.com/sickcodes/security/blob/master/advisories/SICK-2021-014.md", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://python-security.readthedocs.io/vuln/ipaddress-ipv4-leading-zeros.html", "https://security.gentoo.org/glsa/202305-02", "https://security.netapp.com/advisory/ntap-20210622-0003/", "https://sick.codes/sick-2021-014", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://www.oracle.com/security-alerts/cpujan2022.html", "https://www.oracle.com/security-alerts/cpujul2022.html", "https://www.oracle.com/security-alerts/cpuoct2021.html"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.7+0"]

[[jlsec_sources]]
id = "CVE-2021-29921"
imported = 2025-11-04T03:25:51.737Z
modified = 2025-11-03T22:15:48.057Z
published = 2021-05-06T13:15:12.573Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-29921"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-29921"
```

# In Python before 3,9,5, the ipaddress library mishandles leading zero characters in the octets of an...

In Python before 3,9,5, the ipaddress library mishandles leading zero characters in the octets of an IP address string. This (in some situations) allows attackers to bypass access control that is based on IP addresses.

