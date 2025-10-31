```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsmft52m-17dqtq"
modified = 2025-10-31T03:27:33.358Z
upstream = ["CVE-2025-8851"]
references = ["http://www.libtiff.org/", "https://gitlab.com/libtiff/libtiff/-/commit/8a7a48d7a645992ca83062b3a1873c951661e2b3", "https://vuldb.com/?ctiid.319382", "https://vuldb.com/?id.319382", "https://vuldb.com/?submit.624604", "https://vuldb.com/?submit.624604"]

[[affected]]
pkg = "Libtiff_jll"
ranges = ["< 4.6.0+0"]

[[jlsec_sources]]
id = "CVE-2025-8851"
imported = 2025-10-31T03:27:33.358Z
modified = 2025-10-30T21:10:36.717Z
published = 2025-08-11T14:15:27.597Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-8851"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-8851"
```

# A vulnerability was determined in LibTIFF up to 4.5.1

A vulnerability was determined in LibTIFF up to 4.5.1. Affected by this issue is the function readSeparateStripsetoBuffer of the file tools/tiffcrop.c of the component tiffcrop. The manipulation leads to stack-based buffer overflow. Local access is required to approach this attack. The patch is identified as 8a7a48d7a645992ca83062b3a1873c951661e2b3. It is recommended to apply a patch to fix this issue.

