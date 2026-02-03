```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7ng3p-h8191s"
modified = 2026-02-03T03:55:50.725Z
upstream = ["CVE-2025-15467"]
references = ["https://github.com/openssl/openssl/commit/2c8f0e5fa9b6ee5508a0349e4572ddb74db5a703", "https://github.com/openssl/openssl/commit/5f26d4202f5b89664c5c3f3c62086276026ba9a9", "https://github.com/openssl/openssl/commit/6ced0fe6b10faa560e410e3ee8d6c82f06c65ea3", "https://github.com/openssl/openssl/commit/ce39170276daec87f55c39dad1f629b56344429e", "https://github.com/openssl/openssl/commit/d0071a0799f20cc8101730145349ed4487c268dc", "https://openssl-library.org/news/secadv/20260127.txt", "http://www.openwall.com/lists/oss-security/2026/01/27/10"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2025-15467"
imported = 2026-02-03T03:55:50.725Z
modified = 2026-02-02T18:38:55.073Z
published = 2026-01-27T16:16:14.257Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-15467"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-15467"
```

# Issue summary: Parsing CMS AuthEnvelopedData message with maliciously crafted AEAD parameters can tr...

Issue summary: Parsing CMS AuthEnvelopedData message with maliciously
crafted AEAD parameters can trigger a stack buffer overflow.

Impact summary: A stack buffer overflow may lead to a crash, causing Denial
of Service, or potentially remote code execution.

When parsing CMS AuthEnvelopedData structures that use AEAD ciphers such as
AES-GCM, the IV (Initialization Vector) encoded in the ASN.1 parameters is
copied into a fixed-size stack buffer without verifying that its length fits
the destination. An attacker can supply a crafted CMS message with an
oversized IV, causing a stack-based out-of-bounds write before any
authentication or tag verification occurs.

Applications and services that parse untrusted CMS or PKCS#7 content using
AEAD ciphers (e.g., S/MIME AuthEnvelopedData with AES-GCM) are vulnerable.
Because the overflow occurs prior to authentication, no valid key material
is required to trigger it. While exploitability to remote code execution
depends on platform and toolchain mitigations, the stack-based write
primitive represents a severe risk.

The FIPS modules in 3.6, 3.5, 3.4, 3.3 and 3.0 are not affected by this
issue, as the CMS implementation is outside the OpenSSL FIPS module
boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3 and 3.0 are vulnerable to this issue.

OpenSSL 1.1.1 and 1.0.2 are not affected by this issue.

