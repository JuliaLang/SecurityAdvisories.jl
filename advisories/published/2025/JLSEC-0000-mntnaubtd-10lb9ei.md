```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubtd-10lb9ei"
modified = 2025-11-25T22:35:59.185Z
upstream = ["CVE-2016-5689"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html", "https://github.com/ImageMagick/ImageMagick/blob/6.9.4-5/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.1-7/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/5511ef530576ed18fd636baa3bb4eda3d667665d", "http://www.openwall.com/lists/oss-security/2016/06/14/5", "http://www.openwall.com/lists/oss-security/2016/06/17/3", "http://www.oracle.com/technetwork/topics/security/bulletinjul2016-3090568.html", "http://www.securityfocus.com/bid/91283", "https://blog.fuzzing-project.org/46-Various-invalid-memory-reads-in-ImageMagick-WPG%2C-DDS%2C-DCM.html", "https://github.com/ImageMagick/ImageMagick/blob/6.9.4-5/ChangeLog", "https://github.com/ImageMagick/ImageMagick/blob/7.0.1-7/ChangeLog", "https://github.com/ImageMagick/ImageMagick/commit/5511ef530576ed18fd636baa3bb4eda3d667665d"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-5689"
imported = 2025-11-25T22:35:59.185Z
modified = 2025-04-12T10:46:40.837Z
published = 2016-12-13T15:59:02.530Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-5689"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-5689"
```

# The DCM reader in ImageMagick before 6.9.4-5 and 7.x before 7.0.1-7 allows remote attackers to have ...

The DCM reader in ImageMagick before 6.9.4-5 and 7.x before 7.0.1-7 allows remote attackers to have unspecified impact by leveraging lack of NULL pointer checks.

