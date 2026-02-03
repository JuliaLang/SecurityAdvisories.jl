```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7nh10-102da1g"
modified = 2026-02-03T03:55:51.924Z
upstream = ["CVE-2025-69421"]
references = ["https://github.com/openssl/openssl/commit/3524a29271f8191b8fd8a5257eb05173982a097b", "https://github.com/openssl/openssl/commit/36ecb4960872a4ce04bf6f1e1f4e78d75ec0c0c7", "https://github.com/openssl/openssl/commit/4bbc8d41a72c842ce4077a8a3eccd1109aaf74bd", "https://github.com/openssl/openssl/commit/643986985cd1c21221f941129d76fe0c2785aeb3", "https://github.com/openssl/openssl/commit/a2dbc539f0f9cc63832709fa5aa33ad9495eb19c", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-69421"
imported = 2026-02-03T03:55:51.924Z
modified = 2026-02-02T18:29:59.693Z
published = 2026-01-27T16:16:34.437Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-69421"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-69421"
```

# Issue summary: Processing a malformed PKCS#12 file can trigger a NULL pointer dereference in the PKC...

Issue summary: Processing a malformed PKCS#12 file can trigger a NULL pointer
dereference in the PKCS12_item_decrypt_d2i_ex() function.

Impact summary: A NULL pointer dereference can trigger a crash which leads to
Denial of Service for an application processing PKCS#12 files.

The PKCS12_item_decrypt_d2i_ex() function does not check whether the oct
parameter is NULL before dereferencing it. When called from
PKCS12_unpack_p7encdata() with a malformed PKCS#12 file, this parameter can
be NULL, causing a crash. The vulnerability is limited to Denial of Service
and cannot be escalated to achieve code execution or memory disclosure.

Exploiting this issue requires an attacker to provide a malformed PKCS#12 file
to an application that processes it. For that reason the issue was assessed as
Low severity according to our Security Policy.

The FIPS modules in 3.6, 3.5, 3.4, 3.3 and 3.0 are not affected by this issue,
as the PKCS#12 implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0, 1.1.1 and 1.0.2 are vulnerable to this issue.

