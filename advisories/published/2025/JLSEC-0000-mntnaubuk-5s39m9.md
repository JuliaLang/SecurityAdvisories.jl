```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubuk-5s39m9"
modified = 2025-11-25T22:35:59.228Z
upstream = ["CVE-2016-8862"]
references = ["http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/20/2", "http://www.openwall.com/lists/oss-security/2016/10/20/3", "http://www.securityfocus.com/bid/93794", "https://blogs.gentoo.org/ago/2016/10/17/imagemagick-memory-allocation-failure-in-acquiremagickmemory-memory-c/", "https://bugzilla.redhat.com/show_bug.cgi?id=1387135", "https://github.com/ImageMagick/ImageMagick/issues/271", "http://www.debian.org/security/2016/dsa-3726", "http://www.openwall.com/lists/oss-security/2016/10/20/2", "http://www.openwall.com/lists/oss-security/2016/10/20/3", "http://www.securityfocus.com/bid/93794", "https://blogs.gentoo.org/ago/2016/10/17/imagemagick-memory-allocation-failure-in-acquiremagickmemory-memory-c/", "https://bugzilla.redhat.com/show_bug.cgi?id=1387135", "https://github.com/ImageMagick/ImageMagick/issues/271"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-8862"
imported = 2025-11-25T22:35:59.228Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-15T19:59:00.970Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-8862"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-8862"
```

# The AcquireMagickMemory function in MagickCore/memory.c in ImageMagick before 7.0.3.3 allows remote ...

The AcquireMagickMemory function in MagickCore/memory.c in ImageMagick before 7.0.3.3 allows remote attackers to have unspecified impact via a crafted image, which triggers a memory allocation failure.

