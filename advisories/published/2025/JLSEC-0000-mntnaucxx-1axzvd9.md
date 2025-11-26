```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxx-1axzvd9"
modified = 2025-11-25T22:36:00.645Z
upstream = ["CVE-2022-32547"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=2091813", "https://github.com/ImageMagick/ImageMagick/commit/eac8ce4d873f28bb6a46aa3a662fb196b49b95d0", "https://github.com/ImageMagick/ImageMagick6/commit/dc070da861a015d3c97488fdcca6063b44d47a7b", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=2091813", "https://github.com/ImageMagick/ImageMagick/commit/eac8ce4d873f28bb6a46aa3a662fb196b49b95d0", "https://github.com/ImageMagick/ImageMagick6/commit/dc070da861a015d3c97488fdcca6063b44d47a7b", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-32547"
imported = 2025-11-25T22:36:00.645Z
modified = 2024-11-21T07:06:36.160Z
published = 2022-06-16T18:15:10.983Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-32547"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-32547"
```

# In ImageMagick, there is load of misaligned address for type 'double', which requires 8 byte alignme...

In ImageMagick, there is load of misaligned address for type 'double', which requires 8 byte alignment and for type 'float', which requires 4 byte alignment at MagickCore/property.c. Whenever crafted or untrusted input is processed by ImageMagick, this causes a negative impact to application availability or other problems related to undefined behavior.

