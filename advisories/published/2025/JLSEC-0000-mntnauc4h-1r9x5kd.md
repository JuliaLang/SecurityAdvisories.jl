```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4h-1r9x5kd"
modified = 2025-11-25T22:35:59.585Z
upstream = ["CVE-2014-9806"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1343462", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://bugzilla.redhat.com/show_bug.cgi?id=1343462"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9806"
imported = 2025-11-25T22:35:59.585Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.250Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9806"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9806"
```

# ImageMagick allows remote attackers to cause a denial of service (file descriptor consumption) via a...

ImageMagick allows remote attackers to cause a denial of service (file descriptor consumption) via a crafted file.

