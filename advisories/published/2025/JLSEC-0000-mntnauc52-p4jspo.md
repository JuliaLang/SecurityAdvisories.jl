```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc52-p4jspo"
modified = 2025-11-25T22:35:59.606Z
upstream = ["CVE-2014-8716"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26456", "http://www.securityfocus.com/bid/70992", "https://bugzilla.redhat.com/show_bug.cgi?id=1164248", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26456", "http://www.securityfocus.com/bid/70992", "https://bugzilla.redhat.com/show_bug.cgi?id=1164248"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2014-8716"
imported = 2025-11-25T22:35:59.606Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-11T19:59:00.313Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2014-8716"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2014-8716"
```

# The JPEG decoder in ImageMagick before 6.8.9-9 allows local users to cause a denial of service (out-...

The JPEG decoder in ImageMagick before 6.8.9-9 allows local users to cause a denial of service (out-of-bounds memory access and crash).

