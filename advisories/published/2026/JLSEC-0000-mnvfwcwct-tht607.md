```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvfwcwct-tht607"
modified = 2026-01-10T03:35:32.813Z
upstream = ["CVE-2025-68972"]
references = ["https://gpg.fail/formfeed", "https://media.ccc.de/v/39c3-to-sign-or-not-to-sign-practical-vulnerabilities-i", "https://news.ycombinator.com/item?id=46404339", "https://gpg.fail/formfeed"]

[[affected]]
pkg = "GnuPG_jll"
ranges = ["< 2.5.16+0"]

[[jlsec_sources]]
id = "CVE-2025-68972"
imported = 2026-01-10T03:35:32.796Z
modified = 2026-01-09T20:08:47.323Z
published = 2025-12-27T23:15:40.900Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68972"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68972"
```

# In GnuPG through 2.4.8, if a signed message has \f at the end of a plaintext line, an adversary can ...

In GnuPG through 2.4.8, if a signed message has \f at the end of a plaintext line, an adversary can construct a modified message that places additional text after the signed material, such that signature verification of the modified message succeeds (although an "invalid armor" message is printed during verification). This is related to use of \f as a marker to denote truncation of a long plaintext line.

