```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlbids-wsblc4"
modified = 2025-11-05T03:36:11.728Z
upstream = ["CVE-2023-40476"]
references = ["https://gstreamer.freedesktop.org/security/sa-2023-0008.html", "https://www.zerodayinitiative.com/advisories/ZDI-23-1458/", "https://gstreamer.freedesktop.org/security/sa-2023-0008.html", "https://lists.debian.org/debian-lts-announce/2023/10/msg00038.html", "https://www.zerodayinitiative.com/advisories/ZDI-23-1458/"]

[[affected]]
pkg = "GStreamer_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-40476"
imported = 2025-11-05T03:36:11.728Z
modified = 2025-11-04T20:16:43.000Z
published = 2024-05-03T03:15:20.303Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-40476"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-40476"
```

# GStreamer H265 Parsing Stack-based Buffer Overflow Remote Code Execution Vulnerability

GStreamer H265 Parsing Stack-based Buffer Overflow Remote Code Execution Vulnerability. This vulnerability allows remote attackers to execute arbitrary code on affected installations of GStreamer. Interaction with this library is required to exploit this vulnerability but attack vectors may vary depending on the implementation.

The specific flaw exists within the parsing of H265 encoded video files. The issue results from the lack of proper validation of the length of user-supplied data prior to copying it to a fixed-length stack-based buffer. An attacker can leverage this vulnerability to execute code in the context of the current process.
. Was ZDI-CAN-21768.

