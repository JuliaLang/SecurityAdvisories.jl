```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwi-59rp7s"
modified = 2025-11-25T22:36:00.594Z
upstream = ["CVE-2020-27775"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1898300", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1898300", "https://lists.debian.org/debian-lts-announce/2021/03/msg00030.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27775"
imported = 2025-11-25T22:36:00.594Z
modified = 2024-11-21T05:21:48.753Z
published = 2020-12-04T21:15:12.637Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27775"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27775"
```

# A flaw was found in ImageMagick in MagickCore/quantum.h

A flaw was found in ImageMagick in MagickCore/quantum.h. An attacker who submits a crafted file that is processed by ImageMagick could trigger undefined behavior in the form of values outside the range of type unsigned char. This would most likely lead to an impact to application availability, but could potentially cause other problems related to undefined behavior. This flaw affects ImageMagick versions prior to 7.0.9-0.

