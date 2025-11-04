```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnss62ii2-1232kry"
modified = 2025-11-04T03:41:31.562Z
upstream = ["CVE-2024-52531"]
references = ["https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407", "https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/407#note_2316401", "https://gitlab.gnome.org/Teams/Releng/security/-/wikis/home", "https://offsec.almond.consulting/using-aflplusplus-on-bug-bounty-programs-an-example-with-gnome-libsoup.html", "https://lists.debian.org/debian-lts-announce/2024/12/msg00014.html"]

[[affected]]
pkg = "Soup3_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2024-52531"
imported = 2025-11-04T03:41:31.562Z
modified = 2025-11-03T23:17:15.063Z
published = 2024-11-11T20:15:20.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2024-52531"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2024-52531"
```

# GNOME libsoup before 3.6.1 allows a buffer overflow in applications that perform conversion to UTF-8...

GNOME libsoup before 3.6.1 allows a buffer overflow in applications that perform conversion to UTF-8 in soup_header_parse_param_list_strict. There is a plausible way to reach this remotely via soup_message_headers_get_content_type (e.g., an application may want to retrieve the content type of a request or response).

