```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5r-byxzck"
modified = 2025-11-25T22:35:59.631Z
upstream = ["CVE-2016-7535"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545180", "https://bugzilla.redhat.com/show_bug.cgi?id=1378768", "https://github.com/ImageMagick/ImageMagick/issues/128", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93131", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545180", "https://bugzilla.redhat.com/show_bug.cgi?id=1378768", "https://github.com/ImageMagick/ImageMagick/issues/128"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7535"
imported = 2025-11-25T22:35:59.631Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.390Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7535"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7535"
```

# coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds writ...

coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds write) via a crafted PSD file.

