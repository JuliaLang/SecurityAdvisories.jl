```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62imi-1pdv88b"
modified = 2025-11-04T03:41:31.722Z
upstream = ["CVE-2024-52532"]
references = ["https://gitlab.gnome.org/GNOME/libsoup/-/issues/391", "https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/410", "https://gitlab.gnome.org/Teams/Releng/security/-/wikis/home", "https://lists.debian.org/debian-lts-announce/2024/12/msg00014.html"]

[[affected]]
pkg = "Soup3_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-52532"
imported = 2025-11-04T03:41:31.722Z
modified = 2025-11-03T23:17:15.310Z
published = 2024-11-11T20:15:20.370Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52532"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52532"
```

# GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption

GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption. during the reading of certain patterns of WebSocket data from clients.

