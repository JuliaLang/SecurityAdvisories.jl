```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvt-iq6lvx"
modified = 2025-11-25T22:36:00.569Z
upstream = ["CVE-2016-7524"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537422", "https://bugzilla.redhat.com/show_bug.cgi?id=1378762", "https://github.com/ImageMagick/ImageMagick/commit/97c9f438a9b3454d085895f4d1f66389fd22a0fb", "https://github.com/ImageMagick/ImageMagick/commit/f8c318d462270b03e77f082e2a3a32867cacd3c6", "https://github.com/ImageMagick/ImageMagick/issues/96", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537422", "https://bugzilla.redhat.com/show_bug.cgi?id=1378762", "https://github.com/ImageMagick/ImageMagick/commit/97c9f438a9b3454d085895f4d1f66389fd22a0fb", "https://github.com/ImageMagick/ImageMagick/commit/f8c318d462270b03e77f082e2a3a32867cacd3c6", "https://github.com/ImageMagick/ImageMagick/issues/96"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7524"
imported = 2025-11-25T22:36:00.569Z
modified = 2024-11-21T02:58:08.750Z
published = 2020-02-06T14:15:10.830Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7524"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7524"
```

# coders/meta.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds rea...

coders/meta.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted file.

