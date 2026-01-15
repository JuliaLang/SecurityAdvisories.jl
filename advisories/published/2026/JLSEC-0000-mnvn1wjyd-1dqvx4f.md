```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvn1wjyd-1dqvx4f"
modified = 2026-01-15T03:45:11.173Z
upstream = ["CVE-2025-12119"]
references = ["https://github.com/mongodb/mongo-c-driver/releases/tag/1.30.6", "https://github.com/mongodb/mongo-c-driver/releases/tag/2.1.2", "https://github.com/mongodb/mongo-php-driver/releases/tag/1.21.2", "https://lists.debian.org/debian-lts-announce/2026/01/msg00009.html"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12119"
imported = 2026-01-15T03:45:11.151Z
modified = 2026-01-14T19:16:41.243Z
published = 2025-11-18T22:15:45.713Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12119"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12119"
```

# A mongoc_bulk_operation_t may read invalid memory if large options are passed.

A mongoc_bulk_operation_t may read invalid memory if large options are passed.

