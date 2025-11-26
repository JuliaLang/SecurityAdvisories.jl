```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauchf-1lpqqpu"
modified = 2025-11-25T22:36:00.051Z
upstream = ["CVE-2017-11750"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/632", "https://github.com/ImageMagick/ImageMagick/issues/632"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11750"
imported = 2025-11-25T22:36:00.051Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-30T17:29:00.303Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11750"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11750"
```

# The ReadOneJNGImage function in coders/png.c in ImageMagick 6.9.9-4 and 7.0.6-4 allows remote attack...

The ReadOneJNGImage function in coders/png.c in ImageMagick 6.9.9-4 and 7.0.6-4 allows remote attackers to cause a denial of service (NULL pointer dereference) via a crafted file.

