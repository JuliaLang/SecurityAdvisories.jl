```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucww-1f5qrfh"
modified = 2025-11-25T22:36:00.608Z
upstream = ["CVE-2020-25676"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891934", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1891934", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25676"
imported = 2025-11-25T22:36:00.608Z
modified = 2024-11-21T05:18:26.283Z
published = 2020-12-08T22:15:17.477Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25676"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25676"
```

# In CatromWeights(), MeshInterpolate(), InterpolatePixelChannel(), InterpolatePixelChannels(), and In...

In CatromWeights(), MeshInterpolate(), InterpolatePixelChannel(), InterpolatePixelChannels(), and InterpolatePixelInfo(), which are all functions in /MagickCore/pixel.c, there were multiple unconstrained pixel offset calculations which were being used with the floor() function. These calculations produced undefined behavior in the form of out-of-range and integer overflows, as identified by UndefinedBehaviorSanitizer. These instances of undefined behavior could be triggered by an attacker who is able to supply a crafted input file to be processed by ImageMagick. These issues could impact application availability or potentially cause other problems related to undefined behavior. This flaw affects ImageMagick versions prior to 7.0.9-0.

