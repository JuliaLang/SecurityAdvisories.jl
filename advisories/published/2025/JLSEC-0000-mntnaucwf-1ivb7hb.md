```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwf-1ivb7hb"
modified = 2025-11-25T22:36:00.591Z
upstream = ["CVE-2020-27771"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1898290", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1898290", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27771"
imported = 2025-11-25T22:36:00.591Z
modified = 2024-11-21T05:21:48.293Z
published = 2020-12-04T15:15:10.787Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27771"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27771"
```

# In RestoreMSCWarning() of /coders/pdf.c there are several areas where calls to GetPixelIndex() could...

In RestoreMSCWarning() of /coders/pdf.c there are several areas where calls to GetPixelIndex() could result in values outside the range of representable for the unsigned char type. The patch casts the return value of GetPixelIndex() to ssize_t type to avoid this bug. This undefined behavior could be triggered when ImageMagick processes a crafted pdf file. Red Hat Product Security marked this as Low severity because although it could potentially lead to an impact to application availability, no specific impact was demonstrated in this case. This flaw affects ImageMagick versions prior to 7.0.9-0.

