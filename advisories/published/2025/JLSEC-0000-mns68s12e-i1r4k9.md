```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mns68s12e-i1r4k9"
modified = 2025-10-19T19:26:25.382Z
upstream = ["CVE-2025-5916"]
references = ["https://access.redhat.com/security/cve/CVE-2025-5916", "https://bugzilla.redhat.com/show_bug.cgi?id=2370872", "https://github.com/libarchive/libarchive/pull/2568", "https://github.com/libarchive/libarchive/releases/tag/v3.8.0"]

[[affected]]
pkg = "LibArchive_jll"
ranges = ["< 3.8.0+0"]

[[jlsec_sources]]
id = "CVE-2025-5916"
imported = 2025-10-19T19:26:25.382Z
modified = 2025-08-15T18:12:06.987Z
published = 2025-06-09T20:15:27.170Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-5916"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-5916"
```

# A vulnerability has been identified in the libarchive library

A vulnerability has been identified in the libarchive library. This flaw involves an integer overflow that can be triggered when processing a Web Archive (WARC) file that claims to have more than INT64_MAX - 4 content bytes. An attacker could craft a malicious WARC archive to induce this overflow, potentially leading to unpredictable program behavior, memory corruption, or a denial-of-service condition within applications that process such archives using libarchive.

