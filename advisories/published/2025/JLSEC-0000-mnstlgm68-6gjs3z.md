```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstlgm68-6gjs3z"
modified = 2025-11-05T03:40:09.920Z
upstream = ["CVE-2025-23084"]
references = ["https://nodejs.org/en/blog/vulnerability/january-2025-security-releases", "http://www.openwall.com/lists/oss-security/2025/07/22/2", "https://security.netapp.com/advisory/ntap-20250321-0003/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 18.12.1+0"]

[[jlsec_sources]]
id = "CVE-2025-23084"
imported = 2025-11-05T03:40:09.920Z
modified = 2025-11-04T22:16:07.090Z
published = 2025-01-28T05:15:11.267Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-23084"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-23084"
```

# A vulnerability has been identified in Node.js, specifically affecting the handling of drive names i...

A vulnerability has been identified in Node.js, specifically affecting the handling of drive names in the Windows environment. Certain Node.js functions do not treat drive names as special on Windows. As a result, although Node.js assumes a relative path, it actually refers to the root directory.

On Windows, a path that does not start with the file separator is treated as relative to the current directory.

This vulnerability affects Windows users of `path.join` API.

