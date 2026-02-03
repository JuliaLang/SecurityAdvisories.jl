```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7ngq6-cnd98k"
modified = 2026-02-03T03:55:51.534Z
upstream = ["CVE-2025-69419"]
references = ["https://github.com/openssl/openssl/commit/41be0f216404f14457bbf3b9cc488dba60b49296", "https://github.com/openssl/openssl/commit/7e9cac9832e4705b91987c2474ed06a37a93cecb", "https://github.com/openssl/openssl/commit/a26a90d38edec3748566129d824e664b54bee2e2", "https://github.com/openssl/openssl/commit/cda12de3bc0e333ea8d2c6fd15001dbdaf280015", "https://github.com/openssl/openssl/commit/ff628933755075446bca8307e8417c14d164b535", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2025-69419"
imported = 2026-02-03T03:55:51.534Z
modified = 2026-02-02T18:35:02.177Z
published = 2026-01-27T16:16:34.113Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-69419"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-69419"
```

# Issue summary: Calling PKCS12_get_friendlyname() function on a maliciously crafted PKCS#12 file with...

Issue summary: Calling PKCS12_get_friendlyname() function on a maliciously
crafted PKCS#12 file with a BMPString (UTF-16BE) friendly name containing
non-ASCII BMP code point can trigger a one byte write before the allocated
buffer.

Impact summary: The out-of-bounds write can cause a memory corruption
which can have various consequences including a Denial of Service.

The OPENSSL_uni2utf8() function performs a two-pass conversion of a PKCS#12
BMPString (UTF-16BE) to UTF-8. In the second pass, when emitting UTF-8 bytes,
the helper function bmp_to_utf8() incorrectly forwards the remaining UTF-16
source byte count as the destination buffer capacity to UTF8_putc(). For BMP
code points above U+07FF, UTF-8 requires three bytes, but the forwarded
capacity can be just two bytes. UTF8_putc() then returns -1, and this negative
value is added to the output length without validation, causing the
length to become negative. The subsequent trailing NUL byte is then written
at a negative offset, causing write outside of heap allocated buffer.

The vulnerability is reachable via the public PKCS12_get_friendlyname() API
when parsing attacker-controlled PKCS#12 files. While PKCS12_parse() uses a
different code path that avoids this issue, PKCS12_get_friendlyname() directly
invokes the vulnerable function. Exploitation requires an attacker to provide
a malicious PKCS#12 file to be parsed by the application and the attacker
can just trigger a one zero byte write before the allocated buffer.
For that reason the issue was assessed as Low severity according to our
Security Policy.

The FIPS modules in 3.6, 3.5, 3.4, 3.3 and 3.0 are not affected by this issue,
as the PKCS#12 implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0 and 1.1.1 are vulnerable to this issue.

OpenSSL 1.0.2 is not affected by this issue.

