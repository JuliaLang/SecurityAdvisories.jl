```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvz-1f3dnxp"
modified = 2025-11-25T22:36:00.575Z
upstream = ["CVE-2020-27759"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894238", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894238", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27759"
imported = 2025-11-25T22:36:00.575Z
modified = 2024-11-21T05:21:46.667Z
published = 2020-12-03T17:15:12.707Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27759"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27759"
```

# In IntensityCompare() of /MagickCore/quantize.c, a double value was being casted to int and returned...

In IntensityCompare() of /MagickCore/quantize.c, a double value was being casted to int and returned, which in some cases caused a value outside the range of type `int` to be returned. The flaw could be triggered by a crafted input file under certain conditions when processed by ImageMagick. Red Hat Product Security marked this as Low severity because although it could potentially lead to an impact to application availability, no specific impact was shown in this case. This flaw affects ImageMagick versions prior to 7.0.8-68.

