```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5iv5m-1412y4v"
modified = 2025-11-04T03:26:14.842Z
upstream = ["CVE-2022-0367"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2045571", "https://github.com/stephane/libmodbus/commit/b4ef4c17d618eba0adccc4c7d9e9a1ef809fc9b6", "https://github.com/stephane/libmodbus/issues/614", "https://lists.debian.org/debian-lts-announce/2022/09/msg00007.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2045571", "https://github.com/stephane/libmodbus/commit/b4ef4c17d618eba0adccc4c7d9e9a1ef809fc9b6", "https://github.com/stephane/libmodbus/issues/614", "https://lists.debian.org/debian-lts-announce/2022/09/msg00007.html", "https://lists.debian.org/debian-lts-announce/2025/03/msg00010.html"]

[[affected]]
pkg = "LibModbus_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2022-0367"
imported = 2025-11-04T03:26:14.842Z
modified = 2025-11-03T21:15:49.020Z
published = 2022-08-29T15:15:09.370Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-0367"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-0367"
```

# A heap-based buffer overflow flaw was found in libmodbus in function modbus_reply() in src/modbus.c....

A heap-based buffer overflow flaw was found in libmodbus in function modbus_reply() in src/modbus.c.

