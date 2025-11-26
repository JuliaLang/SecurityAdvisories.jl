```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucgg-yrfh56"
modified = 2025-11-25T22:36:00.016Z
upstream = ["CVE-2016-7539"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=28946", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93232", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833101", "https://bugzilla.redhat.com/show_bug.cgi?id=1378776", "https://github.com/ImageMagick/ImageMagick/commit/4e81ce8b07219c69a9aeccb0f7f7b927ca6db74c", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=28946", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93232", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833101", "https://bugzilla.redhat.com/show_bug.cgi?id=1378776", "https://github.com/ImageMagick/ImageMagick/commit/4e81ce8b07219c69a9aeccb0f7f7b927ca6db74c"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7539"
imported = 2025-11-25T22:36:00.016Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-25T14:29:00.253Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7539"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7539"
```

# Memory leak in AcquireVirtualMemory in ImageMagick before 7 allows remote attackers to cause a denia...

Memory leak in AcquireVirtualMemory in ImageMagick before 7 allows remote attackers to cause a denial of service (memory consumption) via unspecified vectors.

