```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx5-19b7y3k"
modified = 2025-11-25T22:36:00.617Z
upstream = ["CVE-2020-27756"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894233", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894233", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27756"
imported = 2025-11-25T22:36:00.617Z
modified = 2024-11-21T05:21:46.260Z
published = 2020-12-08T22:15:18.383Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27756"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27756"
```

# In ParseMetaGeometry() of MagickCore/geometry.c, image height and width calculations can lead to div...

In ParseMetaGeometry() of MagickCore/geometry.c, image height and width calculations can lead to divide-by-zero conditions which also lead to undefined behavior. This flaw can be triggered by a crafted input file processed by ImageMagick and could impact application availability. The patch uses multiplication in addition to the function `PerceptibleReciprocal()` in order to prevent such divide-by-zero conditions. This flaw affects ImageMagick versions prior to 7.0.9-0.

