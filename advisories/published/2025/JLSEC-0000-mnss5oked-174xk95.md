```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5oked-174xk95"
modified = 2025-11-04T03:30:40.837Z
upstream = ["CVE-2024-36845"]
references = ["https://github.com/stephane/libmodbus/issues/750", "https://github.com/stephane/libmodbus/issues/750", "https://lists.debian.org/debian-lts-announce/2025/03/msg00010.html"]

[[affected]]
pkg = "LibModbus_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-36845"
imported = 2025-11-04T03:30:40.837Z
modified = 2025-11-03T21:16:13.450Z
published = 2024-05-31T20:15:10.463Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36845"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36845"
```

# An invalid pointer in the modbus_receive() function of libmodbus v3.1.6 allows attackers to cause a ...

An invalid pointer in the modbus_receive() function of libmodbus v3.1.6 allows attackers to cause a Denial of Service (DoS) via a crafted message sent to the unit-test-server.

