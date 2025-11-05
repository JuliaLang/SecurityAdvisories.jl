```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl9606-hr440j"
modified = 2025-11-05T03:34:22.374Z
upstream = ["CVE-2023-45913"]
references = ["http://seclists.org/fulldisclosure/2024/Jan/28", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9856", "https://seclists.org/fulldisclosure/2024/Jan/71", "http://packetstormsecurity.com/files/176800/Mesa-23.0.4-Null-Pointer.html", "http://seclists.org/fulldisclosure/2024/Jan/28", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9856", "https://seclists.org/fulldisclosure/2024/Jan/71"]

[[affected]]
pkg = "Rusticl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-45913"
imported = 2025-11-05T03:34:22.374Z
modified = 2025-11-04T19:16:01.687Z
published = 2024-03-27T04:15:10.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-45913"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-45913"
```

# Mesa v23.0.4 was discovered to contain a NULL pointer dereference via the function dri2GetGlxDrawabl...

Mesa v23.0.4 was discovered to contain a NULL pointer dereference via the function dri2GetGlxDrawableFromXDrawableId(). This vulnerability is triggered when the X11 server sends an DRI2_BufferSwapComplete event unexpectedly when the application is using DRI3. NOTE: this is disputed because there is no scenario in which the vulnerability was demonstrated.

