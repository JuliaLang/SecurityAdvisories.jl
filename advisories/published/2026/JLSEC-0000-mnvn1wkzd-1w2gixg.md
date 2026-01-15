```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvn1wkzd-1w2gixg"
modified = 2026-01-15T03:45:12.505Z
upstream = ["CVE-2025-12084"]
references = ["https://github.com/python/cpython/commit/027f21e417b26eed4505ac2db101a4352b7c51a0", "https://github.com/python/cpython/commit/08d8e18ad81cd45bc4a27d6da478b51ea49486e4", "https://github.com/python/cpython/commit/27648a1818749ef44c420afe6173af6868715437", "https://github.com/python/cpython/commit/41f468786762348960486c166833a218a0a436af", "https://github.com/python/cpython/commit/57937a8e5e293f0dcba5115f7b7a11b1e0c9a273", "https://github.com/python/cpython/commit/8d2d7bb2e754f8649a68ce4116271a4932f76907", "https://github.com/python/cpython/commit/9c9dda6625a2a90d2a06c657eee021d6be19842d", "https://github.com/python/cpython/commit/a696ba8b4d42fd632afc9bc88ad830a2e4cceed8", "https://github.com/python/cpython/commit/ddcd2acd85d891a53e281c773b3093f9db953964", "https://github.com/python/cpython/commit/e91c11449cad34bac3ea55ee09ca557691d92b53", "https://github.com/python/cpython/issues/142145", "https://github.com/python/cpython/pull/142146"]

[[affected]]
pkg = "Python_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12084"
imported = 2026-01-15T03:45:12.485Z
modified = 2026-01-14T19:16:41.103Z
published = 2025-12-03T19:15:55.050Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12084"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12084"
```

# When building nested elements using xml.dom.minidom methods such as appendChild() that have a depend...

When building nested elements using xml.dom.minidom methods such as appendChild() that have a dependency on _clear_id_cache() the algorithm is quadratic. Availability can be impacted when building excessively nested documents.

