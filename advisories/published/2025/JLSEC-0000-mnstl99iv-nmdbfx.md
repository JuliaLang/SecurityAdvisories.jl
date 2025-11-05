```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl99iv-nmdbfx"
modified = 2025-11-05T03:34:26.935Z
upstream = ["CVE-2023-45922"]
references = ["http://seclists.org/fulldisclosure/2024/Jan/50", "http://seclists.org/fulldisclosure/2024/Jan/71", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9857", "http://packetstormsecurity.com/files/176805/Mesa-23.0.4-Buffer-Overflow-Null-Pointer.html", "http://seclists.org/fulldisclosure/2024/Jan/50", "http://seclists.org/fulldisclosure/2024/Jan/71", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9857"]

[[affected]]
pkg = "Rusticl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-45922"
imported = 2025-11-05T03:34:26.935Z
modified = 2025-11-04T19:16:02.187Z
published = 2024-03-27T05:15:47.203Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-45922"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-45922"
```

# glx_pbuffer.c in Mesa 23.0.4 was discovered to contain a segmentation violation when calling __glXGe...

glx_pbuffer.c in Mesa 23.0.4 was discovered to contain a segmentation violation when calling __glXGetDrawableAttribute(). NOTE: this is disputed because there are no common situations in which users require uninterrupted operation with an attacker-controller server.

