```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7beyo-15e6y2s"
modified = 2025-11-04T04:16:26.496Z
upstream = ["CVE-2023-53154"]
references = ["https://github.com/DaveGamble/cJSON/compare/v1.7.17...v1.7.18", "https://github.com/DaveGamble/cJSON/issues/800", "https://lists.debian.org/debian-lts-announce/2025/06/msg00014.html", "https://github.com/DaveGamble/cJSON/issues/800"]

[[affected]]
pkg = "cJSON_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-53154"
imported = 2025-11-04T04:16:26.496Z
modified = 2025-11-03T20:16:06.467Z
published = 2025-05-23T16:15:22.080Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-53154"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-53154"
```

# parse_string in cJSON before 1.7.18 has a heap-based buffer over-read via {"1":1, with no trailing n...

parse_string in cJSON before 1.7.18 has a heap-based buffer over-read via {"1":1, with no trailing newline if cJSON_ParseWithLength is called.

