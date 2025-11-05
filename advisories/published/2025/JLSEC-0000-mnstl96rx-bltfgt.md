```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl96rx-bltfgt"
modified = 2025-11-05T03:34:23.373Z
upstream = ["CVE-2023-45919"]
references = ["http://seclists.org/fulldisclosure/2024/Jan/47", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9858", "http://packetstormsecurity.com/files/176802/Mesa-23.0.4-Buffer-Overflow.html", "http://seclists.org/fulldisclosure/2024/Jan/47", "https://gitlab.freedesktop.org/mesa/mesa/-/issues/9858"]

[[affected]]
pkg = "Rusticl_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-45919"
imported = 2025-11-05T03:34:23.373Z
modified = 2025-11-04T19:16:01.860Z
published = 2024-03-27T05:15:47.030Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-45919"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-45919"
```

# Mesa 23.0.4 was discovered to contain a buffer over-read in glXQueryServerString()

Mesa 23.0.4 was discovered to contain a buffer over-read in glXQueryServerString(). NOTE: this is disputed because there are no common situations in which users require uninterrupted operation with an attacker-controller server.

