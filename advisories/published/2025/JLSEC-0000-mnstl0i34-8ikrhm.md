```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0i34-8ikrhm"
modified = 2025-11-05T03:27:38.128Z
upstream = ["CVE-2022-39176"]
references = ["https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968", "https://lists.debian.org/debian-lts-announce/2022/10/msg00026.html", "https://security.netapp.com/advisory/ntap-20221020-0002/", "https://ubuntu.com/security/notices/USN-5481-1", "https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968", "https://lists.debian.org/debian-lts-announce/2022/10/msg00026.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00022.html", "https://security.netapp.com/advisory/ntap-20221020-0002/", "https://ubuntu.com/security/notices/USN-5481-1"]

[[affected]]
pkg = "BlueZ_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-39176"
imported = 2025-11-05T03:27:38.128Z
modified = 2025-11-04T16:15:51.260Z
published = 2022-09-02T04:15:11.427Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-39176"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-39176"
```

# BlueZ before 5.59 allows physically proximate attackers to obtain sensitive information because prof...

BlueZ before 5.59 allows physically proximate attackers to obtain sensitive information because profiles/audio/avrcp.c does not validate params_len.

