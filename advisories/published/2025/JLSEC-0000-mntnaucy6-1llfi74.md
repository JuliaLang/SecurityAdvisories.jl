```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy6-1llfi74"
modified = 2025-11-25T22:36:00.654Z
upstream = ["CVE-2023-1906"]
references = ["https://access.redhat.com/security/cve/CVE-2023-1906", "https://bugzilla.redhat.com/show_bug.cgi?id=2185714", "https://github.com/ImageMagick/ImageMagick/commit/d7a8bdd7bb33cf8e58bc01b4a4f2ea5466f8c6b3", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-35q2-86c7-9247", "https://github.com/ImageMagick/ImageMagick6/commit/e30c693b37c3b41723f1469d1226a2c814ca443d", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6655G3GPS42WQM32DJHUCZALI2URQSCO/", "https://access.redhat.com/security/cve/CVE-2023-1906", "https://bugzilla.redhat.com/show_bug.cgi?id=2185714", "https://github.com/ImageMagick/ImageMagick/commit/d7a8bdd7bb33cf8e58bc01b4a4f2ea5466f8c6b3", "https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-35q2-86c7-9247", "https://github.com/ImageMagick/ImageMagick6/commit/e30c693b37c3b41723f1469d1226a2c814ca443d", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/6655G3GPS42WQM32DJHUCZALI2URQSCO/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2023-1906"
imported = 2025-11-25T22:36:00.654Z
modified = 2025-02-10T17:15:15.963Z
published = 2023-04-12T22:15:11.967Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-1906"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-1906"
```

# A heap-based buffer overflow issue was discovered in ImageMagick's ImportMultiSpectralQuantum() func...

A heap-based buffer overflow issue was discovered in ImageMagick's ImportMultiSpectralQuantum() function in MagickCore/quantum-import.c. An attacker could pass specially crafted file to convert, triggering an out-of-bounds read error, allowing an application to crash, resulting in a denial of service.

