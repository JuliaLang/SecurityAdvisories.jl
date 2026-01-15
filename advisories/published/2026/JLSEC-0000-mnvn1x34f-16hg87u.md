```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvn1x34f-16hg87u"
modified = 2026-01-15T03:45:36.015Z
upstream = ["CVE-2025-68973"]
references = ["https://github.com/gpg/gnupg/blob/ff30683418695f5d2cc9e6cf8c9418e09378ebe4/g10/armor.c#L1305-L1306", "https://github.com/gpg/gnupg/commit/115d138ba599328005c5321c0ef9f00355838ca9", "https://github.com/gpg/gnupg/compare/gnupg-2.2.50...gnupg-2.2.51", "https://gpg.fail/memcpy", "https://media.ccc.de/v/39c3-to-sign-or-not-to-sign-practical-vulnerabilities-i", "https://news.ycombinator.com/item?id=46403200", "https://www.openwall.com/lists/oss-security/2025/12/28/5", "http://www.openwall.com/lists/oss-security/2025/12/29/11", "https://lists.debian.org/debian-lts-announce/2026/01/msg00008.html", "https://gpg.fail/memcpy"]

[[affected]]
pkg = "GnuPG_jll"
ranges = ["< 2.5.16+0"]

[[jlsec_sources]]
id = "CVE-2025-68973"
imported = 2026-01-15T03:45:36.015Z
modified = 2026-01-14T19:16:46.857Z
published = 2025-12-28T17:16:01.500Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68973"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68973"
```

# In GnuPG before 2.4.9, armor_filter in g10/armor.c has two increments of an index variable where one...

In GnuPG before 2.4.9, armor_filter in g10/armor.c has two increments of an index variable where one is intended, leading to an out-of-bounds write for crafted input. (For ExtendedLTS, 2.2.51 and later are fixed versions.)

