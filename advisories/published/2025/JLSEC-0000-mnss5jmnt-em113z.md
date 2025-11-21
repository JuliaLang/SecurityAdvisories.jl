```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jmnt-em113z"
modified = 2025-11-04T03:26:50.489Z
upstream = ["CVE-2023-0437"]
references = ["https://jira.mongodb.org/browse/CDRIVER-4747", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/7GUVOAFZFSYTNBF6R7H4XJM5DHWBRQ6P/", "https://jira.mongodb.org/browse/CDRIVER-4747", "https://lists.debian.org/debian-lts-announce/2025/05/msg00012.html", "https://lists.debian.org/debian-lts-announce/2025/05/msg00027.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/7GUVOAFZFSYTNBF6R7H4XJM5DHWBRQ6P/"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["< 1.25.1+0"]

[[jlsec_sources]]
id = "CVE-2023-0437"
imported = 2025-11-04T03:26:50.489Z
modified = 2025-11-03T20:15:59.617Z
published = 2024-01-12T14:15:47.387Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-0437"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-0437"
```

# When calling bson_utf8_validate on some inputs a loop with an exit condition that cannot be reached ...

When calling bson_utf8_validate on some inputs a loop with an exit condition that cannot be reached may occur, i.e. an infinite loop. This issue affects All MongoDB C Driver versions prior to versions 1.25.0.

