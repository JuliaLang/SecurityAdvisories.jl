```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy8-1n9cmae"
modified = 2025-11-25T22:36:00.656Z
upstream = ["CVE-2023-34153"]
references = ["https://access.redhat.com/security/cve/CVE-2023-34153", "https://bugzilla.redhat.com/show_bug.cgi?id=2210660", "https://github.com/ImageMagick/ImageMagick/issues/6338", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/", "https://access.redhat.com/security/cve/CVE-2023-34153", "https://bugzilla.redhat.com/show_bug.cgi?id=2210660", "https://github.com/ImageMagick/ImageMagick/issues/6338", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-34153"
imported = 2025-11-25T22:36:00.656Z
modified = 2025-01-10T21:15:12.310Z
published = 2023-05-30T22:15:11.143Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34153"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34153"
```

# A vulnerability was found in ImageMagick

A vulnerability was found in ImageMagick. This security flaw causes a shell command injection vulnerability via video:vsync or video:pixel-format options in VIDEO encoding/decoding.

