```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnwe7nga5-bjj2od"
modified = 2026-02-03T03:55:50.957Z
upstream = ["CVE-2025-68160"]
references = ["https://github.com/openssl/openssl/commit/384011202af92605d926fafe4a0bcd6b65d162ad", "https://github.com/openssl/openssl/commit/475c466ef2fbd8fc1df6fae1c3eed9c813fc8ff6", "https://github.com/openssl/openssl/commit/4c96fbba618e1940f038012506ee9e21d32ee12c", "https://github.com/openssl/openssl/commit/6845c3b6460a98b1ec4e463baa2ea1a63a32d7c0", "https://github.com/openssl/openssl/commit/68a7cd2e2816c3a02f4d45a2ce43fc04fac97096", "https://openssl-library.org/news/secadv/20260127.txt"]

[[affected]]
pkg = "OpenSSL_jll"
ranges = ["< 3.5.5+0"]
[[affected]]
pkg = "Openresty_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-68160"
imported = 2026-02-03T03:55:50.957Z
modified = 2026-02-02T18:36:57.727Z
published = 2026-01-27T16:16:15.900Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-68160"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-68160"
```

# Issue summary: Writing large, newline-free data into a BIO chain using the line-buffering filter whe...

Issue summary: Writing large, newline-free data into a BIO chain using the
line-buffering filter where the next BIO performs short writes can trigger
a heap-based out-of-bounds write.

Impact summary: This out-of-bounds write can cause memory corruption which
typically results in a crash, leading to Denial of Service for an application.

The line-buffering BIO filter (BIO_f_linebuffer) is not used by default in
TLS/SSL data paths. In OpenSSL command-line applications, it is typically
only pushed onto stdout/stderr on VMS systems. Third-party applications that
explicitly use this filter with a BIO chain that can short-write and that
write large, newline-free data influenced by an attacker would be affected.
However, the circumstances where this could happen are unlikely to be under
attacker control, and BIO_f_linebuffer is unlikely to be handling non-curated
data controlled by an attacker. For that reason the issue was assessed as
Low severity.

The FIPS modules in 3.6, 3.5, 3.4, 3.3 and 3.0 are not affected by this issue,
as the BIO implementation is outside the OpenSSL FIPS module boundary.

OpenSSL 3.6, 3.5, 3.4, 3.3, 3.0, 1.1.1 and 1.0.2 are vulnerable to this issue.

