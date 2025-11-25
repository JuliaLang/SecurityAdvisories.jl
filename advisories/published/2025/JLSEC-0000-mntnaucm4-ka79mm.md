```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucm4-ka79mm"
modified = 2025-11-25T22:36:00.220Z
upstream = ["CVE-2017-13141"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870116", "https://github.com/ImageMagick/ImageMagick/issues/600", "https://security.gentoo.org/glsa/201711-07", "https://www.debian.org/security/2017/dsa-4019", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870116", "https://github.com/ImageMagick/ImageMagick/issues/600", "https://security.gentoo.org/glsa/201711-07", "https://www.debian.org/security/2017/dsa-4019"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13141"
imported = 2025-11-25T22:36:00.220Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.277Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13141"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13141"
```

# In ImageMagick before 6.9.9-4 and 7.x before 7.0.6-4, a crafted file could trigger a memory leak in ...

In ImageMagick before 6.9.9-4 and 7.x before 7.0.6-4, a crafted file could trigger a memory leak in ReadOnePNGImage in coders/png.c.

