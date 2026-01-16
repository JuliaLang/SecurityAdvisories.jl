```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvoh1h9b-choc2b"
modified = 2026-01-16T03:36:41.375Z
upstream = ["CVE-2025-12839"]
references = ["https://www.zerodayinitiative.com/advisories/ZDI-25-990/"]

[[affected]]
pkg = "OpenEXR_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12839"
imported = 2026-01-16T03:36:41.375Z
modified = 2026-01-15T16:45:51.503Z
published = 2025-12-23T22:15:44.407Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12839"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12839"
```

# Academy Software Foundation OpenEXR EXR File Parsing Heap-based Buffer Overflow Remote Code Executio...

Academy Software Foundation OpenEXR EXR File Parsing Heap-based Buffer Overflow Remote Code Execution Vulnerability. This vulnerability allows remote attackers to execute arbitrary code on affected installations of Academy Software Foundation OpenEXR. User interaction is required to exploit this vulnerability in that the target must visit a malicious page or open a malicious file.

The specific flaw exists within the parsing of EXR files. The issue results from the lack of proper validation of the length of user-supplied data prior to copying it to a heap-based buffer. An attacker can leverage this vulnerability to execute code in the context of the current process. Was ZDI-CAN-27947.

