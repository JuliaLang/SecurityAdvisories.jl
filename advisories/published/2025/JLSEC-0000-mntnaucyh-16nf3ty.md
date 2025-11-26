```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucyh-16nf3ty"
modified = 2025-11-25T22:36:00.665Z
upstream = ["CVE-2023-5341"]
references = ["https://access.redhat.com/security/cve/CVE-2023-5341", "https://bugzilla.redhat.com/show_bug.cgi?id=2241774", "https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1", "https://access.redhat.com/security/cve/CVE-2023-5341", "https://bugzilla.redhat.com/show_bug.cgi?id=2241774", "https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1", "https://lists.debian.org/debian-lts-announce/2024/02/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/LICYTADFJAFPZW3Y2MKNCJIUYODPAG4L/", "https://lists.fedoraproject.org/archives/list/package-announce@lists.fedoraproject.org/message/YAULDP3GG5KI3XITQ5XSMRSILCBZS2VK/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["*"]

[[jlsec_sources]]
id = "CVE-2023-5341"
imported = 2025-11-25T22:36:00.665Z
modified = 2025-02-07T03:15:10.433Z
published = 2023-11-19T10:15:49.433Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-5341"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-5341"
```

# A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.

A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.

