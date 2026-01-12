```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5f-ci7in"
modified = 2025-11-25T22:35:59.619Z
upstream = ["CVE-2015-8959"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26861", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93230", "https://bugzilla.redhat.com/show_bug.cgi?id=1378738", "https://github.com/ImageMagick/ImageMagick/commit/3ab016764c7f787829d9065440d86f5609765110", "https://github.com/ImageMagick/ImageMagick/commit/9b428b7af688fe319320aed15f2b94281d1e37b4", "https://github.com/ImageMagick/ImageMagick/commit/cc2a4d2ba5371d25c58763e4db2dbc1f4691c0f7", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26861", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93230", "https://bugzilla.redhat.com/show_bug.cgi?id=1378738", "https://github.com/ImageMagick/ImageMagick/commit/3ab016764c7f787829d9065440d86f5609765110", "https://github.com/ImageMagick/ImageMagick/commit/9b428b7af688fe319320aed15f2b94281d1e37b4", "https://github.com/ImageMagick/ImageMagick/commit/cc2a4d2ba5371d25c58763e4db2dbc1f4691c0f7"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8959"
imported = 2025-11-25T22:35:59.619Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.263Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8959"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8959"
```

# coders/dds.c in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of service...

coders/dds.c in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of service (CPU consumption) via a crafted DDS file.

