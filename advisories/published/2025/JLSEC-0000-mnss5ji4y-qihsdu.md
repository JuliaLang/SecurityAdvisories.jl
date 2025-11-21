```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss5ji4y-qihsdu"
modified = 2025-11-04T03:26:44.626Z
upstream = ["CVE-2023-30581"]
references = ["https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://nodejs.org/en/blog/vulnerability/june-2023-security-releases", "https://security.netapp.com/advisory/ntap-20241101-0011/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 16.14.0+0"]

[[jlsec_sources]]
id = "CVE-2023-30581"
imported = 2025-11-04T03:26:44.626Z
modified = 2025-11-03T22:16:09.510Z
published = 2023-11-23T00:15:07.980Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-30581"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-30581"
```

# The use of __proto__ in process.mainModule.__proto__.require() can bypass the policy mechanism and r...

The use of __proto__ in process.mainModule.__proto__.require() can bypass the policy mechanism and require modules outside of the policy.json definition. This vulnerability affects all users using the experimental policy mechanism in all active release lines: v16, v18 and, v20.

Please note that at the time this CVE was issued, the policy is an experimental feature of Node.js

