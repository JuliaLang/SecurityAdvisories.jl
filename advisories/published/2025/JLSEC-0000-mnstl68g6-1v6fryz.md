```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl68g6-1v6fryz"
modified = 2025-11-05T03:32:05.574Z
upstream = ["CVE-2023-5841"]
references = ["https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LSB6DB5LAKGPLRXEF5HDNGUMT7GIFT2C/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/XWMINVKQLSUHECXBSQMZFCSDRIHFOJJI/", "https://takeonme.org/cves/CVE-2023-5841.html", "http://seclists.org/fulldisclosure/2024/Sep/32", "http://seclists.org/fulldisclosure/2024/Sep/34", "http://seclists.org/fulldisclosure/2024/Sep/36", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LSB6DB5LAKGPLRXEF5HDNGUMT7GIFT2C/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/XWMINVKQLSUHECXBSQMZFCSDRIHFOJJI/", "https://takeonme.org/cves/CVE-2023-5841.html"]

[[affected]]
pkg = "OpenEXR_jll"
ranges = ["< 3.2.4+0"]

[[jlsec_sources]]
id = "CVE-2023-5841"
imported = 2025-11-05T03:32:05.574Z
modified = 2025-11-04T17:15:43.233Z
published = 2024-02-01T19:15:08.097Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5841"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5841"
```

# Due to a failure in validating the number of scanline samples of a OpenEXR file containing deep scan...

Due to a failure in validating the number of scanline samples of a OpenEXR file containing deep scanline data, Academy Software Foundation OpenEX image parsing library version 3.2.1 and prior is susceptible to a heap-based buffer overflow vulnerability. This issue was resolved as of versions v3.2.2 and v3.1.12 of the affected library.

