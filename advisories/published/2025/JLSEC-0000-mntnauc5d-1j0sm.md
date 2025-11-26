```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5d-1j0sm"
modified = 2025-11-25T22:35:59.617Z
upstream = ["CVE-2015-8957"]
references = ["http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26838", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93125", "https://bugzilla.redhat.com/show_bug.cgi?id=1378735", "https://github.com/ImageMagick/ImageMagick/commit/450bd716ed3b9186dd10f9e60f630a3d9eeea2a4", "https://github.com/ImageMagick/ImageMagick/commit/78f82d9d1c2944725a279acd573a22168dc6e22a", "https://github.com/ImageMagick/ImageMagick/commit/bd96074b254c6607a0f7731e59f923ad19d5a46d", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26838", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93125", "https://bugzilla.redhat.com/show_bug.cgi?id=1378735", "https://github.com/ImageMagick/ImageMagick/commit/450bd716ed3b9186dd10f9e60f630a3d9eeea2a4", "https://github.com/ImageMagick/ImageMagick/commit/78f82d9d1c2944725a279acd573a22168dc6e22a", "https://github.com/ImageMagick/ImageMagick/commit/bd96074b254c6607a0f7731e59f923ad19d5a46d"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8957"
imported = 2025-11-25T22:35:59.617Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.157Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8957"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8957"
```

# Buffer overflow in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of serv...

Buffer overflow in ImageMagick before 6.9.0-4 Beta allows remote attackers to cause a denial of service (application crash) via a crafted SUN file.

