```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl141h-122cjzm"
modified = 2025-11-05T03:28:06.581Z
upstream = ["CVE-2023-32559"]
references = ["https://hackerone.com/reports/1946470", "https://security.netapp.com/advisory/ntap-20231006-0006/", "https://hackerone.com/reports/1946470", "https://lists.debian.org/debian-lts-announce/2024/09/msg00029.html", "https://security.netapp.com/advisory/ntap-20231006-0006/"]

[[affected]]
pkg = "libnode_jll"
ranges = [">= 16.14.0+0"]

[[jlsec_sources]]
id = "CVE-2023-32559"
imported = 2025-11-05T03:28:06.581Z
modified = 2025-11-04T17:15:37.250Z
published = 2023-08-24T02:15:09.210Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-32559"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-32559"
```

# A privilege escalation vulnerability exists in the experimental policy mechanism in all active relea...

A privilege escalation vulnerability exists in the experimental policy mechanism in all active release lines: 16.x, 18.x and, 20.x. The use of the deprecated API `process.binding()` can bypass the policy mechanism by requiring internal modules and eventually take advantage of `process.binding('spawn_sync')` run arbitrary code, outside of the limits defined in a `policy.json` file. Please note that at the time this CVE was issued, the policy is an experimental feature of Node.js.

