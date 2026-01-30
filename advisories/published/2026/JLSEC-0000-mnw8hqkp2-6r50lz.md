```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hqkp2-6r50lz"
modified = 2026-01-30T03:51:35.750Z
aliases = ["CVE-2025-66199"]
references = ["https://github.com/openssl/openssl/commit/3ed1f75249932b155eef993a8e66a99cb98bfef4", "https://github.com/openssl/openssl/commit/6184a4fb08ee6d7bca570d931a4e8bef40b64451", "https://github.com/openssl/openssl/commit/895150b5e021d16b52fb32b97e1dd12f20448be5", "https://github.com/openssl/openssl/commit/966a2478046c311ed7dae50c457d0db4cafbf7e4", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.5+0"]

[[jlsec_sources]]
id = "CVE-2025-66199"
imported = 2026-01-30T03:51:35.750Z
modified = 2026-01-29T16:31:35.700Z
published = 2026-01-27T16:16:15.777Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-66199"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-66199"
[[jlsec_sources]]
id = "EUVD-2025-206398"
imported = 2026-01-30T03:51:35.916Z
modified = 2026-01-29T15:03:51.000Z
published = 2026-01-27T16:01:22.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-206398"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-206398"
fields = ["affected"]
```

# Issue summary: A TLS 1.3 connection using certificate compression can be forced to allocate a large ...

Issue summary: A TLS 1.3 connection using certificate compression can be
forced to allocate a large buffer before decompression without checking
against the configured certificate size limit.

Impact summary: An attacker can cause per-connection memory allocations of
up to approximately 22 MiB and extra CPU work, potentially leading to
service degradation or resource exhaustion (Denial of Service).

In affected configurations, the peer-supplied uncompressed certificate
length from a CompressedCertificate message is used to grow a heap buffer
prior to decompression. This length is not bounded by the max_cert_list
setting, which otherwise constrains certificate message sizes. An attacker
can exploit this to cause large per-connection allocations followed by
handshake failure. No memory corruption or information disclosure occurs.

This issue only affects builds where TLS 1.3 certificate compression is
compiled in (i.e., not OPENSSL_NO_COMP_ALG) and at least one compression
algorithm (brotli, zlib, or zstd) is available, and where the compression
extension is negotiated. Both clients receiving a server CompressedCertificate
and servers in mutual TLS scenarios receiving a client CompressedCertificate
are affected. Servers that do not request client certificates are not
vulnerable to client-initiated attacks.

Users can mitigate this issue by setting SSL_OP_NO_RX_CERTIFICATE_COMPRESSION
to disable receiving compressed certificates.

The FIPS modules in 3.6, 3.5, 3.4 and 3.3 are not affected by this issue,
as the TLS implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4 and 3.3 are vulnerable to this issue.

OpenSSL 3.0, 1.1.1 and 1.0.2 are not affected by this issue.

