```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucoc-1s5mnd3"
modified = 2025-11-25T22:36:00.300Z
upstream = ["CVE-2017-13145"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=869830", "https://github.com/ImageMagick/ImageMagick/commit/acee073df34aa4d491bf5cb74d3a15fc80f0a3aa", "https://github.com/ImageMagick/ImageMagick/commit/f13c6b54a879aaa771ec64b5a066b939e8f8e7f0", "https://github.com/ImageMagick/ImageMagick/issues/501", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=869830", "https://github.com/ImageMagick/ImageMagick/commit/acee073df34aa4d491bf5cb74d3a15fc80f0a3aa", "https://github.com/ImageMagick/ImageMagick/commit/f13c6b54a879aaa771ec64b5a066b939e8f8e7f0", "https://github.com/ImageMagick/ImageMagick/issues/501", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13145"
imported = 2025-11-25T22:36:00.300Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.400Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13145"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13145"
```

# In ImageMagick before 6.9.8-8 and 7.x before 7.0.5-9, the ReadJP2Image function in coders/jp2.c does...

In ImageMagick before 6.9.8-8 and 7.x before 7.0.5-9, the ReadJP2Image function in coders/jp2.c does not properly validate the channel geometry, leading to a crash.

