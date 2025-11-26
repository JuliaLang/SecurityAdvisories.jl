```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxl-d7x6os"
modified = 2025-11-25T22:36:00.633Z
upstream = ["CVE-2020-27769"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894690", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894690", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2020-27769"
imported = 2025-11-25T22:36:00.633Z
modified = 2024-11-21T05:21:48.060Z
published = 2021-05-14T20:15:11.057Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27769"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27769"
```

# In ImageMagick versions before 7.0.9-0, there are outside the range of representable values of type ...

In ImageMagick versions before 7.0.9-0, there are outside the range of representable values of type 'float' at MagickCore/quantize.c.

