```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss739fr-1hjx17s"
modified = 2025-11-04T04:10:06.087Z
upstream = ["CVE-2024-55549"]
references = ["https://gitlab.gnome.org/GNOME/libxslt/-/issues/127", "https://lists.debian.org/debian-lts-announce/2025/03/msg00015.html"]

[[affected]]
pkg = "XSLT_jll"
ranges = ["< 1.1.43+0"]

[[jlsec_sources]]
id = "CVE-2024-55549"
imported = 2025-11-04T04:10:06.087Z
modified = 2025-11-03T21:17:50.197Z
published = 2025-03-14T02:15:15.333Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-55549"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-55549"
```

# xsltGetInheritedNsList in libxslt before 1.1.43 has a use-after-free issue related to exclusion of r...

xsltGetInheritedNsList in libxslt before 1.1.43 has a use-after-free issue related to exclusion of result prefixes.

