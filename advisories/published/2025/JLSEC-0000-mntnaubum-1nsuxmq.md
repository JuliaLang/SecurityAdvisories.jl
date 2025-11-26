```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaubum-1nsuxmq"
modified = 2025-11-25T22:35:59.230Z
upstream = ["CVE-2016-8866"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00085.html", "http://lists.opensuse.org/opensuse-security-announce/2017-01/msg00006.html", "http://lists.opensuse.org/opensuse-updates/2016-12/msg00141.html", "http://www.openwall.com/lists/oss-security/2016/10/20/3", "http://www.openwall.com/lists/oss-security/2016/10/21/5", "https://blogs.gentoo.org/ago/2016/10/20/imagemagick-memory-allocation-failure-in-acquiremagickmemory-memory-c-incomplete-fix-for-cve-2016-8862/", "https://bugzilla.redhat.com/show_bug.cgi?id=1388816", "https://github.com/ImageMagick/ImageMagick/issues/271", "http://lists.opensuse.org/opensuse-security-announce/2016-12/msg00085.html", "http://lists.opensuse.org/opensuse-security-announce/2017-01/msg00006.html", "http://lists.opensuse.org/opensuse-updates/2016-12/msg00141.html", "http://www.openwall.com/lists/oss-security/2016/10/20/3", "http://www.openwall.com/lists/oss-security/2016/10/21/5", "https://blogs.gentoo.org/ago/2016/10/20/imagemagick-memory-allocation-failure-in-acquiremagickmemory-memory-c-incomplete-fix-for-cve-2016-8862/", "https://bugzilla.redhat.com/show_bug.cgi?id=1388816", "https://github.com/ImageMagick/ImageMagick/issues/271"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2016-8866"
imported = 2025-11-25T22:35:59.230Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-02-15T19:59:01.017Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2016-8866"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2016-8866"
```

# The AcquireMagickMemory function in MagickCore/memory.c in ImageMagick 7.0.3.3 before 7.0.3.8 allows...

The AcquireMagickMemory function in MagickCore/memory.c in ImageMagick 7.0.3.3 before 7.0.3.8 allows remote attackers to have unspecified impact via a crafted image, which triggers a memory allocation failure.  NOTE: this vulnerability exists because of an incomplete fix for CVE-2016-8862.

