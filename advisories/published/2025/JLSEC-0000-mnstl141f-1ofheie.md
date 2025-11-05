```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnstl141f-1ofheie"
modified = 2025-11-05T03:28:06.579Z
upstream = ["CVE-2022-48541"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/2889", "https://lists.debian.org/debian-lts-announce/2024/03/msg00020.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LICYTADFJAFPZW3Y2MKNCJIUYODPAG4L/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YAULDP3GG5KI3XITQ5XSMRSILCBZS2VK/", "https://github.com/ImageMagick/ImageMagick/issues/2889", "https://lists.debian.org/debian-lts-announce/2024/03/msg00020.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LICYTADFJAFPZW3Y2MKNCJIUYODPAG4L/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/YAULDP3GG5KI3XITQ5XSMRSILCBZS2VK/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LICYTADFJAFPZW3Y2MKNCJIUYODPAG4L/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/YAULDP3GG5KI3XITQ5XSMRSILCBZS2VK/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = [">= 6.9.12+0, < 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-48541"
imported = 2025-11-05T03:28:06.579Z
modified = 2025-11-04T19:15:41.277Z
published = 2023-08-22T19:16:31.443Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-48541"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-48541"
```

# A memory leak in ImageMagick 7.0.10-45 and 6.9.11-22 allows remote attackers to perform a denial of ...

A memory leak in ImageMagick 7.0.10-45 and 6.9.11-22 allows remote attackers to perform a denial of service via the "identify -help" command.

