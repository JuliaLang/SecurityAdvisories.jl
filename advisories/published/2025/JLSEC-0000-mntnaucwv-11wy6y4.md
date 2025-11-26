```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwv-11wy6y4"
modified = 2025-11-25T22:36:00.607Z
upstream = ["CVE-2020-25675"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1891933", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1891933", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-25675"
imported = 2025-11-25T22:36:00.607Z
modified = 2024-11-21T05:18:26.113Z
published = 2020-12-08T22:15:17.397Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-25675"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-25675"
```

# In the CropImage() and CropImageToTiles() routines of MagickCore/transform.c, rounding calculations ...

In the CropImage() and CropImageToTiles() routines of MagickCore/transform.c, rounding calculations performed on unconstrained pixel offsets was causing undefined behavior in the form of integer overflow and out-of-range values as reported by UndefinedBehaviorSanitizer. Such issues could cause a negative impact to application availability or other problems related to undefined behavior, in cases where ImageMagick processes untrusted input data. The upstream patch introduces functionality to constrain the pixel offsets and prevent these issues. This flaw affects ImageMagick versions prior to 7.0.9-0.

