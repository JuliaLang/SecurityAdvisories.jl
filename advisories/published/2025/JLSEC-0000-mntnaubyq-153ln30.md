```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubyq-153ln30"
modified = 2025-11-25T22:35:59.378Z
upstream = ["CVE-2016-10052"]
references = ["http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95181", "https://bugzilla.redhat.com/show_bug.cgi?id=1410459", "https://github.com/ImageMagick/ImageMagick/commit/13267a10845a8dadabed63072b537f050cec6daa", "https://github.com/ImageMagick/ImageMagick/commit/9e187b73a8a1290bb0e1a1c878f8be1917aa8742", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00028.html", "http://lists.opensuse.org/opensuse-updates/2017-02/msg00031.html", "http://www.openwall.com/lists/oss-security/2016/12/26/9", "http://www.securityfocus.com/bid/95181", "https://bugzilla.redhat.com/show_bug.cgi?id=1410459", "https://github.com/ImageMagick/ImageMagick/commit/13267a10845a8dadabed63072b537f050cec6daa", "https://github.com/ImageMagick/ImageMagick/commit/9e187b73a8a1290bb0e1a1c878f8be1917aa8742"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-10052"
imported = 2025-11-25T22:35:59.378Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-03-23T17:59:00.517Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-10052"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-10052"
```

# Buffer overflow in the WriteProfile function in coders/jpeg.c in ImageMagick before 6.9.5-6 allows r...

Buffer overflow in the WriteProfile function in coders/jpeg.c in ImageMagick before 6.9.5-6 allows remote attackers to cause a denial of service (application crash) or have other unspecified impact via a crafted file.

