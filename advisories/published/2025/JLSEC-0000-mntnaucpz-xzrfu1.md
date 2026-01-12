```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucpz-xzrfu1"
modified = 2025-11-25T22:36:00.359Z
upstream = ["CVE-2017-13658"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870019", "https://github.com/ImageMagick/ImageMagick/commit/e5c063a1007506ba69e97a35effcdef944421c89", "https://github.com/ImageMagick/ImageMagick/issues/598", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870019", "https://github.com/ImageMagick/ImageMagick/commit/e5c063a1007506ba69e97a35effcdef944421c89", "https://github.com/ImageMagick/ImageMagick/issues/598", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://lists.debian.org/debian-lts-announce/2020/09/msg00007.html"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13658"
imported = 2025-11-25T22:36:00.359Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-24T06:29:00.193Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13658"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13658"
```

# In ImageMagick before 6.9.9-3 and 7.x before 7.0.6-3, there is a missing NULL check in the ReadMATIm...

In ImageMagick before 6.9.9-3 and 7.x before 7.0.6-3, there is a missing NULL check in the ReadMATImage function in coders/mat.c, leading to a denial of service (assertion failure and application exit) in the DestroyImageInfo function in MagickCore/image.c.

