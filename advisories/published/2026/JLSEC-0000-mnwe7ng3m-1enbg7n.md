```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7ng3m-1enbg7n"
modified = 2026-02-03T03:55:50.722Z
upstream = ["CVE-2025-11187"]
references = ["https://github.com/openssl/openssl/commit/205e3a55e16e4bd08c12fdbd3416ab829c0f6206", "https://github.com/openssl/openssl/commit/8caf359d6e46fb413e8f5f0df765d2e8a51df4e8", "https://github.com/openssl/openssl/commit/e1079bc17ed93ff16f6b86f33a2fe3336e78817e", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.5+0"]

[[jlsec_sources]]
id = "CVE-2025-11187"
imported = 2026-02-03T03:55:50.722Z
modified = 2026-02-02T18:39:21.740Z
published = 2026-01-27T16:16:14.093Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-11187"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-11187"
```

# Issue summary: PBMAC1 parameters in PKCS#12 files are missing validation which can trigger a stack-b...

Issue summary: PBMAC1 parameters in PKCS#12 files are missing validation
which can trigger a stack-based buffer overflow, invalid pointer or NULL
pointer dereference during MAC verification.

Impact summary: The stack buffer overflow or NULL pointer dereference may
cause a crash leading to Denial of Service for an application that parses
untrusted PKCS#12 files. The buffer overflow may also potentially enable
code execution depending on platform mitigations.

When verifying a PKCS#12 file that uses PBMAC1 for the MAC, the PBKDF2
salt and keylength parameters from the file are used without validation.
If the value of keylength exceeds the size of the fixed stack buffer used
for the derived key (64 bytes), the key derivation will overflow the buffer.
The overflow length is attacker-controlled. Also, if the salt parameter is
not an OCTET STRING type this can lead to invalid or NULL pointer
dereference.

Exploiting this issue requires a user or application to process
a maliciously crafted PKCS#12 file. It is uncommon to accept untrusted
PKCS#12 files in applications as they are usually used to store private
keys which are trusted by definition. For this reason the issue was assessed
as Moderate severity.

The FIPS modules in 3.6, 3.5 and 3.4 are not affected by this issue, as
PKCS#12 processing is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5 and 3.4 are vulnerable to this issue.

OpenSSL 3.3, 3.0, 1.1.1 and 1.0.2 are not affected by this issue as they do
not support PBMAC1 in PKCS#12.

