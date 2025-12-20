```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnulvxbwr-1lr9rid"
modified = 2025-12-20T03:30:21.195Z
upstream = ["CVE-2025-66382"]
references = ["https://github.com/libexpat/libexpat/issues/1076", "http://www.openwall.com/lists/oss-security/2025/12/02/1"]

[[affected]]
pkg = "Expat_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2025-66382"
imported = 2025-12-20T03:30:21.195Z
modified = 2025-12-19T16:05:03.557Z
published = 2025-11-28T07:15:57.900Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-66382"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-66382"
```

# In libexpat through 2.7.3, a crafted file with an approximate size of 2 MiB can lead to dozens of se...

In libexpat through 2.7.3, a crafted file with an approximate size of 2 MiB can lead to dozens of seconds of processing time.

