```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucvc-6nz6wv"
modified = 2025-11-25T22:36:00.552Z
upstream = ["CVE-2019-14980"]
references = ["http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00040.html", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00042.html", "https://github.com/ImageMagick/ImageMagick/commit/c5d012a46ae22be9444326aa37969a3f75daa3ba", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-41...7.0.8-42", "https://github.com/ImageMagick/ImageMagick6/commit/614a257295bdcdeda347086761062ac7658b6830", "https://github.com/ImageMagick/ImageMagick6/issues/43", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00040.html", "http://lists.opensuse.org/opensuse-security-announce/2019-11/msg00042.html", "https://github.com/ImageMagick/ImageMagick/commit/c5d012a46ae22be9444326aa37969a3f75daa3ba", "https://github.com/ImageMagick/ImageMagick/compare/7.0.8-41...7.0.8-42", "https://github.com/ImageMagick/ImageMagick6/commit/614a257295bdcdeda347086761062ac7658b6830", "https://github.com/ImageMagick/ImageMagick6/issues/43"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2019-14980"
imported = 2025-11-25T22:36:00.552Z
modified = 2024-11-21T04:27:48.970Z
published = 2019-08-12T23:15:11.493Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2019-14980"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2019-14980"
```

# In ImageMagick 7.x before 7.0.8-42 and 6.x before 6.9.10-42, there is a use after free vulnerability...

In ImageMagick 7.x before 7.0.8-42 and 6.x before 6.9.10-42, there is a use after free vulnerability in the UnmapBlob function that allows an attacker to cause a denial of service by sending a crafted file.

