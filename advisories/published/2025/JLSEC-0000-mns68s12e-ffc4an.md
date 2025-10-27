```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12e-ffc4an"
modified = 2025-10-19T19:26:25.382Z
upstream = ["CVE-2025-5915"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5915", "https://bugzilla.redhat.com/show_bug.cgi?id=2370865", "https://github.com/libarchive/libarchive/pull/2599", "https://github.com/libarchive/libarchive/releases/tag/v3.8.0"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.8.0+0"]

[[jlsec_sources]]
id = "CVE-2025-5915"
imported = 2025-10-19T19:26:25.382Z
modified = 2025-08-25T02:28:51.487Z
published = 2025-06-09T20:15:26.317Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5915"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5915"
```

# A vulnerability has been identified in the libarchive library

A vulnerability has been identified in the libarchive library. This flaw can lead to a heap buffer over-read due to the size of a filter block potentially exceeding the Lempel-Ziv-Storer-Schieber (LZSS) window. This means the library may attempt to read beyond the allocated memory buffer, which can result in unpredictable program behavior, crashes (denial of service), or the disclosure of sensitive information from adjacent memory regions.

