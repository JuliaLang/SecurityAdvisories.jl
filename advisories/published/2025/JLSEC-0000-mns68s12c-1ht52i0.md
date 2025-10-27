```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12c-1ht52i0"
modified = 2025-10-19T19:26:25.380Z
upstream = ["CVE-2024-48615"]
references = ["https://github.com/88Sanghy88/crash-test", "https://github.com/libarchive/libarchive/releases/download/v3.7.6/libarchive-3.7.6.tar.gz", "https://github.com/88Sanghy88/crash-test"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2024-48615"
imported = 2025-10-19T19:26:25.380Z
modified = 2025-04-14T14:36:30.827Z
published = 2025-03-28T15:15:45.023Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-48615"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-48615"
```

# Null Pointer Dereference vulnerability in libarchive 3.7.6 and earlier when running program bsdtar i...

Null Pointer Dereference vulnerability in libarchive 3.7.6 and earlier when running program bsdtar in function header_pax_extension at rchive_read_support_format_tar.c:1844:8.

