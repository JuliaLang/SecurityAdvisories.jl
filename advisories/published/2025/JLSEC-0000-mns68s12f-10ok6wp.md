```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12f-10ok6wp"
modified = 2025-10-19T19:26:25.383Z
upstream = ["CVE-2025-5917"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5917", "https://bugzilla.redhat.com/show_bug.cgi?id=2370874", "https://github.com/libarchive/libarchive/pull/2588", "https://github.com/libarchive/libarchive/releases/tag/v3.8.0"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.8.0+0"]

[[jlsec_sources]]
id = "CVE-2025-5917"
imported = 2025-10-19T19:26:25.383Z
modified = 2025-08-15T18:16:42.910Z
published = 2025-06-09T20:15:27.330Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5917"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5917"
```

# A vulnerability has been identified in the libarchive library

A vulnerability has been identified in the libarchive library. This flaw involves an 'off-by-one' miscalculation when handling prefixes and suffixes for file names. This can lead to a 1-byte write overflow. While seemingly small, such an overflow can corrupt adjacent memory, leading to unpredictable program behavior, crashes, or in specific circumstances, could be leveraged as a building block for more sophisticated exploitation.

