```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss71voi-id9gp8"
modified = 2025-11-04T04:09:01.602Z
upstream = ["CVE-2024-10918"]
references = ["https://www.nozominetworks.com/labs/vulnerability-advisories-cve-2024-10918", "https://lists.debian.org/debian-lts-announce/2025/03/msg00010.html"]

[[affected]]
pkg = "LibModbus_jll"
ranges = [">= 3.1.10+0"]

[[jlsec_sources]]
id = "CVE-2024-10918"
imported = 2025-11-04T04:09:01.602Z
modified = 2025-11-03T21:16:04.100Z
published = 2025-02-27T12:15:33.807Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-10918"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-10918"
```

# Stack-based Buffer Overflow vulnerability in libmodbus v3.1.10 allows to overflow the buffer allocat...

Stack-based Buffer Overflow vulnerability in libmodbus v3.1.10 allows to overflow the buffer allocated for the Modbus response if the function tries to reply to a Modbus request with an
unexpected length.

