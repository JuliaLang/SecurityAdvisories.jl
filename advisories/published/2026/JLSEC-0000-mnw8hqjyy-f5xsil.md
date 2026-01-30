```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw8hqjyy-f5xsil"
modified = 2026-01-30T03:51:34.810Z
aliases = ["CVE-2025-15468"]
references = ["https://github.com/openssl/openssl/commit/1f08e54bad32843044fe8a675948d65e3b4ece65", "https://github.com/openssl/openssl/commit/7c88376731c589ee5b36116c5a6e32d5ae5f7ae2", "https://github.com/openssl/openssl/commit/b2539639400288a4580fe2d76247541b976bade4", "https://github.com/openssl/openssl/commit/d75b309879631d45b972396ce4e5102559c64ac7", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.5+0"]

[[jlsec_sources]]
id = "CVE-2025-15468"
imported = 2026-01-30T03:51:34.810Z
modified = 2026-01-29T16:31:35.700Z
published = 2026-01-27T16:16:14.400Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-15468"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-15468"
[[jlsec_sources]]
id = "EUVD-2025-206400"
imported = 2026-01-30T03:51:34.971Z
modified = 2026-01-29T14:53:03.000Z
published = 2026-01-27T16:01:20.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-206400"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-206400"
fields = ["affected"]
```

# Issue summary: If an application using the SSL_CIPHER_find() function in a QUIC protocol client or s...

Issue summary: If an application using the SSL_CIPHER_find() function in
a QUIC protocol client or server receives an unknown cipher suite from
the peer, a NULL dereference occurs.

Impact summary: A NULL pointer dereference leads to abnormal termination of
the running process causing Denial of Service.

Some applications call SSL_CIPHER_find() from the client_hello_cb callback
on the cipher ID received from the peer. If this is done with an SSL object
implementing the QUIC protocol, NULL pointer dereference will happen if
the examined cipher ID is unknown or unsupported.

As it is not very common to call this function in applications using the QUIC
protocol and the worst outcome is Denial of Service, the issue was assessed
as Low severity.

The vulnerable code was introduced in the 3.2 version with the addition
of the QUIC protocol support.

The FIPS modules in 3.6, 3.5, 3.4 and 3.3 are not affected by this issue,
as the QUIC implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4 and 3.3 are vulnerable to this issue.

OpenSSL 3.0, 1.1.1 and 1.0.2 are not affected by this issue.

