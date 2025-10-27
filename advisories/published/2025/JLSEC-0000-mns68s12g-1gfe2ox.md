```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12g-1gfe2ox"
modified = 2025-10-19T19:26:25.384Z
upstream = ["CVE-2025-5918"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5918", "https://bugzilla.redhat.com/show_bug.cgi?id=2370877", "https://github.com/libarchive/libarchive/pull/2584", "https://github.com/libarchive/libarchive/releases/tag/v3.8.0"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.8.0+0"]

[[jlsec_sources]]
id = "CVE-2025-5918"
imported = 2025-10-19T19:26:25.384Z
modified = 2025-08-15T18:35:04.390Z
published = 2025-06-09T20:15:27.493Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5918"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5918"
```

# A vulnerability has been identified in the libarchive library

A vulnerability has been identified in the libarchive library. This flaw can be triggered when file streams are piped into bsdtar, potentially allowing for reading past the end of the file. This out-of-bounds read can lead to unintended consequences, including unpredictable program behavior, memory corruption, or a denial-of-service condition.

