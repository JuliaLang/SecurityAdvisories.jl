```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7ngkp-1el1n34"
modified = 2026-02-03T03:55:51.338Z
upstream = ["CVE-2025-69418"]
references = ["https://github.com/openssl/openssl/commit/372fc5c77529695b05b4f5b5187691a57ef5dffc", "https://github.com/openssl/openssl/commit/4016975d4469cd6b94927c607f7c511385f928d8", "https://github.com/openssl/openssl/commit/52d23c86a54adab5ee9f80e48b242b52c4cc2347", "https://github.com/openssl/openssl/commit/a7589230356d908c0eca4b969ec4f62106f4f5ae", "https://github.com/openssl/openssl/commit/ed40856d7d4ba6cb42779b6770666a65f19cb977", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = [">= 1.19.9+0"]

[[jlsec_sources]]
id = "CVE-2025-69418"
imported = 2026-02-03T03:55:51.337Z
modified = 2026-02-02T18:36:03.557Z
published = 2026-01-27T16:16:33.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-69418"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-69418"
```

# Issue summary: When using the low-level OCB API directly with AES-NI or<br>other hardware-accelerate...

Issue summary: When using the low-level OCB API directly with AES-NI or<br>other hardware-accelerated code paths, inputs whose length is not a multiple<br>of 16 bytes can leave the final partial block unencrypted and unauthenticated.<br><br>Impact summary: The trailing 1-15 bytes of a message may be exposed in<br>cleartext on encryption and are not covered by the authentication tag,<br>allowing an attacker to read or tamper with those bytes without detection.<br><br>The low-level OCB encrypt and decrypt routines in the hardware-accelerated<br>stream path process full 16-byte blocks but do not advance the input/output<br>pointers. The subsequent tail-handling code then operates on the original<br>base pointers, effectively reprocessing the beginning of the buffer while<br>leaving the actual trailing bytes unprocessed. The authentication checksum<br>also excludes the true tail bytes.<br><br>However, typical OpenSSL consumers using EVP are not affected because the<br>higher-level EVP and provider OCB implementations split inputs so that full<br>blocks and trailing partial blocks are processed in separate calls, avoiding<br>the problematic code path. Additionally, TLS does not use OCB ciphersuites.<br>The vulnerability only affects applications that call the low-level<br>CRYPTO_ocb128_encrypt() or CRYPTO_ocb128_decrypt() functions directly with<br>non-block-aligned lengths in a single call on hardware-accelerated builds.<br>For these reasons the issue was assessed as Low severity.<br><br>The FIPS modules in 3.6, 3.5, 3.4, 3.3, 3.2, 3.1 and 3.0 are not affected<br>by this issue, as OCB mode is not a FIPS-approved algorithm.<br><br>OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0 and 1.1.1 are vulnerable to this issue.<br><br>OpenSSL 1.0.2 is not affected by this issue.

