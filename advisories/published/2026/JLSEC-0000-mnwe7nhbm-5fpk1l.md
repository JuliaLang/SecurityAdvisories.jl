```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7nhbm-5fpk1l"
modified = 2026-02-03T03:55:52.306Z
upstream = ["CVE-2026-22796"]
references = ["https://github.com/openssl/openssl/commit/2502e7b7d4c0cf4f972a881641fe09edc67aeec4", "https://github.com/openssl/openssl/commit/572844beca95068394c916626a6d3a490f831a49", "https://github.com/openssl/openssl/commit/7bbca05be55b129651d9df4bdb92becc45002c12", "https://github.com/openssl/openssl/commit/eeee3cbd4d682095ed431052f00403004596373e", "https://github.com/openssl/openssl/commit/ef2fb66ec571564d64d1c74a12e388a2a54d05d2", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2026-22796"
imported = 2026-02-03T03:55:52.306Z
modified = 2026-02-02T18:40:27.467Z
published = 2026-01-27T16:16:35.543Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2026-22796"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2026-22796"
```

# Issue summary: A type confusion vulnerability exists in the signature verification of signed PKCS#7 ...

Issue summary: A type confusion vulnerability exists in the signature
verification of signed PKCS#7 data where an ASN1_TYPE union member is
accessed without first validating the type, causing an invalid or NULL
pointer dereference when processing malformed PKCS#7 data.

Impact summary: An application performing signature verification of PKCS#7
data or calling directly the PKCS7_digest_from_attributes() function can be
caused to dereference an invalid or NULL pointer when reading, resulting in
a Denial of Service.

The function PKCS7_digest_from_attributes() accesses the message digest attribute
value without validating its type. When the type is not V_ASN1_OCTET_STRING,
this results in accessing invalid memory through the ASN1_TYPE union, causing
a crash.

Exploiting this vulnerability requires an attacker to provide a malformed
signed PKCS#7 to an application that verifies it. The impact of the
exploit is just a Denial of Service, the PKCS7 API is legacy and applications
should be using the CMS API instead. For these reasons the issue was
assessed as Low severity.

The FIPS modules in 3.5, 3.4, 3.3 and 3.0 are not affected by this issue,
as the PKCS#7 parsing implementation is outside the OpenSSL FIPS module
boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0, 1.1.1 and 1.0.2 are vulnerable to this issue.

