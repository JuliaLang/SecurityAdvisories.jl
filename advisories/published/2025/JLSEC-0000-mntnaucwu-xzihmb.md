```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwu-xzihmb"
modified = 2025-11-25T22:36:00.606Z
upstream = ["CVE-2020-25674"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891928", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1891928", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25674"
imported = 2025-11-25T22:36:00.606Z
modified = 2024-11-21T05:18:25.833Z
published = 2020-12-08T22:15:17.320Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25674"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25674"
```

# WriteOnePNGImage() from coders/png.c (the PNG coder) has a for loop with an improper exit condition ...

WriteOnePNGImage() from coders/png.c (the PNG coder) has a for loop with an improper exit condition that can allow an out-of-bounds READ via heap-buffer-overflow. This occurs because it is possible for the colormap to have less than 256 valid values but the loop condition will loop 256 times, attempting to pass invalid colormap data to the event logger. The patch replaces the hardcoded 256 value with a call to MagickMin() to ensure the proper value is used. This could impact application availability when a specially crafted input file is processed by ImageMagick. This flaw affects ImageMagick versions prior to 7.0.8-68.

