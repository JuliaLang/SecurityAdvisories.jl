```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvs-n4icah"
modified = 2025-11-25T22:36:00.568Z
upstream = ["CVE-2016-7523"]
references = ["http://www.openwall.com/lists/oss-security/2016/09/22/2", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537420", "https://bugzilla.redhat.com/show_bug.cgi?id=1378754", "https://github.com/ImageMagick/ImageMagick/issues/94", "http://www.openwall.com/lists/oss-security/2016/09/22/2", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1537420", "https://bugzilla.redhat.com/show_bug.cgi?id=1378754", "https://github.com/ImageMagick/ImageMagick/issues/94"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-7523"
imported = 2025-11-25T22:36:00.568Z
modified = 2024-11-21T02:58:08.640Z
published = 2020-02-06T14:15:10.737Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-7523"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-7523"
```

# coders/meta.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds rea...

coders/meta.c in ImageMagick allows remote attackers to cause a denial of service (out-of-bounds read) via a crafted file.

