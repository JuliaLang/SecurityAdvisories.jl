```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnv06j94r-su4ptp"
modified = 2025-12-30T03:36:06.651Z
upstream = ["CVE-2025-50952"]
references = ["https://github.com/uclouvain/openjpeg/issues/1505", "https://lists.debian.org/debian-lts-announce/2025/12/msg00035.html"]

[[affected]]
pkg = "OpenJpeg_jll"
ranges = [">= 2.5.0+0, < 2.5.2+0"]

[[jlsec_sources]]
id = "CVE-2025-50952"
imported = 2025-12-30T03:36:06.633Z
modified = 2025-12-29T17:15:44.997Z
published = 2025-08-07T15:15:32.773Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-50952"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-50952"
```

# openjpeg v 2.5.0 was discovered to contain a NULL pointer dereference via the component /openjp2/dwt...

openjpeg v 2.5.0 was discovered to contain a NULL pointer dereference via the component /openjp2/dwt.c.

