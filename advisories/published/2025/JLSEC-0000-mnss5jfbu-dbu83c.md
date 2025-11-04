```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jfbu-dbu83c"
modified = 2025-11-04T03:26:40.986Z
upstream = ["CVE-2023-38552"]
references = ["https://hackerone.com/reports/2094235", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/3N4NJ7FR4X4FPZUGNTQAPSTVB2HB2Y4A/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/E72T67UPDRXHIDLO3OROR25YAMN4GGW5/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/FNA62Q767CFAFHBCDKYNPBMZWB7TWYVU/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HT7T2R4MQKLIF4ODV4BDLPARWFPCJ5CZ/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LKYHSZQFDNR7RSA7LHVLLIAQMVYCUGBG/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/X6QXN4ORIVF6XBW4WWFE7VNPVC74S45Y/", "https://security.netapp.com/advisory/ntap-20231116-0013/", "https://hackerone.com/reports/2094235", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/3N4NJ7FR4X4FPZUGNTQAPSTVB2HB2Y4A/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/E72T67UPDRXHIDLO3OROR25YAMN4GGW5/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/FNA62Q767CFAFHBCDKYNPBMZWB7TWYVU/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/HT7T2R4MQKLIF4ODV4BDLPARWFPCJ5CZ/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LKYHSZQFDNR7RSA7LHVLLIAQMVYCUGBG/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/X6QXN4ORIVF6XBW4WWFE7VNPVC74S45Y/", "https://security.netapp.com/advisory/ntap-20231116-0013/", "https://security.netapp.com/advisory/ntap-20241108-0002/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 18.12.1+0"]

[[jlsec_sources]]
id = "CVE-2023-38552"
imported = 2025-11-04T03:26:40.986Z
modified = 2025-11-03T22:16:24.850Z
published = 2023-10-18T04:15:11.200Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-38552"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-38552"
```

# When the Node.js policy feature checks the integrity of a resource against a trusted manifest, the a...

When the Node.js policy feature checks the integrity of a resource against a trusted manifest, the application can intercept the operation and return a forged checksum to the node's policy implementation, thus effectively disabling the integrity check.
Impacts:
This vulnerability affects all users using the experimental policy mechanism in all active release lines: 18.x and, 20.x.
Please note that at the time this CVE was issued, the policy mechanism is an experimental feature of Node.js.

