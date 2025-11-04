```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss6108s-1myh3y7"
modified = 2025-11-04T03:40:21.244Z
upstream = ["CVE-2024-10525"]
references = ["https://github.com/eclipse-mosquitto/mosquitto/commit/8ab20b4ba4204fdcdec78cb4d9f03c944a6e0e1c", "https://gitlab.eclipse.org/security/vulnerability-reports/-/issues/190", "https://mosquitto.org/blog/2024/10/version-2-0-19-released/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00022.html"]

[[affected]]
pkg = "mosquitto_client_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-10525"
imported = 2025-11-04T03:40:21.244Z
modified = 2025-11-03T21:16:03.947Z
published = 2024-10-30T12:15:02.787Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-10525"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-10525"
```

# In Eclipse Mosquitto, from version 1.3.2 through 2.0.18, if a malicious broker sends a crafted SUBAC...

In Eclipse Mosquitto, from version 1.3.2 through 2.0.18, if a malicious broker sends a crafted SUBACK packet with no reason codes, a client using libmosquitto may make out of bounds memory access when acting in its on_subscribe callback. This affects the mosquitto_sub and mosquitto_rr clients.

