```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnv1lzzhe-1u76fbf"
modified = 2025-12-31T03:36:47.714Z
upstream = ["CVE-2025-13836"]
references = ["https://github.com/python/cpython/commit/14b1fdb0a94b96f86fc7b86671ea9582b8676628", "https://github.com/python/cpython/commit/289f29b0fe38baf2d7cb5854f4bb573cc34a6a15", "https://github.com/python/cpython/commit/4ce27904b597c77d74dd93f2c912676021a99155", "https://github.com/python/cpython/commit/5a4c4a033a4a54481be6870aa1896fad732555b5", "https://github.com/python/cpython/issues/119451", "https://github.com/python/cpython/pull/119454", "https://mail.python.org/archives/list/security-announce@python.org/thread/OQ6G7MKRQIS3OAREC3HNG3D2DPOU34XO/"]

[[affected]]
pkg = "Python_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-13836"
imported = 2025-12-31T03:36:47.714Z
modified = 2025-12-30T15:08:14.027Z
published = 2025-12-01T18:16:04.200Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-13836"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-13836"
```

# When reading an HTTP response from a server, if no read amount is specified, the default behavior wi...

When reading an HTTP response from a server, if no read amount is specified, the default behavior will be to use Content-Length. This allows a malicious server to cause the client to read large amounts of data into memory, potentially causing OOM or other DoS.

