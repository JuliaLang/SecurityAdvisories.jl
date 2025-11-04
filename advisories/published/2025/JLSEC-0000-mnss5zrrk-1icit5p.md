```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5zrrk-1icit5p"
modified = 2025-11-04T03:39:23.600Z
upstream = ["CVE-2024-9287"]
references = ["https://github.com/python/cpython/commit/633555735a023d3e4d92ba31da35b1205f9ecbd7", "https://github.com/python/cpython/commit/8450b2482586857d689b6658f08de9c8179af7db", "https://github.com/python/cpython/commit/9286ab3a107ea41bd3f3c3682ce2512692bdded8", "https://github.com/python/cpython/commit/ae961ae94bf19c8f8c7fbea3d1c25cc55ce8ae97", "https://github.com/python/cpython/commit/d48cc82ed25e26b02eb97c6263d95dcaa1e9111b", "https://github.com/python/cpython/commit/e52095a0c1005a87eed2276af7a1f2f66e2b6483", "https://github.com/python/cpython/issues/124651", "https://github.com/python/cpython/pull/124712", "https://mail.python.org/archives/list/security-announce@python.org/thread/RSPJ2B5JL22FG3TKUJ7D7DQ4N5JRRBZL/", "https://lists.debian.org/debian-lts-announce/2024/11/msg00024.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00000.html", "https://security.netapp.com/advisory/ntap-20250425-0006/"]

[[affected]]
pkg = "Python_jll"
ranges = ["< 3.10.16+0"]

[[jlsec_sources]]
id = "CVE-2024-9287"
imported = 2025-11-04T03:39:23.600Z
modified = 2025-11-03T23:17:33.603Z
published = 2024-10-22T17:15:06.697Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-9287"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-9287"
```

# A vulnerability has been found in the CPython `venv` module and CLI where path names provided when c...

A vulnerability has been found in the CPython `venv` module and CLI where path names provided when creating a virtual environment were not quoted properly, allowing the creator to inject commands into virtual environment "activation" scripts (ie "source venv/bin/activate"). This means that attacker-controlled virtual environments are able to run commands when the virtual environment is activated. Virtual environments which are not created by an attacker or which aren't activated before being used (ie "./venv/bin/python") are not affected.

