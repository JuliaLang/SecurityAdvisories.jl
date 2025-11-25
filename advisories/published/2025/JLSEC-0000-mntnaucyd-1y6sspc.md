```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucyd-1y6sspc"
modified = 2025-11-25T22:36:00.661Z
upstream = ["CVE-2023-3745"]
references = ["https://access.redhat.com/security/cve/CVE-2023-3745", "https://bugzilla.redhat.com/show_bug.cgi?id=2223557", "https://github.com/ImageMagick/ImageMagick/commit/54cdc146bbe50018526770be201b56643ad58ba7", "https://github.com/ImageMagick/ImageMagick/commit/651672f19c75161a6159d9b6838fd3095b6c5304", "https://github.com/ImageMagick/ImageMagick/issues/1857", "https://github.com/ImageMagick/ImageMagick6/commit/7486477aa00c5c7856b111506da075b6cdfa8b73", "https://github.com/ImageMagick/ImageMagick6/commit/b466a96965afc1308a4ace93f5535c2b770f294b", "https://access.redhat.com/security/cve/CVE-2023-3745", "https://bugzilla.redhat.com/show_bug.cgi?id=2223557", "https://github.com/ImageMagick/ImageMagick/commit/54cdc146bbe50018526770be201b56643ad58ba7", "https://github.com/ImageMagick/ImageMagick/commit/651672f19c75161a6159d9b6838fd3095b6c5304", "https://github.com/ImageMagick/ImageMagick/issues/1857", "https://github.com/ImageMagick/ImageMagick6/commit/7486477aa00c5c7856b111506da075b6cdfa8b73", "https://github.com/ImageMagick/ImageMagick6/commit/b466a96965afc1308a4ace93f5535c2b770f294b"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 6.9.11+0"]

[[jlsec_sources]]
id = "CVE-2023-3745"
imported = 2025-11-25T22:36:00.661Z
modified = 2024-11-21T08:17:58.043Z
published = 2023-07-24T16:15:13.130Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-3745"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-3745"
```

# A heap-based buffer overflow issue was found in ImageMagick's PushCharPixel() function in quantum-pr...

A heap-based buffer overflow issue was found in ImageMagick's PushCharPixel() function in quantum-private.h. This issue may allow a local attacker to trick the user into opening a specially crafted file, triggering an out-of-bounds read error and allowing an application to crash, resulting in a denial of service.

