```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy9-mpdy18"
modified = 2025-11-25T22:36:00.657Z
upstream = ["CVE-2023-2157"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2208537", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/", "https://bugzilla.redhat.com/show_bug.cgi?id=2208537", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/45DUUXYMAEEAW55GSLAXN25VPKCRAIDA/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-2157"
imported = 2025-11-25T22:36:00.657Z
modified = 2025-01-07T22:15:29.647Z
published = 2023-06-06T20:15:12.120Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-2157"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-2157"
```

# A heap-based buffer overflow vulnerability was found in the ImageMagick package that can lead to the...

A heap-based buffer overflow vulnerability was found in the ImageMagick package that can lead to the application crashing.

