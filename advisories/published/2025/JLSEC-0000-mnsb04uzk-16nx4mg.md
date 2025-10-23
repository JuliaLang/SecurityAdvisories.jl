```toml
schema_version = "1.7.3"
id = "JLSEC-0000-mnsb04uzk-16nx4mg"
modified = 2025-10-23T03:23:18.368Z
upstream = ["CVE-2024-55549"]
references = ["https://gitlab.gnome.org/GNOME/libxslt/-/issues/127"]

[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.43+0"]

[[jlsec_sources]]
id = "CVE-2024-55549"
imported = 2025-10-23T03:23:18.368Z
modified = 2025-10-22T19:12:38.057Z
published = 2025-03-14T02:15:15.333Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-55549"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-55549"
```

# xsltGetInheritedNsList in libxslt before 1.1.43 has a use-after-free issue related to exclusion of r...

xsltGetInheritedNsList in libxslt before 1.1.43 has a use-after-free issue related to exclusion of result prefixes.

