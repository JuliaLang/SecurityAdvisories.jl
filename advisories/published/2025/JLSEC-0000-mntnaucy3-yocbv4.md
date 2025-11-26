```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy3-yocbv4"
modified = 2025-11-25T22:36:00.651Z
upstream = ["CVE-2022-3213"]
references = ["https://access.redhat.com/security/cve/CVE-2022-3213", "https://bugzilla.redhat.com/show_bug.cgi?id=2126824", "https://github.com/ImageMagick/ImageMagick/commit/30ccf9a0da1f47161b5935a95be854fe84e6c2a2", "https://github.com/ImageMagick/ImageMagick6/commit/1aea203eb36409ce6903b9e41fe7cb70030e8750", "https://access.redhat.com/security/cve/CVE-2022-3213", "https://bugzilla.redhat.com/show_bug.cgi?id=2126824", "https://github.com/ImageMagick/ImageMagick/commit/30ccf9a0da1f47161b5935a95be854fe84e6c2a2", "https://github.com/ImageMagick/ImageMagick6/commit/1aea203eb36409ce6903b9e41fe7cb70030e8750"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.12+4"]

[[jlsec_sources]]
id = "CVE-2022-3213"
imported = 2025-11-25T22:36:00.651Z
modified = 2024-11-21T07:19:03.863Z
published = 2022-09-19T18:15:09.907Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2022-3213"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2022-3213"
```

# A heap buffer overflow issue was found in ImageMagick

A heap buffer overflow issue was found in ImageMagick. When an application processes a malformed TIFF file, it could lead to undefined behavior or a crash causing a denial of service.

