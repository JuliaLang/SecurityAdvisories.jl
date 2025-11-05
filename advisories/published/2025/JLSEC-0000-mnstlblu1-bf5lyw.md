```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlblu1-bf5lyw"
modified = 2025-11-05T03:36:16.201Z
upstream = ["CVE-2023-44446"]
references = ["https://gstreamer.freedesktop.org/security/sa-2023-0010.html", "https://www.zerodayinitiative.com/advisories/ZDI-23-1647/", "https://gstreamer.freedesktop.org/security/sa-2023-0010.html", "https://lists.debian.org/debian-lts-announce/2023/11/msg00029.html", "https://www.zerodayinitiative.com/advisories/ZDI-23-1647/"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-44446"
imported = 2025-11-05T03:36:16.201Z
modified = 2025-11-04T20:17:08.460Z
published = 2024-05-03T03:16:00.713Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-44446"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-44446"
```

# GStreamer MXF File Parsing Use-After-Free Remote Code Execution Vulnerability

GStreamer MXF File Parsing Use-After-Free Remote Code Execution Vulnerability. This vulnerability allows remote attackers to execute arbitrary code on affected installations of GStreamer. Interaction with this library is required to exploit this vulnerability but attack vectors may vary depending on the implementation.

The specific flaw exists within the parsing of MXF video files. The issue results from the lack of validating the existence of an object prior to performing operations on the object. An attacker can leverage this vulnerability to execute code in the context of the current process. Was ZDI-CAN-22299.

