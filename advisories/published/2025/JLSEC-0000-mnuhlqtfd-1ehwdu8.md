```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnuhlqtfd-1ehwdu8"
modified = 2025-12-17T03:34:16.441Z
upstream = ["CVE-2025-12084"]
references = ["https://github.com/python/cpython/commit/027f21e417b26eed4505ac2db101a4352b7c51a0", "https://github.com/python/cpython/commit/08d8e18ad81cd45bc4a27d6da478b51ea49486e4", "https://github.com/python/cpython/commit/ddcd2acd85d891a53e281c773b3093f9db953964", "https://github.com/python/cpython/issues/142145", "https://github.com/python/cpython/pull/142146"]

[[affected]]
pkg = "Python_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12084"
imported = 2025-12-17T03:34:16.441Z
modified = 2025-12-16T21:13:09.597Z
published = 2025-12-03T19:15:55.050Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12084"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12084"
```

# When building nested elements using xml.dom.minidom methods such as appendChild() that have a depend...

When building nested elements using xml.dom.minidom methods such as appendChild() that have a dependency on _clear_id_cache() the algorithm is quadratic. Availability can be impacted when building excessively nested documents.

