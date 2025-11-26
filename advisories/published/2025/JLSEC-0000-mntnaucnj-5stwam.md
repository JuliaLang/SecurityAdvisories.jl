```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucnj-5stwam"
modified = 2025-11-25T22:36:00.271Z
upstream = ["CVE-2017-13143"]
references = ["https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870012", "https://github.com/ImageMagick/ImageMagick/commit/51b0ae01709adc1e4a9245e158ef17b85a110960", "https://github.com/ImageMagick/ImageMagick/issues/362", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2018/dsa-4204", "https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870012", "https://github.com/ImageMagick/ImageMagick/commit/51b0ae01709adc1e4a9245e158ef17b85a110960", "https://github.com/ImageMagick/ImageMagick/issues/362", "https://security.gentoo.org/glsa/201711-07", "https://usn.ubuntu.com/3681-1/", "https://www.debian.org/security/2017/dsa-4019", "https://www.debian.org/security/2018/dsa-4204"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-13143"
imported = 2025-11-25T22:36:00.271Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-08-23T06:29:00.340Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-13143"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-13143"
```

# In ImageMagick before 6.9.7-6 and 7.x before 7.0.4-6, the ReadMATImage function in coders/mat.c uses...

In ImageMagick before 6.9.7-6 and 7.x before 7.0.4-6, the ReadMATImage function in coders/mat.c uses uninitialized data, which might allow remote attackers to obtain sensitive information from process memory.

