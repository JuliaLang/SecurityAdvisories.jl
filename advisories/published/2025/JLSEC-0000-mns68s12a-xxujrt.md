```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12a-xxujrt"
modified = 2025-10-19T19:26:25.378Z
upstream = ["CVE-2024-48958"]
references = ["https://github.com/libarchive/libarchive/compare/v3.7.4...v3.7.5", "https://github.com/libarchive/libarchive/pull/2148", "https://github.com/terrynini/CVE-Reports/tree/main/CVE-2024-48958"]

[[affected]]
pkg = "LibArchive_jll"
ranges = [">= 3.7.4+0, < 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2024-48958"
imported = 2025-10-19T19:26:25.378Z
modified = 2025-09-29T21:36:20.980Z
published = 2024-10-10T02:15:03.057Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-48958"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-48958"
```

# execute_filter_delta in archive_read_support_format_rar.c in libarchive before 3.7.5 allows out-of-b...

execute_filter_delta in archive_read_support_format_rar.c in libarchive before 3.7.5 allows out-of-bounds access via a crafted archive file because src can move beyond dst.

