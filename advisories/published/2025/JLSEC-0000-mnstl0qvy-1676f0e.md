```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl0qvy-1676f0e"
modified = 2025-11-05T03:27:49.534Z
upstream = ["CVE-2022-4304"]
references = ["https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt", "https://psirt.global.sonicwall.com/vuln-detail/SNWLID-2023-0003", "https://security.gentoo.org/glsa/202402-08", "https://www.openssl.org/news/secadv/20230207.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 1.1.20+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["< 1.27.1+0"]

[[jlsec_sources]]
id = "CVE-2022-4304"
imported = 2025-11-05T03:27:49.534Z
modified = 2025-11-04T20:16:14.897Z
published = 2023-02-08T20:15:23.887Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-4304"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-4304"
```

# A timing based side channel exists in the OpenSSL RSA Decryption implementation which could be suffi...

A timing based side channel exists in the OpenSSL RSA Decryption implementation
which could be sufficient to recover a plaintext across a network in a
Bleichenbacher style attack. To achieve a successful decryption an attacker
would have to be able to send a very large number of trial messages for
decryption. The vulnerability affects all RSA padding modes: PKCS#1 v1.5,
RSA-OEAP and RSASVE.

For example, in a TLS connection, RSA is commonly used by a client to send an
encrypted pre-master secret to the server. An attacker that had observed a
genuine connection between a client and a server could use this flaw to send
trial messages to the server and record the time taken to process them. After a
sufficiently large number of messages the attacker could recover the pre-master
secret used for the original connection and thus be able to decrypt the
application data sent over that connection.

