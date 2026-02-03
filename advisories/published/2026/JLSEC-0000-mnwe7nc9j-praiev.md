```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7nc9j-praiev"
modified = 2026-02-03T03:55:45.751Z
upstream = ["CVE-2025-12781"]
references = ["https://github.com/python/cpython/commit/13360efd385d1a7d0659beba03787ea3d063ef9b", "https://github.com/python/cpython/commit/1be80bec7960f5ccd059e75f3dfbd45fca302947", "https://github.com/python/cpython/commit/9060b4abbe475591b6230b23c2afefeff26fcca5", "https://github.com/python/cpython/commit/e95e783dff443b68e8179fdb57737025bf02ba76", "https://github.com/python/cpython/commit/fd17ee026fa9b67f6288cbafe374a3e479fe03a5", "https://github.com/python/cpython/issues/125346", "https://github.com/python/cpython/pull/141128", "https://mail.python.org/archives/list/security-announce@python.org/thread/KRI7GC6S27YV5NJ4FPDALS2WI5ENAFJ6/"]

[[affected]]
pkg = "Python_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12781"
imported = 2026-02-03T03:55:45.750Z
modified = 2026-02-02T17:25:23.933Z
published = 2026-01-21T20:16:04.423Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12781"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12781"
```

# When passing data to the b64decode(), standard_b64decode(), and urlsafe_b64decode() functions in the...

When passing data to the b64decode(), standard_b64decode(), and urlsafe_b64decode() functions in the "base64" module the characters "+/" will always be accepted, regardless of the value of "altchars" parameter, typically used to establish an "alternative base64 alphabet" such as the URL safe alphabet. This behavior matches what is recommended in earlier base64 RFCs, but newer RFCs now recommend either dropping characters outside the specified base64 alphabet or raising an error. The old behavior has the possibility of causing data integrity issues.

This behavior can only be insecure if your application uses an alternate base64 alphabet (without "+/"). If your application does not use the "altchars" parameter or the urlsafe_b64decode() function, then your application does not use an alternative base64 alphabet.

The attached patches DOES NOT make the base64-decode behavior raise an error, as this would be a change in behavior and break existing programs. Instead, the patch deprecates the behavior which will be replaced with the newly recommended behavior in a future version of Python. Users are recommended to mitigate by verifying user-controlled inputs match the base64
alphabet they are expecting or verify that their application would not be
affected if the b64decode() functions accepted "+" or "/" outside of altchars.

