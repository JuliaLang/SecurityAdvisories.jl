```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucq4-ahc2y8"
modified = 2025-11-25T22:36:00.364Z
upstream = ["CVE-2017-13768"]
references = ["http://www.securityfocus.com/bid/100569", "https://github.com/ImageMagick/ImageMagick/issues/706", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "http://www.securityfocus.com/bid/100569", "https://github.com/ImageMagick/ImageMagick/issues/706", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13768"
imported = 2025-11-25T22:36:00.364Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-30T09:29:00.560Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13768"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13768"
```

# Null Pointer Dereference in the IdentifyImage function in MagickCore/identify.c in ImageMagick throu...

Null Pointer Dereference in the IdentifyImage function in MagickCore/identify.c in ImageMagick through 7.0.6-10 allows an attacker to perform denial of service by sending a crafted image file.

