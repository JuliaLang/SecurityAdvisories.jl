```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntz107py-471fs1"
modified = 2025-12-04T03:33:51.766Z
upstream = ["CVE-2020-28196"]
references = ["https://github.com/krb5/krb5/commit/57415dda6cf04e73ffc3723be518eddfae599bfd", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.debian.org/debian-lts-announce/2020/11/msg00011.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45KKOZQWIIIW5C45PJVGQ32AXBSYNBE7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/73IGOG6CZAVMVNS4GGRMOLOZ7B6QVA7F/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KPH2V3WSQTELROZK3GFCPQDOFLKIZ6H5/", "https://security.gentoo.org/glsa/202011-17", "https://security.netapp.com/advisory/ntap-20201202-0001/", "https://security.netapp.com/advisory/ntap-20210513-0002/", "https://www.debian.org/security/2020/dsa-4795", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html", "https://github.com/krb5/krb5/commit/57415dda6cf04e73ffc3723be518eddfae599bfd", "https://lists.apache.org/thread.html/r58af02e294bd07f487e2c64ffc0a29b837db5600e33b6e698b9d696b%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.apache.org/thread.html/rf4c02775860db415b4955778a131c2795223f61cb8c6a450893651e4%40%3Cissues.bookkeeper.apache.org%3E", "https://lists.debian.org/debian-lts-announce/2020/11/msg00011.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45KKOZQWIIIW5C45PJVGQ32AXBSYNBE7/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/73IGOG6CZAVMVNS4GGRMOLOZ7B6QVA7F/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KPH2V3WSQTELROZK3GFCPQDOFLKIZ6H5/", "https://security.gentoo.org/glsa/202011-17", "https://security.netapp.com/advisory/ntap-20201202-0001/", "https://security.netapp.com/advisory/ntap-20210513-0002/", "https://www.debian.org/security/2020/dsa-4795", "https://www.oracle.com//security-alerts/cpujul2021.html", "https://www.oracle.com/security-alerts/cpuApr2021.html", "https://www.oracle.com/security-alerts/cpuapr2022.html"]

[[affected]]
pkg = "Kerberos_krb5_jll"
ranges = ["< 1.21.3+0"]

[[jlsec_sources]]
id = "CVE-2020-28196"
imported = 2025-12-04T03:33:51.766Z
modified = 2025-12-03T19:15:52.130Z
published = 2020-11-06T08:15:13.860Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-28196"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-28196"
```

# MIT Kerberos 5 (aka krb5) before 1.17.2 and 1.18.x before 1.18.3 allows unbounded recursion via an A...

MIT Kerberos 5 (aka krb5) before 1.17.2 and 1.18.x before 1.18.3 allows unbounded recursion via an ASN.1-encoded Kerberos message because the lib/krb5/asn.1/asn1_encode.c support for BER indefinite lengths lacks a recursion limit.

