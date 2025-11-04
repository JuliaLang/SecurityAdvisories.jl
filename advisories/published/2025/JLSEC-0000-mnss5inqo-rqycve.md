```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5inqo-rqycve"
modified = 2025-11-04T03:26:05.232Z
upstream = ["CVE-2021-3575"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1957616", "https://github.com/uclouvain/openjpeg/issues/1347", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZ54FGM2IGAP4AWSJ22JKHOPHCR3FGYU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QB6AI7CWXWMEDZIQY4LQ6DMIEXMDOHUP/", "https://ubuntu.com/security/CVE-2021-3575", "https://bugzilla.redhat.com/show_bug.cgi?id=1957616", "https://github.com/uclouvain/openjpeg/issues/1347", "https://lists.debian.org/debian-lts-announce/2025/04/msg00002.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/EZ54FGM2IGAP4AWSJ22JKHOPHCR3FGYU/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/QB6AI7CWXWMEDZIQY4LQ6DMIEXMDOHUP/", "https://ubuntu.com/security/CVE-2021-3575"]

[[affected]]
pkg = "OpenJpeg_jll"
ranges = ["< 2.5.0+0"]

[[jlsec_sources]]
id = "CVE-2021-3575"
imported = 2025-11-04T03:26:05.232Z
modified = 2025-11-03T20:15:50.027Z
published = 2022-03-04T18:15:08.193Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-3575"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-3575"
```

# A heap-based buffer overflow was found in openjpeg in color.c:379:42 in sycc420_to_rgb when decompre...

A heap-based buffer overflow was found in openjpeg in color.c:379:42 in sycc420_to_rgb when decompressing a crafted .j2k file. An attacker could use this to execute arbitrary code with the permissions of the application compiled against openjpeg.

