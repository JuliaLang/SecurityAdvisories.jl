```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucxk-1vqryty"
modified = 2025-11-25T22:36:00.632Z
upstream = ["CVE-2021-20313"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1947019", "https://lists.debian.org/debian-lts-announce/2021/06/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html", "https://bugzilla.redhat.com/show_bug.cgi?id=1947019", "https://lists.debian.org/debian-lts-announce/2021/06/msg00000.html", "https://lists.debian.org/debian-lts-announce/2023/05/msg00020.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2021-20313"
imported = 2025-11-25T22:36:00.632Z
modified = 2024-11-21T05:46:21.357Z
published = 2021-05-11T23:15:08.893Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2021-20313"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2021-20313"
```

# A flaw was found in ImageMagick in versions before 7.0.11

A flaw was found in ImageMagick in versions before 7.0.11. A potential cipher leak when the calculate signatures in TransformSignature is possible. The highest threat from this vulnerability is to data confidentiality.

