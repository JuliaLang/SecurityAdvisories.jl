```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5jcdo-13apa7v"
modified = 2025-11-04T03:26:37.164Z
upstream = ["CVE-2021-32050"]
references = ["https://jira.mongodb.org/browse/CDRIVER-3797", "https://jira.mongodb.org/browse/CXX-2028", "https://jira.mongodb.org/browse/NODE-3356", "https://jira.mongodb.org/browse/PHPC-1869", "https://jira.mongodb.org/browse/SWIFT-1229", "https://security.netapp.com/advisory/ntap-20231006-0001/", "https://jira.mongodb.org/browse/CDRIVER-3797", "https://jira.mongodb.org/browse/CXX-2028", "https://jira.mongodb.org/browse/NODE-3356", "https://jira.mongodb.org/browse/PHPC-1869", "https://jira.mongodb.org/browse/SWIFT-1229", "https://lists.debian.org/debian-lts-announce/2025/05/msg00027.html", "https://security.netapp.com/advisory/ntap-20231006-0001/"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["< 1.19.1+0"]

[[jlsec_sources]]
id = "CVE-2021-32050"
imported = 2025-11-04T03:26:37.164Z
modified = 2025-11-03T20:15:47.443Z
published = 2023-08-29T16:15:08.423Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-32050"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-32050"
```

# Some MongoDB Drivers may erroneously publish events containing authentication-related data to a comm...

Some MongoDB Drivers may erroneously publish events containing authentication-related data to a command listener configured by an application. The published events may contain security-sensitive data when specific authentication-related commands are executed.

Without due care, an application may inadvertently expose this sensitive information, e.g., by writing it to a log file. This issue only arises if an application enables the command listener feature (this is not enabled by default).

This issue affects the MongoDB C Driver 1.0.0 prior to 1.17.7, MongoDB PHP Driver 1.0.0 prior to 1.9.2, MongoDB Swift Driver 1.0.0 prior to 1.1.1, MongoDB Node.js Driver 3.6 prior to 3.6.10, MongoDB Node.js Driver 4.0 prior to 4.17.0 and MongoDB Node.js Driver 5.0 prior to 5.8.0. This issue also affects users of the MongoDB C++ Driver dependent on the C driver 1.0.0 prior to 1.17.7 (C++ driver prior to 3.7.0).

