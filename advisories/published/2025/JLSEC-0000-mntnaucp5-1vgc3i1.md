```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucp5-1vgc3i1"
modified = 2025-11-25T22:36:00.329Z
upstream = ["CVE-2017-13146"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870013", "https://github.com/ImageMagick/ImageMagick/commit/79e5dbcdd1fc2f714f9bae548bc55d5073f3ed20", "https://security.gentoo.org/glsa/201711-07", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870013", "https://github.com/ImageMagick/ImageMagick/commit/79e5dbcdd1fc2f714f9bae548bc55d5073f3ed20", "https://security.gentoo.org/glsa/201711-07"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13146"
imported = 2025-11-25T22:36:00.329Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.447Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13146"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13146"
```

# In ImageMagick before 6.9.8-5 and 7.x before 7.0.5-6, there is a memory leak in the ReadMATImage fun...

In ImageMagick before 6.9.8-5 and 7.x before 7.0.5-6, there is a memory leak in the ReadMATImage function in coders/mat.c.

