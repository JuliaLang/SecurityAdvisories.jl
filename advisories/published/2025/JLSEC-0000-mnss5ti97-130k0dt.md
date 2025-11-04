```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ti97-130k0dt"
modified = 2025-11-04T03:34:31.339Z
upstream = ["CVE-2024-7592"]
references = ["https://github.com/python/cpython/commit/391e5626e3ee5af267b97e37abc7475732e67621", "https://github.com/python/cpython/commit/44e458357fca05ca0ae2658d62c8c595b048b5ef", "https://github.com/python/cpython/commit/a77ab24427a18bff817025adb03ca920dc3f1a06", "https://github.com/python/cpython/commit/b2f11ca7667e4d57c71c1c88b255115f16042d9a", "https://github.com/python/cpython/commit/d4ac921a4b081f7f996a5d2b101684b67ba0ed7f", "https://github.com/python/cpython/commit/d662e2db2605515a767f88ad48096b8ac623c774", "https://github.com/python/cpython/commit/dcc3eaef98cd94d6cb6cb0f44bd1c903d04f33b1", "https://github.com/python/cpython/issues/123067", "https://github.com/python/cpython/pull/123075", "https://mail.python.org/archives/list/security-announce@python.org/thread/HXJAAAALNUNGCQUS2W7WR6GFIZIHFOOK/", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://security.netapp.com/advisory/ntap-20241018-0006/"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.16+0"]

[[jlsec_sources]]
id = "CVE-2024-7592"
imported = 2025-11-04T03:34:31.339Z
modified = 2025-11-03T23:17:31.847Z
published = 2024-08-19T19:15:08.180Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-7592"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-7592"
```

# There is a LOW severity vulnerability affecting CPython, specifically the 'http.cookies' standard li...

There is a LOW severity vulnerability affecting CPython, specifically the
'http.cookies' standard library module.

When parsing cookies that contained backslashes for quoted characters in
the cookie value, the parser would use an algorithm with quadratic
complexity, resulting in excess CPU resources being used while parsing the
value.

