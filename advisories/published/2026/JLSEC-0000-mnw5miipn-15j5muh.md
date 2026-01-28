```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnw5miipn-15j5muh"
modified = 2026-01-28T03:41:59.483Z
upstream = ["CVE-2024-1544"]
references = ["https://github.com/wolfSSL/wolfssl/pull/7020", "https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable"]

[[affected]]
pkg = "wolfSSL_jll"
ranges = ["< 5.7.2+0"]

[[jlsec_sources]]
id = "CVE-2024-1544"
imported = 2026-01-28T03:41:59.464Z
modified = 2026-01-27T22:15:51.300Z
published = 2024-08-27T19:15:16.547Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-1544"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-1544"
[[jlsec_sources]]
id = "EUVD-2024-17291"
imported = 2026-01-28T03:41:59.619Z
modified = 2026-01-27T21:58:42.000Z
published = 2024-08-27T18:44:52.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2024-17291"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2024-17291"
fields = ["affected"]
```

# Generating the ECDSA nonce k samples a random number r and then truncates this randomness with a mod...

Generating the ECDSA nonce k samples a random number r and then
truncates this randomness with a modular reduction mod n where n is the
order of the elliptic curve. Meaning k = r mod n. The division used
during the reduction estimates a factor q_e by dividing the upper two
digits (a digit having e.g. a size of 8 byte) of r by the upper digit of
n and then decrements q_e in a loop until it has the correct size.
Observing the number of times q_e is decremented through a control-flow
revealing side-channel reveals a bias in the most significant bits of
k. Depending on the curve this is either a negligible bias or a
significant bias large enough to reconstruct k with lattice reduction
methods. For SECP160R1, e.g., we find a bias of 15 bits.

