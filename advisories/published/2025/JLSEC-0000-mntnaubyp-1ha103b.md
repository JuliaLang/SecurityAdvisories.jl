```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyp-1ha103b"
modified = 2025-11-25T22:35:59.377Z
upstream = ["CVE-2016-10051"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95187", "https://bugzilla.redhat.com/show_bug.cgi?id=1410456", "https://github.com/ImageMagick/ImageMagick/commit/548701354191a3dda5cffc6d415374b35b01d0b9", "https://github.com/ImageMagick/ImageMagick/commit/ecc03a2518c2b7dd375fde3a040fdae0bdf6a521", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30245", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95187", "https://bugzilla.redhat.com/show_bug.cgi?id=1410456", "https://github.com/ImageMagick/ImageMagick/commit/548701354191a3dda5cffc6d415374b35b01d0b9", "https://github.com/ImageMagick/ImageMagick/commit/ecc03a2518c2b7dd375fde3a040fdae0bdf6a521", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=30245"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10051"
imported = 2025-11-25T22:35:59.377Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.470Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10051"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10051"
```

# Use-after-free vulnerability in the ReadPWPImage function in coders/pwp.c in ImageMagick 6.9.5-5 all...

Use-after-free vulnerability in the ReadPWPImage function in coders/pwp.c in ImageMagick 6.9.5-5 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file.

