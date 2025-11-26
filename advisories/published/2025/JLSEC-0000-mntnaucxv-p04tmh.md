```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxv-p04tmh"
modified = 2025-11-25T22:36:00.643Z
upstream = ["CVE-2022-32546"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2091812", "https://github.com/ImageMagick/ImageMagick/commit/f221ea0fa3171f0f4fdf74ac9d81b203b9534c23", "https://github.com/ImageMagick/ImageMagick6/commit/29c8abce0da56b536542f76a9ddfebdaab5b2943", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2091812", "https://github.com/ImageMagick/ImageMagick/commit/f221ea0fa3171f0f4fdf74ac9d81b203b9534c23", "https://github.com/ImageMagick/ImageMagick6/commit/29c8abce0da56b536542f76a9ddfebdaab5b2943", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-32546"
imported = 2025-11-25T22:36:00.643Z
modified = 2024-11-21T07:06:36.030Z
published = 2022-06-16T18:15:10.927Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-32546"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-32546"
```

# A vulnerability was found in ImageMagick, causing an outside the range of representable values of ty...

A vulnerability was found in ImageMagick, causing an outside the range of representable values of type 'unsigned long' at coders/pcl.c, when crafted or untrusted input is processed. This leads to a negative impact to application availability or other problems related to undefined behavior.

