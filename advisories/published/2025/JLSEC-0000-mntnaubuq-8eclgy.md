```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuq-8eclgy"
modified = 2025-11-25T22:35:59.234Z
upstream = ["CVE-2015-8900"]
references = ["http://trac.imagemagick.org/changeset/17845", "http://trac.imagemagick.org/changeset/17846", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26929", "http://www.openwall.com/lists/oss-security/2015/02/26/13", "http://www.openwall.com/lists/oss-security/2016/06/06/2", "https://bugzilla.redhat.com/show_bug.cgi?id=1195260", "https://github.com/ImageMagick/ImageMagick/commit/97aa7d7cfd2027f6ba7ce42caf8b798541b9cdc6", "http://trac.imagemagick.org/changeset/17845", "http://trac.imagemagick.org/changeset/17846", "http://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=26929", "http://www.openwall.com/lists/oss-security/2015/02/26/13", "http://www.openwall.com/lists/oss-security/2016/06/06/2", "https://bugzilla.redhat.com/show_bug.cgi?id=1195260", "https://github.com/ImageMagick/ImageMagick/commit/97aa7d7cfd2027f6ba7ce42caf8b798541b9cdc6"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8900"
imported = 2025-11-25T22:35:59.234Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-27T22:59:00.167Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8900"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8900"
```

# The ReadHDRImage function in coders/hdr.c in ImageMagick 6.x and 7.x allows remote attackers to caus...

The ReadHDRImage function in coders/hdr.c in ImageMagick 6.x and 7.x allows remote attackers to cause a denial of service (infinite loop) via a crafted HDR file.

