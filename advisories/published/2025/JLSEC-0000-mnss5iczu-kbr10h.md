```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5iczu-kbr10h"
modified = 2025-11-04T03:25:51.306Z
upstream = ["CVE-2021-29338"]
references = ["https://github.com/uclouvain/openjpeg/issues/1338", "https://lists.debian.org/debian-lts-announce/2022/04/msg00006.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZ54FGM2IGAP4AWSJ22JKHOPHCR3FGYU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QB6AI7CWXWMEDZIQY4LQ6DMIEXMDOHUP/", "https://security.gentoo.org/glsa/202209-04", "https://github.com/uclouvain/openjpeg/issues/1338", "https://lists.debian.org/debian-lts-announce/2022/04/msg00006.html", "https://lists.debian.org/debian-lts-announce/2025/04/msg00002.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZ54FGM2IGAP4AWSJ22JKHOPHCR3FGYU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QB6AI7CWXWMEDZIQY4LQ6DMIEXMDOHUP/", "https://security.gentoo.org/glsa/202209-04"]

[[affected]]
pkg = "OpenJpeg_jll"
ranges = [">= 2.4.0+0, < 2.5.0+0"]

[[jlsec_sources]]
id = "CVE-2021-29338"
imported = 2025-11-04T03:25:51.306Z
modified = 2025-11-03T20:15:46.223Z
published = 2021-04-14T14:15:14.133Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-29338"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-29338"
```

# Integer Overflow in OpenJPEG v2.4.0 allows remote attackers to crash the application, causing a Deni...

Integer Overflow in OpenJPEG v2.4.0 allows remote attackers to crash the application, causing a Denial of Service (DoS). This occurs when the attacker uses the command line option "-ImgDir" on a directory that contains 1048576 files.

