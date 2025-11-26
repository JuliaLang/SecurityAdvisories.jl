```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucx0-bgy176"
modified = 2025-11-25T22:36:00.612Z
upstream = ["CVE-2020-27752"]
references = ["https://bugzilla.redhat.com/show_bug.cgi?id=1894226", "https://bugzilla.redhat.com/show_bug.cgi?id=1894226"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-27752"
imported = 2025-11-25T22:36:00.612Z
modified = 2024-11-21T05:21:45.740Z
published = 2020-12-08T22:15:18.070Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-27752"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-27752"
```

# A flaw was found in ImageMagick in MagickCore/quantum-private.h

A flaw was found in ImageMagick in MagickCore/quantum-private.h. An attacker who submits a crafted file that is processed by ImageMagick could trigger a heap buffer overflow. This would most likely lead to an impact to application availability, but could potentially lead to an impact to data integrity as well. This flaw affects ImageMagick versions prior to 7.0.9-0.

