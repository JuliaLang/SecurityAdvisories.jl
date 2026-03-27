```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnyhnzlkp-m9silw"
modified = 2026-03-27T23:15:54.745Z
upstream = ["CVE-2023-33460"]
references = ["https://github.com/lloyd/yajl/issues/250", "https://lists.debian.org/debian-lts-announce/2023/07/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/07/msg00013.html", "https://lists.debian.org/debian-lts-announce/2023/08/msg00003.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IBUUHG27RM4ROEYKMVRROR27AX6R63MB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KLE3C4CECEJ4EUYI56KXI6OWACWXX7WN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YO32YDJ74DADC7CMJNLSLBVWN5EXGF5J/", "https://github.com/lloyd/yajl/issues/250", "https://lists.debian.org/debian-lts-announce/2023/07/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/07/msg00013.html", "https://lists.debian.org/debian-lts-announce/2023/08/msg00003.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/IBUUHG27RM4ROEYKMVRROR27AX6R63MB/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/KLE3C4CECEJ4EUYI56KXI6OWACWXX7WN/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YO32YDJ74DADC7CMJNLSLBVWN5EXGF5J/"]

[[affected]]
pkg = "YAJL_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-33460"
imported = 2026-03-27T23:15:54.708Z
modified = 2025-01-08T17:15:12.020Z
published = 2023-06-06T12:15:09.447Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-33460"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-33460"
```

# There's a memory leak in yajl 2.1.0 with use of yajl_tree_parse function

There's a memory leak in yajl 2.1.0 with use of yajl_tree_parse function. which will cause out-of-memory in server and cause crash.

