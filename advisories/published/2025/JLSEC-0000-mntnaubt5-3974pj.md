```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubt5-3974pj"
modified = 2025-11-25T22:35:59.177Z
upstream = ["CVE-2016-5687"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html", "http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-5687"
imported = 2025-11-25T22:35:59.177Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-12-13T15:59:00.183Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5687"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5687"
```

# The VerticalFilter function in the DDS coder in ImageMagick before 6.9.4-3 and 7.x before 7.0.1-4 al...

The VerticalFilter function in the DDS coder in ImageMagick before 6.9.4-3 and 7.x before 7.0.1-4 allows remote attackers to have unspecified impact via a crafted DDS file, which triggers an out-of-bounds read.

