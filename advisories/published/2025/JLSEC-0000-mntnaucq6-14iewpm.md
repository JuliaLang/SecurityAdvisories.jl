```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucq6-14iewpm"
modified = 2025-11-25T22:36:00.366Z
upstream = ["CVE-2017-13769"]
references = ["https://github.com/ImageMagick/ImageMagick/issues/705", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4032", "https://www.debian.org/security/2017/dsa-4040", "https://github.com/ImageMagick/ImageMagick/issues/705", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4032", "https://www.debian.org/security/2017/dsa-4040"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13769"
imported = 2025-11-25T22:36:00.366Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-30T09:29:00.590Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13769"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13769"
```

# The WriteTHUMBNAILImage function in coders/thumbnail.c in ImageMagick through 7.0.6-10 allows an att...

The WriteTHUMBNAILImage function in coders/thumbnail.c in ImageMagick through 7.0.6-10 allows an attacker to cause a denial of service (buffer over-read) by sending a crafted JPEG file.

