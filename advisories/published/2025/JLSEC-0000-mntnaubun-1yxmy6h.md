```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubun-1yxmy6h"
modified = 2025-11-25T22:35:59.231Z
upstream = ["CVE-2016-8677"]
references = ["http://lists.opensuse.org/opensuse-updates/2016-10/msg00107.html", "http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/16/1", "http://www.securityfocus.com/bid/93598", "https://blogs.gentoo.org/ago/2016/10/07/imagemagick-memory-allocate-failure-in-acquirequantumpixels-quantum-c/", "https://bugzilla.redhat.com/show_bug.cgi?id=1385698", "https://github.com/ImageMagick/ImageMagick/commit/6e48aa92ff4e6e95424300ecd52a9ea453c19c60", "https://github.com/ImageMagick/ImageMagick/issues/268", "http://lists.opensuse.org/opensuse-updates/2016-10/msg00107.html", "http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/16/1", "http://www.securityfocus.com/bid/93598", "https://blogs.gentoo.org/ago/2016/10/07/imagemagick-memory-allocate-failure-in-acquirequantumpixels-quantum-c/", "https://bugzilla.redhat.com/show_bug.cgi?id=1385698", "https://github.com/ImageMagick/ImageMagick/commit/6e48aa92ff4e6e95424300ecd52a9ea453c19c60", "https://github.com/ImageMagick/ImageMagick/issues/268"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-8677"
imported = 2025-11-25T22:35:59.231Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-15T21:59:00.417Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-8677"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-8677"
```

# The AcquireQuantumPixels function in MagickCore/quantum.c in ImageMagick before 7.0.3-1 allows remot...

The AcquireQuantumPixels function in MagickCore/quantum.c in ImageMagick before 7.0.3-1 allows remote attackers to have unspecified impact via a crafted image file, which triggers a memory allocation failure.

