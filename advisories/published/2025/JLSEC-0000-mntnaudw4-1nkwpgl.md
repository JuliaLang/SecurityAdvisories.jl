```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaudw4-1nkwpgl"
modified = 2025-11-25T22:36:01.876Z
aliases = ["CVE-2025-43965"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/bac413a26073923d3ffb258adaab07fb3fe8fdc9", "https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#711-44---2025-02-22", "https://lists.debian.org/debian-lts-announce/2025/04/msg00035.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1047+0"]

[[jlsec_sources]]
id = "CVE-2025-43965"
imported = 2025-11-25T22:36:01.858Z
modified = 2025-04-29T13:52:47.470Z
published = 2025-04-23T15:16:00.733Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-43965"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-43965"
[[jlsec_sources]]
id = "EUVD-2025-12200"
imported = 2025-11-25T22:36:01.897Z
modified = 2025-04-26T23:03:02.000Z
published = 2025-04-23T00:00:00.000Z
url = "https://euvdservices.enisa.europa.eu/api/enisaid?id=EUVD-2025-12200"
html_url = "https://euvd.enisa.europa.eu/vulnerability/EUVD-2025-12200"
fields = ["affected"]
```

# In MIFF image processing in ImageMagick before 7.1.1-44, image depth is mishandled after SetQuantumF...

In MIFF image processing in ImageMagick before 7.1.1-44, image depth is mishandled after SetQuantumFormat is used.

