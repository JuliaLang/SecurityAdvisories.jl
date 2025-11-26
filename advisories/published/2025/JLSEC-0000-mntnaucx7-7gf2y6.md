```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx7-7gf2y6"
modified = 2025-11-25T22:36:00.619Z
upstream = ["CVE-2020-27757"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894234", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894234", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27757"
imported = 2025-11-25T22:36:00.619Z
modified = 2024-11-21T05:21:46.403Z
published = 2020-12-08T22:15:18.447Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27757"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27757"
```

# A floating point math calculation in ScaleAnyToQuantum() of /MagickCore/quantum-private.h could lead...

A floating point math calculation in ScaleAnyToQuantum() of /MagickCore/quantum-private.h could lead to undefined behavior in the form of a value outside the range of type unsigned long long. The flaw could be triggered by a crafted input file under certain conditions when it is processed by ImageMagick. Red Hat Product Security marked this as Low because although it could potentially lead to an impact to application availability, no specific impact was shown in this case. This flaw affects ImageMagick versions prior to 7.0.8-68.

