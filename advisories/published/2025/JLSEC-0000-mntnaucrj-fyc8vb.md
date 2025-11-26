```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucrj-fyc8vb"
modified = 2025-11-25T22:36:00.415Z
upstream = ["CVE-2017-1000445"]
references = ["http://www.securityfocus.com/bid/102368", "https://github.com/ImageMagick/ImageMagick/issues/775", "https://lists.debian.org/debian-lts-announce/2018/01/msg00002.html", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://usn.ubuntu.com/3681-1/", "http://www.securityfocus.com/bid/102368", "https://github.com/ImageMagick/ImageMagick/issues/775", "https://lists.debian.org/debian-lts-announce/2018/01/msg00002.html", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://usn.ubuntu.com/3681-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-1000445"
imported = 2025-11-25T22:36:00.415Z
modified = 2024-11-21T03:04:45.087Z
published = 2018-01-02T15:29:00.263Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-1000445"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-1000445"
```

# ImageMagick 7.0.7-1 and older version are vulnerable to null pointer dereference in the MagickCore c...

ImageMagick 7.0.7-1 and older version are vulnerable to null pointer dereference in the MagickCore component and might lead to denial of service

