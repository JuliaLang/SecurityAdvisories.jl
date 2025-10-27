```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s135-zc3l9o"
modified = 2025-10-19T19:26:25.409Z
aliases = ["CVE-2024-57970"]
references = ["https://github.com/libarchive/libarchive/issues/2415", "https://github.com/libarchive/libarchive/pull/2422"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.7.9+0"]

[[jlsec_sources]]
id = "CVE-2024-57970"
imported = 2025-10-19T19:26:25.389Z
modified = 2025-02-18T17:15:19.130Z
published = 2025-02-16T04:15:21.843Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-57970"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-57970"
[[jlsec_sources]]
id = "EUVD-2024-53870"
imported = 2025-10-19T19:26:26.846Z
modified = 2025-02-18T17:05:13.000Z
published = 2025-02-16T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-53870"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-53870"
fields = ["affected"]
```

# libarchive through 3.7.7 has a heap-based buffer over-read in header_gnu_longlink in archive_read_su...

libarchive through 3.7.7 has a heap-based buffer over-read in header_gnu_longlink in archive_read_support_format_tar.c via a TAR archive because it mishandles truncation in the middle of a GNU long linkname.

