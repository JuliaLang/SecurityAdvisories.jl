```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntn9i1xl-gp56jk"
modified = 2025-11-25T21:58:26.889Z
upstream = ["CVE-2024-48957"]
references = ["https://github.com/libarchive/libarchive/compare/v3.7.4...v3.7.5", "https://github.com/libarchive/libarchive/pull/2149", "https://github.com/terrynini/CVE-Reports/blob/main/CVE-2024-48957/README.md"]

[[affected]]
pkg = "LibArchive_jll"
ranges = [">= 3.7.4+0, < 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2024-48957"
imported = 2025-11-25T21:58:26.889Z
modified = 2025-09-29T21:35:07.130Z
published = 2024-10-10T02:15:02.990Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-48957"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-48957"
```

# execute_filter_audio in archive_read_support_format_rar.c in libarchive before 3.7.5 allows out-of-b...

execute_filter_audio in archive_read_support_format_rar.c in libarchive before 3.7.5 allows out-of-bounds access via a crafted archive file because src can move beyond dst.

