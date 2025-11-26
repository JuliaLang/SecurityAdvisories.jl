```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxs-spomyh"
modified = 2025-11-25T22:36:00.640Z
upstream = ["CVE-2022-1114"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2064538", "https://bugzilla.redhat.com/show_bug.cgi?id=2064538"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-1114"
imported = 2025-11-25T22:36:00.640Z
modified = 2024-11-21T06:40:04.533Z
published = 2022-04-29T16:15:08.587Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-1114"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-1114"
```

# A heap-use-after-free flaw was found in ImageMagick's RelinquishDCMInfo() function of dcm.c file

A heap-use-after-free flaw was found in ImageMagick's RelinquishDCMInfo() function of dcm.c file. This vulnerability is triggered when an attacker passes a specially crafted DICOM image file to ImageMagick for conversion, potentially leading to information disclosure and a denial of service.

