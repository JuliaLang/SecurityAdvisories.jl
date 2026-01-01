```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mnv31k4ks-1kvfjp2"
modified = 2026-01-01T03:40:07.852Z
upstream = ["CVE-2025-46393"]
references = ["https://github.com/ImageMagick/ImageMagick/commit/81ac8a0d2eb21739842ed18c48c7646b7eef65b8", "https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#711-44---2025-02-22"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1047+0"]

[[jlsec_sources]]
id = "CVE-2025-46393"
imported = 2026-01-01T03:40:07.852Z
modified = 2025-12-31T15:28:43.350Z
published = 2025-04-23T15:16:01.060Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-46393"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2025-46393"
```

# In multispectral MIFF image processing in ImageMagick before 7.1.1-44, packet_size is mishandled (re...

In multispectral MIFF image processing in ImageMagick before 7.1.1-44, packet_size is mishandled (related to the rendering of all channels in an arbitrary order).

