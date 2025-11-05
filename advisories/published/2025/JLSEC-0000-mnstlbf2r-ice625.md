```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlbf2r-ice625"
modified = 2025-11-05T03:36:07.443Z
upstream = ["CVE-2023-37327"]
references = ["https://gstreamer.freedesktop.org/security/sa-2023-0001.html", "https://www.zerodayinitiative.com/advisories/ZDI-23-903/", "https://gstreamer.freedesktop.org/security/sa-2023-0001.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/IGQEFZ6ZB3C2XU4JQD3IAFMQIN456W2D/", "https://www.zerodayinitiative.com/advisories/ZDI-23-903/"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-37327"
imported = 2025-11-05T03:36:07.443Z
modified = 2025-11-04T19:15:47.630Z
published = 2024-05-03T02:15:43.270Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-37327"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-37327"
```

# GStreamer FLAC File Parsing Integer Overflow Remote Code Execution Vulnerability

GStreamer FLAC File Parsing Integer Overflow Remote Code Execution Vulnerability. This vulnerability allows remote attackers to execute arbitrary code on affected installations of GStreamer. Interaction with this library is required to exploit this vulnerability but attack vectors may vary depending on the implementation.

The specific flaw exists within the parsing of FLAC audio files. The issue results from the lack of proper validation of user-supplied data, which can result in an integer overflow before allocating a buffer. An attacker can leverage this vulnerability to execute code in the context of the current process. Was ZDI-CAN-20775.

