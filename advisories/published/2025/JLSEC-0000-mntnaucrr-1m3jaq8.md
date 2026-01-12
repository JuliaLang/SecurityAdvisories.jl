```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucrr-1m3jaq8"
modified = 2025-11-25T22:36:00.423Z
upstream = ["CVE-2018-6405"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/964", "https://usn.ubuntu.com/3681-1/", "https://github.com/ImageMagick/ImageMagick/issues/964", "https://usn.ubuntu.com/3681-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2018-6405"
imported = 2025-11-25T22:36:00.423Z
modified = 2024-11-21T04:10:38.827Z
published = 2018-01-30T21:29:00.353Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-6405"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-6405"
```

# In the ReadDCMImage function in coders/dcm.c in ImageMagick before 7.0.7-23, each redmap, greenmap, ...

In the ReadDCMImage function in coders/dcm.c in ImageMagick before 7.0.7-23, each redmap, greenmap, and bluemap variable can be overwritten by a new pointer. The previous pointer is lost, which leads to a memory leak. This allows remote attackers to cause a denial of service.

