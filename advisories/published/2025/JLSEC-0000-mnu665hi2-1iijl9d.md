```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnu665hi2-1iijl9d"
modified = 2025-12-09T03:32:19.034Z
upstream = ["CVE-2025-12119"]
references = ["https://github.com/mongodb/mongo-c-driver/releases/tag/1.30.6", "https://github.com/mongodb/mongo-c-driver/releases/tag/2.1.2", "https://github.com/mongodb/mongo-php-driver/releases/tag/1.21.2"]

[[affected]]
pkg = "MongoC_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12119"
imported = 2025-12-09T03:32:19.011Z
modified = 2025-12-08T13:49:29.023Z
published = 2025-11-18T22:15:45.713Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12119"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12119"
```

# A mongoc_bulk_operation_t may read invalid memory if large options are passed.

A mongoc_bulk_operation_t may read invalid memory if large options are passed.

