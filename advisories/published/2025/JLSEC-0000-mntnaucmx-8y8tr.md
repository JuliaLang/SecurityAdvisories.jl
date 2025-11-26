```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucmx-8y8tr"
modified = 2025-11-25T22:36:00.249Z
upstream = ["CVE-2017-13142"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870105", "https://github.com/ImageMagick/ImageMagick/commit/46e3aabbf8d59a1bdebdbb65acb9b9e0484577d3", "https://github.com/ImageMagick/ImageMagick/commit/aa84944b405acebbeefe871d0f64969b9e9f31ac", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870105", "https://github.com/ImageMagick/ImageMagick/commit/46e3aabbf8d59a1bdebdbb65acb9b9e0484577d3", "https://github.com/ImageMagick/ImageMagick/commit/aa84944b405acebbeefe871d0f64969b9e9f31ac", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13142"
imported = 2025-11-25T22:36:00.249Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.307Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13142"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13142"
```

# In ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1, a crafted PNG file could trigger a crash becau...

In ImageMagick before 6.9.9-0 and 7.x before 7.0.6-1, a crafted PNG file could trigger a crash because there was an insufficient check for short files.

