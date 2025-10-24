```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnscfj3z8-eulqd0"
modified = 2025-10-24T03:22:03.620Z
upstream = ["CVE-2025-4575"]
references = ["https://github.com/openssl/openssl/commit/e96d22446e633d117e6c9904cb15b4693e956eaa", "https://openssl-library.org/news/secadv/20250522.txt", "http://www.openwall.com/lists/oss-security/2025/05/22/1"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = [">= 3.5.0+0, < 3.5.1+0"]

[[jlsec_sources]]
id = "CVE-2025-4575"
imported = 2025-10-24T03:22:03.620Z
modified = 2025-10-23T14:51:30.377Z
published = 2025-05-22T14:16:07.630Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-4575"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-4575"
```

# Issue summary: Use of -addreject option with the openssl x509 application adds a trusted use instead...

Issue summary: Use of -addreject option with the openssl x509 application adds
a trusted use instead of a rejected use for a certificate.

Impact summary: If a user intends to make a trusted certificate rejected for
a particular use it will be instead marked as trusted for that use.

A copy & paste error during minor refactoring of the code introduced this
issue in the OpenSSL 3.5 version. If, for example, a trusted CA certificate
should be trusted only for the purpose of authenticating TLS servers but not
for CMS signature verification and the CMS signature verification is intended
to be marked as rejected with the -addreject option, the resulting CA
certificate will be trusted for CMS signature verification purpose instead.

Only users which use the trusted certificate format who use the openssl x509
command line application to add rejected uses are affected by this issue.
The issues affecting only the command line application are considered to
be Low severity.

The FIPS modules in 3.5, 3.4, 3.3, 3.2, 3.1 and 3.0 are not affected by this
issue.

OpenSSL 3.4, 3.3, 3.2, 3.1, 3.0, 1.1.1 and 1.0.2 are also not affected by this
issue.

