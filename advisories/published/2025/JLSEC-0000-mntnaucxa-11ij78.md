```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxa-11ij78"
modified = 2025-11-25T22:36:00.622Z
upstream = ["CVE-2020-27768"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894689", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1894689", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2020-27768"
imported = 2025-11-25T22:36:00.622Z
modified = 2024-11-21T05:21:47.933Z
published = 2021-02-23T04:15:13.803Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27768"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27768"
```

# In ImageMagick, there is an outside the range of representable values of type 'unsigned int' at Magi...

In ImageMagick, there is an outside the range of representable values of type 'unsigned int' at MagickCore/quantum-private.h. This flaw affects ImageMagick versions prior to 7.0.9-0.

