```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsapzs1j-16tt2kt"
modified = 2025-10-22T22:39:25.111Z
upstream = ["CVE-2023-6129"]
references = ["https://github.com/openssl/openssl/commit/050d26383d4e264966fb83428e72d5d48f402d35", "https://github.com/openssl/openssl/commit/5b139f95c9a47a55a0c54100f3837b1eee942b04", "https://github.com/openssl/openssl/commit/f3fc5808fe9ff74042d639839610d03b8fdcc015", "https://www.openssl.org/news/secadv/20240109.txt", "http://www.openwall.com/lists/oss-security/2024/03/11/1", "https://github.com/openssl/openssl/commit/050d26383d4e264966fb83428e72d5d48f402d35", "https://github.com/openssl/openssl/commit/5b139f95c9a47a55a0c54100f3837b1eee942b04", "https://github.com/openssl/openssl/commit/f3fc5808fe9ff74042d639839610d03b8fdcc015", "https://security.netapp.com/advisory/ntap-20240216-0009/", "https://security.netapp.com/advisory/ntap-20240426-0008/", "https://security.netapp.com/advisory/ntap-20240426-0013/", "https://security.netapp.com/advisory/ntap-20240503-0011/", "https://www.openssl.org/news/secadv/20240109.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.13+0"]

[[jlsec_sources]]
id = "CVE-2023-6129"
imported = 2025-10-22T22:39:25.111Z
modified = 2025-06-20T16:15:27.797Z
published = 2024-01-09T17:15:12.147Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-6129"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-6129"
```

# Issue summary: The POLY1305 MAC (message authentication code) implementation contains a bug that mig...

Issue summary: The POLY1305 MAC (message authentication code) implementation
contains a bug that might corrupt the internal state of applications running
on PowerPC CPU based platforms if the CPU provides vector instructions.

Impact summary: If an attacker can influence whether the POLY1305 MAC
algorithm is used, the application state might be corrupted with various
application dependent consequences.

The POLY1305 MAC (message authentication code) implementation in OpenSSL for
PowerPC CPUs restores the contents of vector registers in a different order
than they are saved. Thus the contents of some of these vector registers
are corrupted when returning to the caller. The vulnerable code is used only
on newer PowerPC processors supporting the PowerISA 2.07 instructions.

The consequences of this kind of internal application state corruption can
be various - from no consequences, if the calling application does not
depend on the contents of non-volatile XMM registers at all, to the worst
consequences, where the attacker could get complete control of the application
process. However unless the compiler uses the vector registers for storing
pointers, the most likely consequence, if any, would be an incorrect result
of some application dependent calculations or a crash leading to a denial of
service.

The POLY1305 MAC algorithm is most frequently used as part of the
CHACHA20-POLY1305 AEAD (authenticated encryption with associated data)
algorithm. The most common usage of this AEAD cipher is with TLS protocol
versions 1.2 and 1.3. If this cipher is enabled on the server a malicious
client can influence whether this AEAD cipher is used. This implies that
TLS server applications using OpenSSL can be potentially impacted. However
we are currently not aware of any concrete application that would be affected
by this issue therefore we consider this a Low severity security issue.

