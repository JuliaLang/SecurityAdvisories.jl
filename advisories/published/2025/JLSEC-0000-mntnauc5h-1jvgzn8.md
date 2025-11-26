```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauc5h-1jvgzn8"
modified = 2025-11-25T22:35:59.621Z
upstream = ["CVE-2016-7514"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93122", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533442", "https://bugzilla.redhat.com/show_bug.cgi?id=1378739", "https://github.com/ImageMagick/ImageMagick/commit/198fffab4daf8aea88badd9c629350e5b26ec32f", "https://github.com/ImageMagick/ImageMagick/commit/280215b9936d145dd5ee91403738ccce1333cab1", "https://github.com/ImageMagick/ImageMagick/commit/6f1879d498bcc5cce12fe0c5decb8dbc0f608e5d", "https://github.com/ImageMagick/ImageMagick/commit/e14fd0a2801f73bdc123baf4fbab97dec55919eb", "https://github.com/ImageMagick/ImageMagick/issues/83", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "http://www.securityfocus.com/bid/93122", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1533442", "https://bugzilla.redhat.com/show_bug.cgi?id=1378739", "https://github.com/ImageMagick/ImageMagick/commit/198fffab4daf8aea88badd9c629350e5b26ec32f", "https://github.com/ImageMagick/ImageMagick/commit/280215b9936d145dd5ee91403738ccce1333cab1", "https://github.com/ImageMagick/ImageMagick/commit/6f1879d498bcc5cce12fe0c5decb8dbc0f608e5d", "https://github.com/ImageMagick/ImageMagick/commit/e14fd0a2801f73bdc123baf4fbab97dec55919eb", "https://github.com/ImageMagick/ImageMagick/issues/83"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.0+0"]

[[jlsec_sources]]
id = "CVE-2016-7514"
imported = 2025-11-25T22:35:59.621Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-04-20T18:59:00.873Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7514"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7514"
```

# The ReadPSDChannelPixels function in coders/psd.c in ImageMagick allows remote attackers to cause a ...

The ReadPSDChannelPixels function in coders/psd.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted PSD file.

