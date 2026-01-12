```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucu7-13rpmr7"
modified = 2025-11-25T22:36:00.511Z
upstream = ["CVE-2018-20467"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106315", "https://github.com/ImageMagick/ImageMagick/commit/db0add932fb850d762b02604ca3053b7d7ab6deb", "https://github.com/ImageMagick/ImageMagick/issues/1408", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4034-1/", "http://lists.opensuse.org/opensuse-security-announce/2019-04/msg00034.html", "http://lists.opensuse.org/opensuse-security-announce/2019-05/msg00006.html", "http://www.securityfocus.com/bid/106315", "https://github.com/ImageMagick/ImageMagick/commit/db0add932fb850d762b02604ca3053b7d7ab6deb", "https://github.com/ImageMagick/ImageMagick/issues/1408", "https://lists.debian.org/debian-lts-announce/2020/08/msg00030.html", "https://usn.ubuntu.com/4034-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2018-20467"
imported = 2025-11-25T22:36:00.511Z
modified = 2024-11-21T04:01:32.737Z
published = 2018-12-26T03:29:00.240Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-20467"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-20467"
```

# In coders/bmp.c in ImageMagick before 7.0.8-16, an input file can result in an infinite loop and han...

In coders/bmp.c in ImageMagick before 7.0.8-16, an input file can result in an infinite loop and hang, with high CPU and memory consumption. Remote attackers could leverage this vulnerability to cause a denial of service via a crafted file.

