```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5oj2c-brcwbt"
modified = 2025-11-04T03:30:39.108Z
upstream = ["CVE-2024-36843"]
references = ["https://github.com/balckgu1/libmodbusPoc/blob/main/gdb.md", "https://github.com/stephane/libmodbus/issues/748", "https://github.com/balckgu1/libmodbusPoc/blob/main/gdb.md", "https://github.com/stephane/libmodbus/issues/748", "https://lists.debian.org/debian-lts-announce/2025/03/msg00010.html"]

[[affected]]
pkg = "LibModbus_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-36843"
imported = 2025-11-04T03:30:39.108Z
modified = 2025-11-03T21:16:13.037Z
published = 2024-05-31T20:15:10.290Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36843"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36843"
```

# libmodbus v3.1.6 was discovered to contain a heap overflow via the modbus_mapping_free() function.

libmodbus v3.1.6 was discovered to contain a heap overflow via the modbus_mapping_free() function.

