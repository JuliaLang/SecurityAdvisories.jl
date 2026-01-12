```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucnk-ilq839"
modified = 2025-11-25T22:36:00.272Z
upstream = ["CVE-2017-13144"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=869728", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2017/dsa-4040", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31438", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=869728", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2017/dsa-4040", "https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31438"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13144"
imported = 2025-11-25T22:36:00.272Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.370Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13144"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13144"
```

# In ImageMagick before 6.9.7-10, there is a crash (rather than a "width or height exceeds limit" erro...

In ImageMagick before 6.9.7-10, there is a crash (rather than a "width or height exceeds limit" error report) if the image dimensions are too large, as demonstrated by use of the mpc coder.

