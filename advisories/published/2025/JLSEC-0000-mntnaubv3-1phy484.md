```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubv3-1phy484"
modified = 2025-11-25T22:35:59.247Z
upstream = ["CVE-2016-10070"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95221", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545366", "https://bugzilla.redhat.com/show_bug.cgi?id=1410510", "https://github.com/ImageMagick/ImageMagick/commit/a6240a163cb787909703d9fc649cf861f60ddd7c", "https://github.com/ImageMagick/ImageMagick/commit/b173a352397877775c51c9a0e9d59eb6ce24c455", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95221", "https://bugs.launchpad.net/ubuntu/+source/imagemagick/+bug/1545366", "https://bugzilla.redhat.com/show_bug.cgi?id=1410510", "https://github.com/ImageMagick/ImageMagick/commit/a6240a163cb787909703d9fc649cf861f60ddd7c", "https://github.com/ImageMagick/ImageMagick/commit/b173a352397877775c51c9a0e9d59eb6ce24c455"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10070"
imported = 2025-11-25T22:35:59.247Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-03T18:59:00.147Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10070"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10070"
```

# Heap-based buffer overflow in the CalcMinMax function in coders/mat.c in ImageMagick before 6.9.4-0 ...

Heap-based buffer overflow in the CalcMinMax function in coders/mat.c in ImageMagick before 6.9.4-0 allows remote attackers to cause a denial of service (out-of-bounds read and application crash) via a crafted mat file.

