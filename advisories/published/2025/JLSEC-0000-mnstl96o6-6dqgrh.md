```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl96o6-6dqgrh"
modified = 2025-11-05T03:34:23.238Z
upstream = ["CVE-2023-45931"]
references = ["https://gitlab.freedesktop.org/mesa/mesa/-/issues/9859", "https://seclists.org/fulldisclosure/2024/Jan/71", "http://packetstormsecurity.com/files/176813/Mesa-23.0.4-Null-Pointer.html", "http://seclists.org/fulldisclosure/2024/Jan/59", "http://seclists.org/fulldisclosure/2024/Jan/71", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9859", "https://seclists.org/fulldisclosure/2024/Jan/71"]

[[affected]]
pkg = "Rusticl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-45931"
imported = 2025-11-05T03:34:23.238Z
modified = 2025-11-04T19:16:02.830Z
published = 2024-03-27T04:15:11.250Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-45931"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-45931"
```

# Mesa 23.0.4 was discovered to contain a NULL pointer dereference in check_xshm() for the has_error s...

Mesa 23.0.4 was discovered to contain a NULL pointer dereference in check_xshm() for the has_error state. NOTE: this is disputed because there is no scenario in which the vulnerability was demonstrated.

