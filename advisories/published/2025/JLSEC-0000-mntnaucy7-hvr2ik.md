```toml
schema_version = "1.7.4"
id = "JLSEC-0000-mntnaucy7-hvr2ik"
modified = 2025-11-25T22:36:00.655Z
upstream = ["CVE-2023-34151"]
references = ["https://access.redhat.com/security/cve/CVE-2023-34151", "https://bugzilla.redhat.com/show_bug.cgi?id=2210657", "https://github.com/ImageMagick/ImageMagick/issues/6341", "https://lists.debian.org/debian-lts-announce/2024/02/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/", "https://access.redhat.com/security/cve/CVE-2023-34151", "https://bugzilla.redhat.com/show_bug.cgi?id=2210657", "https://github.com/ImageMagick/ImageMagick/issues/6341", "https://lists.debian.org/debian-lts-announce/2024/02/msg00007.html", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/4UFQJCYJ23HWHNDOVKBHZQ7HCXXL6MM3/", "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/V2ZUHZXQ2C3JZYKPW4XHCMVVL467MA2V/"]

[[affected]]
pkg = "ImageMagick_jll"
ranges = ["< 7.1.1+0"]

[[jlsec_sources]]
id = "CVE-2023-34151"
imported = 2025-11-25T22:36:00.655Z
modified = 2024-12-02T14:34:36.813Z
published = 2023-05-30T22:15:11.000Z
url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2023-34151"
html_url = "https://nvd.nist.gov/vuln/detail/CVE-2023-34151"
```

# A vulnerability was found in ImageMagick

A vulnerability was found in ImageMagick. This security flaw ouccers as an undefined behaviors of casting double to size_t in svg, mvg and other coders (recurring bugs of CVE-2022-32546).

