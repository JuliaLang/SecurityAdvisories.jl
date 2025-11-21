```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnsrinn9y-1s5kgxd"
modified = 2025-11-03T16:46:06.742Z
upstream = ["CVE-2023-1255"]
references = ["https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=02ac9c9420275868472f33b01def01218742b8bb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=bc2f61ad70971869b242fc1cb445b98bad50074a", "https://security.netapp.com/advisory/ntap-20230908-0006/", "https://www.openssl.org/news/secadv/20230419.txt", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=02ac9c9420275868472f33b01def01218742b8bb", "https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=bc2f61ad70971869b242fc1cb445b98bad50074a", "https://security.netapp.com/advisory/ntap-20230908-0006/", "https://www.openssl.org/news/secadv/20230419.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.0.8+0, < 3.0.9+0"]

[[jlsec_sources]]
id = "CVE-2023-1255"
imported = 2025-11-03T16:46:06.742Z
modified = 2025-02-04T22:15:39.327Z
published = 2023-04-20T17:15:06.883Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-1255"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-1255"
```

# Issue summary: The AES-XTS cipher decryption implementation for 64 bit ARM platform contains a bug t...

Issue summary: The AES-XTS cipher decryption implementation for 64 bit ARM
platform contains a bug that could cause it to read past the input buffer,
leading to a crash.

Impact summary: Applications that use the AES-XTS algorithm on the 64 bit ARM
platform can crash in rare circumstances. The AES-XTS algorithm is usually
used for disk encryption.

The AES-XTS cipher decryption implementation for 64 bit ARM platform will read
past the end of the ciphertext buffer if the ciphertext size is 4 mod 5 in 16
byte blocks, e.g. 144 bytes or 1024 bytes. If the memory after the ciphertext
buffer is unmapped, this will trigger a crash which results in a denial of
service.

If an attacker can control the size and location of the ciphertext buffer
being decrypted by an application using AES-XTS on 64 bit ARM, the
application is affected. This is fairly unlikely making this issue
a Low severity one.

