```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc4k-k2b3nu"
modified = 2025-11-25T22:35:59.588Z
upstream = ["CVE-2014-9810"]
references = ["http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=68db5f601d4120170b91f5397e596c0b8f9d3a8e", "https://bugzilla.redhat.com/show_bug.cgi?id=1343466", "http://www.openwall.com/lists/oss-security/2014/12/24/1", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "https://anonscm.debian.org/cgit/collab-maint/imagemagick.git/commit/?h=debian-patches/6.8.9.9-4-for-upstream&id=68db5f601d4120170b91f5397e596c0b8f9d3a8e", "https://bugzilla.redhat.com/show_bug.cgi?id=1343466"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9810"
imported = 2025-11-25T22:35:59.588Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-30T15:59:00.407Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9810"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9810"
```

# The dpx file handler in ImageMagick allows remote attackers to cause a denial of service (segmentati...

The dpx file handler in ImageMagick allows remote attackers to cause a denial of service (segmentation fault and application crash) via a malformed dpx file.

