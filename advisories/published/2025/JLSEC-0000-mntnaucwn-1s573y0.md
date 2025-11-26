```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucwn-1s573y0"
modified = 2025-11-25T22:36:00.599Z
upstream = ["CVE-2020-29599"]
references = ["https://github.com/ImageMagick/ImageMagick/discussions/2851", "https://insert-script.blogspot.com/2020/11/imagemagick-shell-injection-via-pdf.html", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://security.gentoo.org/glsa/202101-36", "https://github.com/ImageMagick/ImageMagick/discussions/2851", "https://insert-script.blogspot.com/2020/11/imagemagick-shell-injection-via-pdf.html", "https://lists.debian.org/debian-lts-announce/2021/01/msg00010.html", "https://lists.debian.org/debian-lts-announce/2023/03/msg00008.html", "https://security.gentoo.org/glsa/202101-36"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2020-29599"
imported = 2025-11-25T22:36:00.599Z
modified = 2024-11-21T05:24:17.280Z
published = 2020-12-07T20:15:12.773Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2020-29599"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2020-29599"
```

# ImageMagick before 6.9.11-40 and 7.x before 7.0.10-40 mishandles the -authenticate option, which all...

ImageMagick before 6.9.11-40 and 7.x before 7.0.10-40 mishandles the -authenticate option, which allows setting a password for password-protected PDF files. The user-controlled password was not properly escaped/sanitized and it was therefore possible to inject additional shell commands via coders/pdf.c.

