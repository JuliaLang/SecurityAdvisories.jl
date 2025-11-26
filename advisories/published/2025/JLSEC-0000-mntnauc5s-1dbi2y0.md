```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5s-1dbi2y0"
modified = 2025-11-25T22:35:59.632Z
upstream = ["CVE-2016-7536"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93225", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545367", "https://bugzilla.redhat.com/show_bug.cgi?id=1378772", "https://github.com/ImageMagick/ImageMagick/commit/02dadf116124cfba35d7ebd9ced3e5ad0be0f176", "https://github.com/ImageMagick/ImageMagick/commit/478cce544fdf1de882d78381768458f397964453", "https://github.com/ImageMagick/ImageMagick/issues/130", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93225", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545367", "https://bugzilla.redhat.com/show_bug.cgi?id=1378772", "https://github.com/ImageMagick/ImageMagick/commit/02dadf116124cfba35d7ebd9ced3e5ad0be0f176", "https://github.com/ImageMagick/ImageMagick/commit/478cce544fdf1de882d78381768458f397964453", "https://github.com/ImageMagick/ImageMagick/issues/130"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7536"
imported = 2025-11-25T22:35:59.632Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:01.437Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7536"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7536"
```

# magick/profile.c in ImageMagick allows remote attackers to cause a denial of service (segmentation f...

magick/profile.c in ImageMagick allows remote attackers to cause a denial of service (segmentation fault) via a crafted profile.

