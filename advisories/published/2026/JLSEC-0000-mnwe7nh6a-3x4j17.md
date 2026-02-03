```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7nh6a-3x4j17"
modified = 2026-02-03T03:55:52.114Z
upstream = ["CVE-2026-22795"]
references = ["https://github.com/openssl/openssl/commit/2502e7b7d4c0cf4f972a881641fe09edc67aeec4", "https://github.com/openssl/openssl/commit/572844beca95068394c916626a6d3a490f831a49", "https://github.com/openssl/openssl/commit/7bbca05be55b129651d9df4bdb92becc45002c12", "https://github.com/openssl/openssl/commit/eeee3cbd4d682095ed431052f00403004596373e", "https://github.com/openssl/openssl/commit/ef2fb66ec571564d64d1c74a12e388a2a54d05d2", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2026-22795"
imported = 2026-02-03T03:55:52.114Z
modified = 2026-02-02T18:41:14.917Z
published = 2026-01-27T16:16:35.430Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22795"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22795"
```

# Issue summary: An invalid or NULL pointer dereference can happen in an application processing a malf...

Issue summary: An invalid or NULL pointer dereference can happen in
an application processing a malformed PKCS#12 file.

Impact summary: An application processing a malformed PKCS#12 file can be
caused to dereference an invalid or NULL pointer on memory read, resulting
in a Denial of Service.

A type confusion vulnerability exists in PKCS#12 parsing code where
an ASN1_TYPE union member is accessed without first validating the type,
causing an invalid pointer read.

The location is constrained to a 1-byte address space, meaning any
attempted pointer manipulation can only target addresses between 0x00 and 0xFF.
This range corresponds to the zero page, which is unmapped on most modern
operating systems and will reliably result in a crash, leading only to a
Denial of Service. Exploiting this issue also requires a user or application
to process a maliciously crafted PKCS#12 file. It is uncommon to accept
untrusted PKCS#12 files in applications as they are usually used to store
private keys which are trusted by definition. For these reasons, the issue
was assessed as Low severity.

The FIPS modules in 3.5, 3.4, 3.3 and 3.0 are not affected by this issue,
as the PKCS12 implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0 and 1.1.1 are vulnerable to this issue.

OpenSSL 1.0.2 is not affected by this issue.

