```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucu8-rxxs2j"
modified = 2025-11-25T22:36:00.512Z
upstream = ["CVE-2019-7395"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106850", "https://github.com/ImageMagick/ImageMagick/commit/8a43abefb38c5e29138e1c9c515b313363541c06", "https://github.com/ImageMagick/ImageMagick/issues/1451", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106850", "https://github.com/ImageMagick/ImageMagick/commit/8a43abefb38c5e29138e1c9c515b313363541c06", "https://github.com/ImageMagick/ImageMagick/issues/1451", "https://usn.ubuntu.com/4034-1/", "https://www.debian.org/security/2020/dsa-4712"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-7395"
imported = 2025-11-25T22:36:00.512Z
modified = 2024-11-21T04:48:08.530Z
published = 2019-02-05T00:29:00.400Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-7395"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-7395"
```

# In ImageMagick before 7.0.8-25, a memory leak exists in WritePSDChannel in coders/psd.c.

In ImageMagick before 7.0.8-25, a memory leak exists in WritePSDChannel in coders/psd.c.

