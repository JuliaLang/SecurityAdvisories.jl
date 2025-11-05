```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl1ljy-jbbomx"
modified = 2025-11-05T03:28:29.278Z
upstream = ["CVE-2023-30590"]
references = ["https://lists.debian.org/debian-lts-announce/2024/03/msg00029.html", "https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://lists.debian.org/debian-lts-announce/2024/03/msg00029.html", "https://lists.debian.org/debian-lts-announce/2024/09/msg00029.html", "https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://security.netapp.com/advisory/ntap-20241101-0011/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 16.14.0+0"]

[[jlsec_sources]]
id = "CVE-2023-30590"
imported = 2025-11-05T03:28:29.278Z
modified = 2025-11-04T17:15:37.113Z
published = 2023-11-28T20:15:07.480Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30590"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30590"
```

# The generateKeys() API function returned from crypto.createDiffieHellman() only generates missing (o...

The generateKeys() API function returned from crypto.createDiffieHellman() only generates missing (or outdated) keys, that is, it only generates a private key if none has been set yet, but the function is also needed to compute the corresponding public key after calling setPrivateKey(). However, the documentation says this API call: "Generates private and public Diffie-Hellman key values".

The documented behavior is very different from the actual behavior, and this difference could easily lead to security issues in applications that use these APIs as the DiffieHellman may be used as the basis for application-level security, implications are consequently broad.

