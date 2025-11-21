```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss73b1p-1h9na4w"
modified = 2025-11-04T04:10:08.173Z
upstream = ["CVE-2025-0755"]
references = ["https://jira.mongodb.org/browse/CDRIVER-5601", "https://jira.mongodb.org/browse/SERVER-94461", "https://lists.debian.org/debian-lts-announce/2025/05/msg00012.html", "https://lists.debian.org/debian-lts-announce/2025/05/msg00027.html"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["< 1.28.1+0"]

[[jlsec_sources]]
id = "CVE-2025-0755"
imported = 2025-11-04T04:10:08.173Z
modified = 2025-11-03T20:17:05.980Z
published = 2025-03-18T09:15:11.487Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-0755"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-0755"
```

# The various bson_append functions in the MongoDB C driver library may be susceptible to buffer overf...

The various bson_append functions in the MongoDB C driver library may be susceptible to buffer overflow when performing operations that could result in a final BSON document which exceeds the maximum allowable size (INT32_MAX), resulting in a segmentation fault and possible application crash. This issue affected libbson versions prior to 1.27.5, MongoDB Server v8.0 versions prior to 8.0.1 and MongoDB Server v7.0 versions prior to 7.0.16

