```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5u7cc-1lt55ys"
modified = 2025-11-04T03:35:03.852Z
upstream = ["CVE-2024-6232"]
references = ["https://github.com/python/cpython/commit/34ddb64d088dd7ccc321f6103d23153256caa5d4", "https://github.com/python/cpython/commit/4eaf4891c12589e3c7bdad5f5b076e4c8392dd06", "https://github.com/python/cpython/commit/743acbe872485dc18df4d8ab2dc7895187f062c4", "https://github.com/python/cpython/commit/7d1f50cd92ff7e10a1c15a8f591dde8a6843a64d", "https://github.com/python/cpython/commit/b4225ca91547aa97ed3aca391614afbb255bc877", "https://github.com/python/cpython/commit/d449caf8a179e3b954268b3a88eb9170be3c8fbf", "https://github.com/python/cpython/commit/ed3a49ea734ada357ff4442996fd4ae71d253373", "https://github.com/python/cpython/issues/121285", "https://github.com/python/cpython/pull/121286", "https://mail.python.org/archives/list/security-announce@python.org/thread/JRYFTPRHZRTLMZLWQEUHZSJXNHM4ACTY/", "http://www.openwall.com/lists/oss-security/2024/09/03/5", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://security.netapp.com/advisory/ntap-20241018-0007/"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.16+0"]

[[jlsec_sources]]
id = "CVE-2024-6232"
imported = 2025-11-04T03:35:03.852Z
modified = 2025-11-03T23:17:30.710Z
published = 2024-09-03T13:15:05.363Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-6232"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-6232"
```

# There is a MEDIUM severity vulnerability affecting CPython.

There is a MEDIUM severity vulnerability affecting CPython.

Regular expressions that allowed excessive backtracking during tarfile.TarFile header parsing are vulnerable to ReDoS via specifically-crafted tar archives.

