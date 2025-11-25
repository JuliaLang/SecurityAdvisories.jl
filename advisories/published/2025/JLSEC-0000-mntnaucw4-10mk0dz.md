```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucw4-10mk0dz"
modified = 2025-11-25T22:36:00.580Z
upstream = ["CVE-2020-27760"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894239", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894239", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27760"
imported = 2025-11-25T22:36:00.580Z
modified = 2024-11-21T05:21:46.817Z
published = 2020-12-03T17:15:12.770Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27760"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27760"
```

# In `GammaImage()` of /MagickCore/enhance.c, depending on the `gamma` value, it's possible to trigger...

In `GammaImage()` of /MagickCore/enhance.c, depending on the `gamma` value, it's possible to trigger a divide-by-zero condition when a crafted input file is processed by ImageMagick. This could lead to an impact to application availability. The patch uses the `PerceptibleReciprocal()` to prevent the divide-by-zero from occurring. This flaw affects ImageMagick versions prior to ImageMagick 7.0.8-68.

