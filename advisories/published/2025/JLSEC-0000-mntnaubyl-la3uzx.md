```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyl-la3uzx"
modified = 2025-11-25T22:35:59.373Z
upstream = ["CVE-2014-9915"]
references = ["http://www.openwall.com/lists/oss-security/2016/12/26/9", "https://bugzilla.redhat.com/show_bug.cgi?id=1410436", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "https://bugzilla.redhat.com/show_bug.cgi?id=1410436"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-9915"
imported = 2025-11-25T22:35:59.373Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.237Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-9915"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-9915"
```

# Off-by-one error in ImageMagick before 6.6.0-4 allows remote attackers to cause a denial of service ...

Off-by-one error in ImageMagick before 6.6.0-4 allows remote attackers to cause a denial of service (application crash) via a crafted 8BIM profile.

