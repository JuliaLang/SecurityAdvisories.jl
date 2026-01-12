```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy8-1mjn1uf"
modified = 2025-11-25T22:36:00.656Z
upstream = ["CVE-2023-34152"]
references = ["https://access.redhat.com/security/cve/CVE-2023-34152", "https://bugzilla.redhat.com/show_bug.cgi?id=2210659", "https://github.com/ImageMagick/ImageMagick/issues/6339", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/", "https://access.redhat.com/security/cve/CVE-2023-34152", "https://bugzilla.redhat.com/show_bug.cgi?id=2210659", "https://github.com/ImageMagick/ImageMagick/issues/6339", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-34152"
imported = 2025-11-25T22:36:00.656Z
modified = 2025-01-13T19:15:10.400Z
published = 2023-05-30T22:15:11.070Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34152"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34152"
```

# A vulnerability was found in ImageMagick

A vulnerability was found in ImageMagick. This security flaw cause a remote code execution vulnerability in OpenBlob with --enable-pipes configured.

