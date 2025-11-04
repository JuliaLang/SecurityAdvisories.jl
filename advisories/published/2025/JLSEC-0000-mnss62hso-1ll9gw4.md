```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62hso-1ll9gw4"
modified = 2025-11-04T03:41:30.648Z
upstream = ["CVE-2024-52530"]
references = ["https://gitlab.gnome.org/GNOME/libsoup/-/issues/377", "https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/402", "https://gitlab.gnome.org/Teams/Releng/security/-/wikis/home", "https://lists.debian.org/debian-lts-announce/2024/12/msg00014.html"]

[[affected]]
pkg = "Soup3_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-52530"
imported = 2025-11-04T03:41:30.648Z
modified = 2025-11-03T23:17:14.843Z
published = 2024-11-11T20:15:20.247Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52530"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52530"
```

# GNOME libsoup before 3.6.0 allows HTTP request smuggling in some configurations because '\0' charact...

GNOME libsoup before 3.6.0 allows HTTP request smuggling in some configurations because '\0' characters at the end of header names are ignored, i.e., a "Transfer-Encoding\0: chunked" header is treated the same as a "Transfer-Encoding: chunked" header.

