```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubx4-k72t66"
modified = 2025-11-25T22:35:59.320Z
upstream = ["CVE-2015-8898"]
references = ["http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91039", "https://access.redhat.com/errata/RHSA-2016:1237", "https://github.com/ImageMagick/ImageMagick/commit/5b4bebaa91849c592a8448bc353ab25a54ff8c44", "https://github.com/ImageMagick/ImageMagick/pull/34", "http://www.openwall.com/lists/oss-security/2016/06/02/13", "http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html", "http://www.securityfocus.com/bid/91039", "https://access.redhat.com/errata/RHSA-2016:1237", "https://github.com/ImageMagick/ImageMagick/commit/5b4bebaa91849c592a8448bc353ab25a54ff8c44", "https://github.com/ImageMagick/ImageMagick/pull/34"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2015-8898"
imported = 2025-11-25T22:35:59.320Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-15T19:59:00.330Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2015-8898"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2015-8898"
```

# The WriteImages function in magick/constitute.c in ImageMagick before 6.9.2-4 allows remote attacker...

The WriteImages function in magick/constitute.c in ImageMagick before 6.9.2-4 allows remote attackers to cause a denial of service (NULL pointer dereference) via a crafted image file.

