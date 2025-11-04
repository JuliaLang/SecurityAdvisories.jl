```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss782nq-cg5va0"
modified = 2025-11-04T04:13:50.582Z
upstream = ["CVE-2023-26819"]
references = ["https://github.com/boofish/json_bugs/tree/main/cjson", "https://lists.debian.org/debian-lts-announce/2025/06/msg00014.html"]

[[affected]]
pkg = "cJSON_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-26819"
imported = 2025-11-04T04:13:50.582Z
modified = 2025-11-03T20:16:00.937Z
published = 2025-04-19T22:15:14.103Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-26819"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-26819"
```

# cJSON 1.7.15 might allow a denial of service via a crafted JSON document such as {"a": true, "b": [ ...

cJSON 1.7.15 might allow a denial of service via a crafted JSON document such as {"a": true, "b": [ null,9999999999999999999999999999999999999999999999912345678901234567]}.

