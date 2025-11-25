```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucul-1cleaje"
modified = 2025-11-25T22:36:00.525Z
upstream = ["CVE-2019-10131"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00051.html", "http://lists.opensuse.org/opensuse-security-announce/2019-07/msg00001.html", "http://www.securityfocus.com/bid/108117", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10131", "https://github.com/ImageMagick/ImageMagick/commit/cb1214c124e1bd61f7dd551b94a794864861592e", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4034-1/", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00051.html", "http://lists.opensuse.org/opensuse-security-announce/2019-07/msg00001.html", "http://www.securityfocus.com/bid/108117", "https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10131", "https://github.com/ImageMagick/ImageMagick/commit/cb1214c124e1bd61f7dd551b94a794864861592e", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4034-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2019-10131"
imported = 2025-11-25T22:36:00.525Z
modified = 2024-11-21T04:18:28.863Z
published = 2019-04-30T19:29:03.717Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-10131"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-10131"
```

# An off-by-one read vulnerability was discovered in ImageMagick before version 7.0.7-28 in the format...

An off-by-one read vulnerability was discovered in ImageMagick before version 7.0.7-28 in the formatIPTCfromBuffer function in coders/meta.c. A local attacker may use this flaw to read beyond the end of the buffer or to crash the program.

