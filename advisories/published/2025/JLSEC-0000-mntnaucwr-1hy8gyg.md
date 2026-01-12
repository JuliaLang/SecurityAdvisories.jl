```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwr-1hy8gyg"
modified = 2025-11-25T22:36:00.603Z
upstream = ["CVE-2020-25666"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891612", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1891612", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25666"
imported = 2025-11-25T22:36:00.603Z
modified = 2024-11-21T05:18:24.197Z
published = 2020-12-08T21:15:12.623Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25666"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25666"
```

# There are 4 places in HistogramCompare() in MagickCore/histogram.c where an integer overflow is poss...

There are 4 places in HistogramCompare() in MagickCore/histogram.c where an integer overflow is possible during simple math calculations. This occurs in the rgb values and `count` value for a color. The patch uses casts to `ssize_t` type for these calculations, instead of `int`. This flaw could impact application reliability in the event that ImageMagick processes a crafted input file. This flaw affects ImageMagick versions prior to 7.0.9-0.

