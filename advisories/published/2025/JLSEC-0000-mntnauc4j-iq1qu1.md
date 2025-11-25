```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4j-iq1qu1"
modified = 2025-11-25T22:35:59.587Z
upstream = ["CVE-2014-9808"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=82f779cbc24045af2eaecb95d0842ca7b97c71f4", "https://bugzilla.redhat.com/show_bug.cgi?id=1343464", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=82f779cbc24045af2eaecb95d0842ca7b97c71f4", "https://bugzilla.redhat.com/show_bug.cgi?id=1343464"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9808"
imported = 2025-11-25T22:35:59.587Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.327Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9808"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9808"
```

# ImageMagick allows remote attackers to cause a denial of service (segmentation fault and application...

ImageMagick allows remote attackers to cause a denial of service (segmentation fault and application crash) via a crafted dpc image.

