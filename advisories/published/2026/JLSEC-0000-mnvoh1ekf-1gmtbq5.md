```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvoh1ekf-1gmtbq5"
modified = 2026-01-16T03:36:37.887Z
upstream = ["CVE-2025-13837"]
references = ["https://github.com/python/cpython/commit/5a8b19677d818fb41ee55f310233772e15aa1a2b", "https://github.com/python/cpython/commit/694922cf40aa3a28f898b5f5ee08b71b4922df70", "https://github.com/python/cpython/commit/71fa8eb8233b37f16c88b6e3e583b461b205d1ba", "https://github.com/python/cpython/commit/b64441e4852383645af5b435411a6f849dd1b4cb", "https://github.com/python/cpython/issues/119342", "https://github.com/python/cpython/pull/119343", "https://mail.python.org/archives/list/security-announce@python.org/thread/2X5IBCJXRQAZ5PSERLHMSJFBHFR3QM2C/"]

[[affected]]
pkg = "Python_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-13837"
imported = 2026-01-16T03:36:37.887Z
modified = 2026-01-15T19:08:31.690Z
published = 2025-12-01T18:16:04.380Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-13837"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-13837"
```

# When loading a plist file, the plistlib module reads data in size specified by the file itself, mean...

When loading a plist file, the plistlib module reads data in size specified by the file itself, meaning a malicious file can cause OOM and DoS issues

