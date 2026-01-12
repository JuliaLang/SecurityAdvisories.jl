```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucaf-id1te6"
modified = 2025-11-25T22:35:59.799Z
upstream = ["CVE-2017-11523"]
references = ["https://bugs.debian.org/869210", "https://github.com/ImageMagick/ImageMagick/commit/83e0f8ffd7eeb7661b0ff83257da23d24ca7f078", "https://github.com/ImageMagick/ImageMagick/commit/a8f9c2aabed37cd6a728532d1aed13ae0f3dfd78", "https://github.com/ImageMagick/ImageMagick/issues/591", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://www.debian.org/security/2017/dsa-4019", "https://bugs.debian.org/869210", "https://github.com/ImageMagick/ImageMagick/commit/83e0f8ffd7eeb7661b0ff83257da23d24ca7f078", "https://github.com/ImageMagick/ImageMagick/commit/a8f9c2aabed37cd6a728532d1aed13ae0f3dfd78", "https://github.com/ImageMagick/ImageMagick/issues/591", "https://lists.debian.org/debian-lts-announce/2019/05/msg00015.html", "https://www.debian.org/security/2017/dsa-4019"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2017-11523"
imported = 2025-11-25T22:35:59.799Z
modified = 2025-04-20T01:37:25.860Z
published = 2017-07-22T21:29:00.227Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2017-11523"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2017-11523"
```

# The ReadTXTImage function in coders/txt.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 all...

The ReadTXTImage function in coders/txt.c in ImageMagick through 6.9.9-0 and 7.x through 7.0.6-1 allows remote attackers to cause a denial of service (infinite loop) via a crafted file, because the end-of-file condition is not considered.

