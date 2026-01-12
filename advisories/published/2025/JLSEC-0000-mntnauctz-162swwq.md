```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauctz-162swwq"
modified = 2025-11-25T22:36:00.503Z
upstream = ["CVE-2018-16750"]
references = ["http://www.securityfocus.com/bid/108492", "https://github.com/ImageMagick/ImageMagick/issues/1118", "https://usn.ubuntu.com/3785-1/", "http://www.securityfocus.com/bid/108492", "https://github.com/ImageMagick/ImageMagick/issues/1118", "https://usn.ubuntu.com/3785-1/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2018-16750"
imported = 2025-11-25T22:36:00.503Z
modified = 2024-11-21T03:53:17.367Z
published = 2018-09-09T15:29:00.377Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2018-16750"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2018-16750"
```

# In ImageMagick 7.0.7-29 and earlier, a memory leak in the formatIPTCfromBuffer function in coders/me...

In ImageMagick 7.0.7-29 and earlier, a memory leak in the formatIPTCfromBuffer function in coders/meta.c was found.

