```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ojqd-1cskiuo"
modified = 2025-11-04T03:30:39.973Z
upstream = ["CVE-2024-36844"]
references = ["https://github.com/stephane/libmodbus/issues/749", "https://github.com/stephane/libmodbus/issues/749", "https://lists.debian.org/debian-lts-announce/2025/03/msg00010.html"]

[[affected]]
pkg = "LibModbus_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-36844"
imported = 2025-11-04T03:30:39.973Z
modified = 2025-11-03T21:16:13.250Z
published = 2024-05-31T20:15:10.380Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-36844"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-36844"
```

# libmodbus v3.1.6 was discovered to contain a use-after-free via the ctx->backend pointer

libmodbus v3.1.6 was discovered to contain a use-after-free via the ctx->backend pointer. This vulnerability allows attackers to cause a Denial of Service (DoS) via a crafted message sent to the unit-test-server.

