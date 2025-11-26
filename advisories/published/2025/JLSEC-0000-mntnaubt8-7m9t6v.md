```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubt8-7m9t6v"
modified = 2025-11-25T22:35:59.180Z
upstream = ["CVE-2016-5688"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html", "https://github.com/ImageMagick/ImageMagick/commit/aecd0ada163a4d6c769cec178955d5f3e9316f2f", "https://github.com/ImageMagick/ImageMagick/commit/fc43974d34318c834fbf78570ca1a3764ed8c7d7", "https://github.com/ImageMagick/ImageMagick/commits/6.9.4-4", "https://github.com/ImageMagick/ImageMagick/commits/7.0.1-5", "http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html", "https://github.com/ImageMagick/ImageMagick/commit/aecd0ada163a4d6c769cec178955d5f3e9316f2f", "https://github.com/ImageMagick/ImageMagick/commit/fc43974d34318c834fbf78570ca1a3764ed8c7d7", "https://github.com/ImageMagick/ImageMagick/commits/6.9.4-4", "https://github.com/ImageMagick/ImageMagick/commits/7.0.1-5"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-5688"
imported = 2025-11-25T22:35:59.180Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-12-13T15:59:01.217Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5688"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5688"
```

# The WPG parser in ImageMagick before 6.9.4-4 and 7.x before 7.0.1-5, when a memory limit is set, all...

The WPG parser in ImageMagick before 6.9.4-4 and 7.x before 7.0.1-5, when a memory limit is set, allows remote attackers to have unspecified impact via vectors related to the SetImageExtent return-value check, which trigger (1) a heap-based buffer overflow in the SetPixelIndex function or an invalid write operation in the (2) ScaleCharToQuantum or (3) SetPixelIndex functions.

