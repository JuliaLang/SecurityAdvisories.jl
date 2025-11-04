```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss610l9-17bu0bd"
modified = 2025-11-04T03:40:21.693Z
upstream = ["CVE-2024-3935"]
references = ["https://github.com/eclipse-mosquitto/mosquitto/commit/ae7a804dadac8f2aaedb24336df8496a9680fda9", "https://gitlab.eclipse.org/security/vulnerability-reports/-/issues/197", "https://mosquitto.org/blog/2024/10/version-2-0-19-released/", "https://lists.debian.org/debian-lts-announce/2025/02/msg00022.html"]

[[affected]]
pkg = "mosquitto_client_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-3935"
imported = 2025-11-04T03:40:21.693Z
modified = 2025-11-03T21:16:16.427Z
published = 2024-10-30T12:15:03.090Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-3935"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-3935"
```

# In Eclipse Mosquito, versions from 2.0.0 through 2.0.18, if a Mosquitto broker is configured to crea...

In Eclipse Mosquito, versions from 2.0.0 through 2.0.18, if a Mosquitto broker is configured to create an outgoing bridge connection, and that bridge connection has an incoming topic configured that makes use of topic remapping, then if the remote connection sends a crafted PUBLISH packet to the broker a double free will occur with a subsequent crash of the broker.

