```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnvoh1hd0-1mh4twx"
modified = 2026-01-16T03:36:41.508Z
upstream = ["CVE-2025-12840"]
references = ["https://www.zerodayinitiative.com/advisories/ZDI-25-991/"]

[[affected]]
pkg = "OpenEXR_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-12840"
imported = 2026-01-16T03:36:41.508Z
modified = 2026-01-15T16:46:26.080Z
published = 2025-12-23T22:15:44.533Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-12840"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-12840"
```

# Academy Software Foundation OpenEXR EXR File Parsing Heap-based Buffer Overflow Remote Code Executio...

Academy Software Foundation OpenEXR EXR File Parsing Heap-based Buffer Overflow Remote Code Execution Vulnerability. This vulnerability allows remote attackers to execute arbitrary code on affected installations of Academy Software Foundation OpenEXR. User interaction is required to exploit this vulnerability in that the target must visit a malicious page or open a malicious file.

The specific flaw exists within the parsing of EXR files. The issue results from the lack of proper validation of the length of user-supplied data prior to copying it to a heap-based buffer. An attacker can leverage this vulnerability to execute code in the context of the current process. Was ZDI-CAN-27948.

