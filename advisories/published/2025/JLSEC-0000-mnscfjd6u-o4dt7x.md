```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnscfjd6u-o4dt7x"
modified = 2025-10-24T03:22:15.558Z
upstream = ["CVE-2025-32988"]
references = ["https://access.redhat.com/errata/RHSA-2025:16115", "https://access.redhat.com/errata/RHSA-2025:16116", "https://access.redhat.com/errata/RHSA-2025:17348", "https://access.redhat.com/errata/RHSA-2025:17361", "https://access.redhat.com/errata/RHSA-2025:17415", "https://access.redhat.com/errata/RHSA-2025:19088", "https://access.redhat.com/security/cve/CVE-2025-32988", "https://bugzilla.redhat.com/show_bug.cgi?id=2359622"]

[[affected]]
pkg = "GnuTLS_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-32988"
imported = 2025-10-24T03:22:15.558Z
modified = 2025-10-23T20:15:38.550Z
published = 2025-07-10T08:15:24.223Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-32988"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-32988"
```

# A flaw was found in GnuTLS

A flaw was found in GnuTLS. A double-free vulnerability exists in GnuTLS due to incorrect ownership handling in the export logic of Subject Alternative Name (SAN) entries containing an otherName. If the type-id OID is invalid or malformed, GnuTLS will call asn1_delete_structure() on an ASN.1 node it does not own, leading to a double-free condition when the parent function or caller later attempts to free the same structure.

This vulnerability can be triggered using only public GnuTLS APIs and may result in denial of service or memory corruption, depending on allocator behavior.

