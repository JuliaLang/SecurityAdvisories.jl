```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx9-15jfevc"
modified = 2025-11-25T22:36:00.621Z
upstream = ["CVE-2021-20176"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1916610", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1916610", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2021-20176"
imported = 2025-11-25T22:36:00.621Z
modified = 2024-11-21T05:46:04.280Z
published = 2021-02-06T00:15:12.920Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20176"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20176"
```

# A divide-by-zero flaw was found in ImageMagick 6.9.11-57 and 7.0.10-57 in gem.c

A divide-by-zero flaw was found in ImageMagick 6.9.11-57 and 7.0.10-57 in gem.c. This flaw allows an attacker who submits a crafted file that is processed by ImageMagick to trigger undefined behavior through a division by zero. The highest threat from this vulnerability is to system availability.

