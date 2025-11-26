```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucw5-112dos5"
modified = 2025-11-25T22:36:00.581Z
upstream = ["CVE-2020-27761"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894679", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894679", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27761"
imported = 2025-11-25T22:36:00.581Z
modified = 2024-11-21T05:21:46.963Z
published = 2020-12-03T17:15:12.847Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27761"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27761"
```

# WritePALMImage() in /coders/palm.c used size_t casts in several areas of a calculation which could l...

WritePALMImage() in /coders/palm.c used size_t casts in several areas of a calculation which could lead to values outside the range of representable type `unsigned long` undefined behavior when a crafted input file was processed by ImageMagick. The patch casts to `ssize_t` instead to avoid this issue. Red Hat Product Security marked the Severity as Low because although it could potentially lead to an impact to application availability, no specific impact was shown in this case. This flaw affects ImageMagick versions prior to ImageMagick 7.0.9-0.

