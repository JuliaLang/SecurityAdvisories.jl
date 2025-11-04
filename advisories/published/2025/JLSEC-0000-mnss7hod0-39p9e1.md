```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss7hod0-39p9e1"
modified = 2025-11-04T04:21:18.612Z
upstream = ["CVE-2025-54349"]
references = ["https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf", "https://github.com/esnet/iperf/releases/tag/3.19.1", "https://lists.debian.org/debian-lts-announce/2025/08/msg00020.html"]

[[affected]]
pkg = "iperf_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-54349"
imported = 2025-11-04T04:21:18.612Z
modified = 2025-11-03T19:16:09.340Z
published = 2025-08-03T02:15:35.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-54349"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-54349"
```

# In iperf before 3.19.1, iperf_auth.c has an off-by-one error and resultant heap-based buffer overflo...

In iperf before 3.19.1, iperf_auth.c has an off-by-one error and resultant heap-based buffer overflow.

