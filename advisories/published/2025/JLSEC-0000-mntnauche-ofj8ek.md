```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnauche-ofj8ek"
modified = 2025-11-25T22:36:00.050Z
upstream = ["CVE-2017-11724"]
references = ["http://www.securityfocus.com/bid/104597", "https://github.com/ImageMagick/ImageMagick/issues/624", "https://security.gentoo.org/glsa/201711-07", "http://www.securityfocus.com/bid/104597", "https://github.com/ImageMagick/ImageMagick/issues/624", "https://security.gentoo.org/glsa/201711-07"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11724"
imported = 2025-11-25T22:36:00.050Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-29T05:29:00.203Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11724"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11724"
```

# The ReadMATImage function in coders/mat.c in ImageMagick through 6.9.9-3 and 7.x through 7.0.6-3 has...

The ReadMATImage function in coders/mat.c in ImageMagick through 6.9.9-3 and 7.x through 7.0.6-3 has memory leaks involving the quantum_info and clone_info data structures.

